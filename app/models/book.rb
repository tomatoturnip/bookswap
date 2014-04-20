class Book < ActiveRecord::Base
  has_many :lend_books
  has_many :users, through: :lend_books
  validates :title, presence: true#, uniqueness: { case_insensitive: true }
  validates :author, presence: true
end
