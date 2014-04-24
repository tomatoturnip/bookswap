class LendBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def self.search(query)
    joins(:book)
      .where('to_tsvector(books.title || books.author) @@ plainto_tsquery(?)', query)
      .includes(:book, user: [:location])
  end

  # def self.search(query, current_user)
  #   joins(:book)
  #   .where('(to_tsvector(books.title || books.author) @@ plainto_tsquery(?)) AND lend_books.user_id != ?', query, current_user.id)
  #   .includes(:book, user: [:location])
  # end
end
