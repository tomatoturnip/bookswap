class Book < ActiveRecord::Base
  has_many :lend_books
  has_many :users, through: :lend_books
  validates :title, presence: true, uniqueness: { case_insensitive: true }
  validates :author, presence: true

  def self.search(query)
    joins(:book)
    .where('to_tsvector(books.title || books.author) @@ plainto_tsquery(?)', query)
      .includes(:book, user: [:location])
  end
end
