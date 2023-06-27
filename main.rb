require_relative 'app'

def getOptions
  {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_by_id,
    7 => :exit
  }
end

def menu
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Exit'
end

def trigger_choice(option, app)
  options = getOptions
  if options.key?(option)
    app.send(options[option])
  else
    puts 'Invalid option, please try again.'
  end
end

def main
  app = App.new
  puts 'Welcome to my School Library'
  loop do
    menu
    option = gets.chomp.to_i
    trigger_choice(option, app)
  end
end

main
