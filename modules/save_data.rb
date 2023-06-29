module SaveData
  def save_books
    json = JSON.pretty_generate(@books)
    File.write("./data/books.json", json)
  end

  def save_peoples
    json = JSON.pretty_generate(@students + @teachers)
    File.write("./data/users.json", json)
  end

  def save_rentals
    json = JSON.pretty_generate(@rentals)
    File.write("./data/rentals.json", json)
  end

  def save_data
    save_books
    save_peoples
    save_rentals
    exit
  end
end
