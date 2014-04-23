class LendBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  # def self.search(query)
  #   joins(:book)
  #     # .where("books.title ILIKE ? OR books.author ILIKE ?",
  #     #   "%#{query}%", "%#{query}%")
  #     # .where(to_tsvector(title || author) @@ plainto_tsquery("%#{query}%"))
  #     .where("books.title @@ :q OR books.author @@ :q", q: "%#{query}%")
  #     .includes(:book, user: [:location])
  # end

  def self.search(query)
    joins(:book)
      .where("books.title @@ :q OR books.author @@ :q", q: query)
      .includes(:book, user: [:location])
  end
end
