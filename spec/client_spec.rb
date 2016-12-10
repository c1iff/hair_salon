require('spec_helper')
require('pry')

describe(Client) do

  describe('.all') do
    it('starts off with empty array') do
      expect(Client.all).to(eq([]))
    end
  end

  describe('#first_name') do
    it('returns the clients first name') do
      new_client = Client.new(:first_name => 'Jimi', :last_name => 'Hendrix', :stylist_id => 1)
      expect(new_client.first_name).to(eq('Jimi'))
    end
  end

  describe('#last_name') do
    it('returns the clients last name') do
      new_client = Client.new(:first_name => 'Jimi', :last_name => 'Hendrix', :stylist_id => 1)
      expect(new_client.last_name).to(eq('Hendrix'))
    end
  end

  describe("#==") do
    it("is the same client if it has the same first_name, last_name, cosmetology_lic_number, id") do
      new_client = Client.new(:first_name => 'Jimi', :last_name => 'Hendrix', :stylist_id => 1)
      new_client.save()
      new_client_two = Client.new(:first_name => 'Jimi', :last_name => 'Hendrix', :stylist_id => 1)
      new_client_two.save()
      expect(new_client).to(eq(new_client_two))
    end
  end

  describe('.find') do
    it('returns a client by an id number') do
      new_client = Client.new(:first_name => 'Jimi', :last_name => 'Hendrix', :stylist_id => 1)
      new_client.save()
      new_client_two = Client.new(:first_name => 'Jimi', :last_name => 'Hendrix', :stylist_id => 1)
      new_client_two.save()
      expect(Client.find(new_client.id)).to(eq(new_client))
    end
  end

  describe("#update") do
    it("lets you update a client in the database") do
      new_client = Client.new(:first_name => 'David', :last_name => 'Bowie', :stylist_id => 1)
      new_client.save()
      new_client.update({:stylist_id => 2})
      expect(new_client.stylist_id()).to(eq(2))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      new_client = Client.new(:first_name => 'David', :last_name => 'Bowie', :stylist_id => 1)
      new_client.save()
      new_client_two = Client.new(:first_name => 'Jimmy', :last_name => 'Page', :stylist_id => 2)
      new_client_two.save()
      Client.delete(new_client.id())
      expect(Client.all()).to(eq([new_client_two]))
    end
  end
end
