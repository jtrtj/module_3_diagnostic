require 'rails_helper'

feature "User can visit root page" do
  scenario "and search with their zip code to see a list of the 10 nearest staitons", :vcr do
    visitor_zip = 80203

    visit '/'
    fill_in :q,	with: "#{visitor_zip}" 
    click_button 'Locate'

    expect(page).to have_content("Stations within 6 miles:")
    expect(page).to have_css(".station", count: 10)
    expect(page).to have_css(".station-address", count: 10)
    expect(page).to have_css(".station-fuel-types", count: 10)
    expect(page).to have_css(".station-distance", count: 10)
    expect(page).to have_css(".station-access-times", count: 10)
  end
end


=begin
As a user
When I visit "/"
And I fill in the search form with 80203 (Note: Use the existing search form)
And I click "Locate"
Then I should be on page "/search"
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
=end