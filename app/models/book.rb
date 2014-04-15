class Book < ActiveRecord::Base
  has_many :users
  has_many :users, through: :lend_books
  validates :title, presence: true
  validates :author, presence: true
end
