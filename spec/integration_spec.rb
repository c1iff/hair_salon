require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    fill_in('first_name', :with =>'David')
    fill_in('last_name', :with =>'Bowie')
    fill_in('license_number', :with =>'123456')
    click_button('Add Stylist')
    expect(page).to have_content('David Bowie')
  end
end
