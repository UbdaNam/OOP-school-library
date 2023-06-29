module LoadData
  def load_books
    books = JSON.load File.read("./data/books.json")
    if !books.nil?
      books.each { |book|
      book_hash = JSON.parse(book.to_json).transform_keys { |key| key.to_sym }
      @books << book_hash
      }
    end
  end

  def load_people
    users = JSON.load File.read("./data/users.json")
    if !users.nil?
      users.each { |user|
      user_hash = JSON.parse(user.to_json).transform_keys { |key| key.to_sym }
      user_hash.has_key?(:specialization) ? @teachers << user_hash : @students << user_hash
      }
    end
  end

  def load_data
    load_books
    load_people
  end
end