class LendBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def self.search(query)
    joins(:book)
      .where('to_tsvector(books.title || books.author) @@ plainto_tsquery(?)', query)
      .includes(:book, user: [:location])
  end
end
