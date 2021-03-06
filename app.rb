require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylist') do
  erb(:stylists)
end

post('/') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  license_number = params.fetch("license_number").to_i
  new_stylist = Stylist.new(:first_name => first_name, :last_name => last_name, :cosmetology_lic_number => license_number)
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

delete('/') do
  Stylist.delete(params.fetch('stylist_id').to_i)
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id'))
  @clients = @stylist.clients()
  erb(:stylist)
end

post('/stylist/:id') do
  first_name = params.fetch("first_name_client")
  last_name = params.fetch("last_name_client")
  stylist_id = params.fetch("id").to_i
  new_client = Client.new(:first_name => first_name, :last_name => last_name, :stylist_id => stylist_id)
  new_client.save()
  @stylist = Stylist.find(params.fetch('id'))
  @clients = @stylist.clients()
  erb(:stylist)
end

patch('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id'))
  first_name = params.fetch("first_name")
  if first_name.empty?()
    first_name = @stylist.first_name()
  end
  last_name = params.fetch("last_name")
  if last_name.empty?()
    last_name = @stylist.last_name()
  end
  license_number = params.fetch("license_number").to_i
  if license_number == 0 || license_number == nil
    license_number = @stylist.cosmetology_lic_number()
  end
  @stylist.update({:first_name => first_name, :last_name => last_name, :cosmetology_lic_number => license_number})
  @clients = @stylist.clients()
  erb(:stylist)
end

delete('/stylist/:id') do
  Client.delete(params.fetch('client_id').to_i)
  @stylist = Stylist.find(params.fetch('id'))
  @clients = @stylist.clients()
  erb(:stylist)
end

get('/clear') do
  DB.exec("DELETE FROM stylists *;")
  DB.exec("DELETE FROM clients *;")
  erb(:success)
end
