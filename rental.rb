class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book[:rentals] << {
      date: self.date,
      person_id: self.person[:id]
    }
    person[:rentals] << {
      date: self.date,
      book_title: self.book[:title],
      book_author: self.book[:author]
    }
  end

  def to_json(*_args)
    {
      date: @date,
      book: @book,
      person: @person
    }
  end
end
