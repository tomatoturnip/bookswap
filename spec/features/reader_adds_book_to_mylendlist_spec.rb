require 'spec_helper'

feature 'reader adds a book to My Lender List', %Q{
  As a registered bookswapper
  I want to be able to add books to my lend list
  So that others can see books I am lending
  } do

  # Acceptance criteria:
  # * able to access list of books I am lending
  # * can add a book a book from list

  context 'as an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'fills out new book form with required info' do
      visit new_lend_book_path
      fill_in 'Title', with: 'Catch-22'
      fill_in 'Author', with: 'Jack Hellyer'
      click_button 'submit'

      expect(page).to have_content('Successfully added book')
      expect(Book.count).to eq(1)
      save_and_open_page
    end

  end

  context 'as a guest' do

    scenario 'redirected to sign in when attempt to add book'
    pending
  end

end
