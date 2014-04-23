require 'spec_helper'

feature 'delete a book from My Lender List', %Q{
  As a registered bookswapper
  I want to be able to delete books on my lender list
  So that I can control what is on my lender list
  } do

  # Acceptance criteria:
  # * able to access list of books I am lending
  # * can delete a book a book from list

  context 'as an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'delete a book' do
      book = FactoryGirl.create(:book, title: 'The Bedwetter', author: 'Sarah Silverman')

      visit new_book_path
      fill_in 'Title', with: book.title
      fill_in 'Author', with: book.author
      click_on 'submit'

      visit books_path
      click_button 'Add to Lender List'

      prev_count = Book.count

      click_on 'Delete'

      expect(Book.count).to eql(prev_count - 1)
    end
  end
end
