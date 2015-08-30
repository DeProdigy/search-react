require 'rails_helper'

feature 'Searching', js: true do

  scenario 'When I visit the main page I see basic layout' do
    visit root_path

    expect(page).to have_content 'Welcome to database search'
    expect(page).to have_css '#search-form'
  end

  scenario 'When I fill in input, the button text changes' do
    visit root_path

    expect(find('#search-form')).to have_button 'All'

    fill_in('Search Input', :with => 'something')
    expect(find('#search-form')).to have_button 'Search'
  end

  scenario 'When I look up all the data' do
    visit root_path

    click_button 'All'
    expect(page).to have_css('.result', count: 500)
  end

end