class Stylist
  attr_reader(:first_name, :last_name, :cosmetology_lic_number, :id)

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @cosmetology_lic_number = attributes.fetch(:cosmetology_lic_number)
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    returned_stylists = DB.exec('SELECT * FROM stylists')
    stylists = []
    returned_stylists.each do |stylist|
      current_stylist = Stylist.new(:name => stylist['name'], :id => stylist['id'])
      stylists.push(current_stylist)
    end
    stylists
  end

  def save
    returned_id = DB.exec("INSERT INTO stylists(first_name, last_name, cosmetology_lic_number) Values ('#{@first_name}', '#{@last_name}', #{@cosmetology_lic_number}) RETURNING id;")
    @id = returned_id.first['id'].to_i
  end


end
