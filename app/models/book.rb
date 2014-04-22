class Book < ActiveRecord::Base
  has_many :lend_books
  has_many :users, through: :lend_books
  validates :title, presence: true#, uniqueness: { case_insensitive: true }
  validates :author, presence: true

  def self.search(query)
    select('books.*, users.username AS user_name')
    .joins('INNER JOIN lend_books ON books.id = lend_books.book_id')
    .joins('INNER JOIN users ON lend_books.user_id = users.id')
    .where("title iLIKE '%#{query}%' OR author iLIKE '%#{query}%' ")
  end
end
