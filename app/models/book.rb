class Book < ActiveRecord::Base
  has_many :lend_books
  has_many :users, through: :lend_books
  validates :title, presence: true#, uniqueness: { case_insensitive: true }
  validates :author, presence: true

  def self.search(query)
    joins('INNER JOIN lend_books ON books.id = lend_books.book_id').where("title iLIKE ? OR author iLIKE ?", "%#{query}%", "%#{query}%")
  end
end
