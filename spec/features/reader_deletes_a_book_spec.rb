require 'spec_helper'

feature 'delete a book from My Bookshelf' do
  scenario 'delete a book' do
    FactoryGirl.create(:book)
    visit books_path
    book_count = Book.count
    expect(page).to have_content('Mindy')

    click_on 'Delete'
    expect(page).to_not have_content('Mindy')
    expect(Book.count).to eql(book_count - 1)
  end
end
