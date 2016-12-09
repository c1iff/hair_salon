require('spec_helper')
require('pry')

describe(Stylist) do

  describe('.all') do
    it('starts off with empty array') do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe('#first_name') do
    it('returns the stylists first name') do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      expect(new_stylist.first_name).to(eq('David'))
    end
  end

  describe('#last_name') do
    it('returns the stylists last name') do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      expect(new_stylist.last_name).to(eq('Bowie'))
    end
  end

  describe('#cosmetology_lic_number') do
    it('returns the stylists cosmetology licence number') do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      expect(new_stylist.cosmetology_lic_number).to(eq(123456))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same first_name, last_name, cosmetology_lic_number, id") do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      new_stylist.save()
      new_stylist_two = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      new_stylist_two.save()
      expect(new_stylist).to(eq(new_stylist_two))
    end
  end

  describe('.find') do
    it('returns a stylist by an id number') do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      new_stylist.save()
      new_stylist_two = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      new_stylist_two.save()
      expect(Stylist.find(new_stylist.id)).to(eq(new_stylist))
    end
  end

  describe('#clients') do
    it('returns and array of clients for that stylist') do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      new_stylist.save()
      new_client = Client.new(:first_name => 'Janis', :last_name => 'Joplin', :stylist_id => new_stylist.id)
      new_client.save()
      new_client_two = Client.new(:first_name => 'Jimi', :last_name => 'Hendrix', :stylist_id => new_stylist.id)
      new_client_two.save()
      expect(new_stylist.clients()).to(eq([new_client, new_client_two]))
    end
  end
end
