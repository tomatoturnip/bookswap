require 'spec_helper'

feature 'delete a book from My Lend List', %Q{
  As a registered bookswapper
  I want to be able to delete books on my lend list
  So that I can control what is on my lend list
  } do

  # Acceptance criteria:
  # * able to access list of books I am lending
  # * can delete a book a book from list

  scenario 'delete a book' do
    FactoryGirl.create(:book)
    visit lend_books_path
    book_count = Book.count
    expect(page).to have_content('Mindy')

    click_on 'Delete'
    expect(page).to_not have_content('Mindy')
    expect(Book.count).to eql(book_count - 1)
  end
end
