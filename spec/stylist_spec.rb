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
    it('returns the stylists first name') do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      expect(new_stylist.last_name).to(eq('Bowie'))
    end
  end

  describe('#cosmetology_lic_number') do
    it('returns the stylists first name') do
      new_stylist = Stylist.new(:first_name => 'David', :last_name => 'Bowie', :cosmetology_lic_number => 123456)
      expect(new_stylist.cosmetology_lic_number).to(eq(123456))
    end
  end
end
