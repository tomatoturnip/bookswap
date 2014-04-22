require 'spec_helper'

feature 'user searches for a book', %Q{
  As a registered bookswapper
  I want to be able to search for books
  So that I can find out if anyone has a book I want to borrow
  } do

  # Acceptance criteria:
  # * sees list of books I am lending
  # * sees list of books I want to borrow
  # * able to access my profile
  # * can search for a book using title and/or author

  scenario 'a user (registered or not) wishes to search for books' do
    visit books_path

    expect(page).to have_button('Search')
  end

  scenario 'a user can enter a query into a search bar and return book results' do
    book = FactoryGirl.create(:book, title: 'One More Thing')

    visit books_path

    fill_in 'search', with: 'One More Thing'
    click_on 'Search'

    expect(page).to have_content('Search Results')
    expect(page).to have_content('One More Thing')
  end

end


