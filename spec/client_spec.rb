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
      new_client = Client.new(:first_name => 'David', :last_name => 'Bowie')
      expect(new_client.first_name).to(eq('David'))
    end
  end

  describe('#last_name') do
    it('returns the clients last name') do
      new_client = Client.new(:first_name => 'David', :last_name => 'Bowie')
      expect(new_client.last_name).to(eq('Bowie'))
    end
  end
end
