class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize (title, author)
    @title = label
    @author = author
    @rentals = []
  end

end