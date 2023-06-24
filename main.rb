require_relative "app.rb"

def main
  app = App.new()
  puts "Welcome to my School Library"
  loop do
    puts "Please choose an option:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a given person id"
    puts "7. Exit"
  
    option = gets.chomp.to_i
  
    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_by_id
    when 7
      puts "Good bye"
      break
    else
      puts "Invalid option, please try again."
    end
  end
  
end

main()