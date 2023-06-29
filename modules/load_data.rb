module LoadData
  def load_books
    return unless File.exist?('./data/books.json')

    books = JSON.parse File.read('./data/books.json')
    return if books.nil?

    books.each do |book|
      book_hash = JSON.parse(book.to_json).transform_keys(&:to_sym)
      @books << book_hash
    end
  end

  def load_people
    return unless File.exist?('./data/users.json')

    users = JSON.parse File.read('./data/users.json')
    return if users.nil?

    users.each do |user|
      user_hash = JSON.parse(user.to_json).transform_keys(&:to_sym)
      user_hash.key?(:specialization) ? @teachers << user_hash : @students << user_hash
    end
  end

  def load_rentals
    return unless File.exist?('./data/rentals.json')

    rentals = JSON.parse File.read('./data/rentals.json')
    return if rentals.nil?

    rentals.each do |rental|
      rental_hash = JSON.parse(rental.to_json).transform_keys(&:to_sym)
      rental_hash[:book] = rental_hash[:book].transform_keys(&:to_sym)
      rental_hash[:person] = rental_hash[:person].transform_keys(&:to_sym)
      @rentals << rental_hash
    end
  end

  def load_data
    load_books
    load_people
    load_rentals
  end
end
