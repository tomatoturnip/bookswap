require 'spec_helper'

feature 'reader adds a book to borrow-list', %Q{
  As a registered bookswapper
  I want to list the books I want to borrow
  So that others can see books I am looking to borrow
  } do

  # Acceptance criteria:
  # * able to access list of books I am lending
  # * able to access my profile
  # * can add a book or delete a book from list

  context 'as an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'fills out new book form with required info' do
      visit new_book_path
      fill_in 'Title', with: 'Catch-22'
      fill_in 'Author', with: 'Joseph Heller'
      click_button 'submit'

      expect(page).to have_content('Successfully added book')
      expect(Book.count).to eq(1)
    end

  end

  context 'as a guest' do

    scenario 'redirected to sign in when attempt to add book'
    pending
  end

end
