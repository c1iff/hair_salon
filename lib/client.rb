class Client
  attr_reader(:first_name, :last_name, :id)

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    returned_clients = DB.exec('SELECT * FROM clients')
    clients = []
    returned_clients.each do |client|
      current_client = Stylist.new(:name => client['name'], :id => client['id'])
      clients.push(current_client)
    end
    clients
  end

  def save
    returned_id = DB.exec("INSERT INTO clients(first_name, last_name, cosmetology_lic_number) Values ('#{@first_name}', '#{@last_name}') RETURNING id;")
    @id = returned_id.first['id'].to_i
  end
end
