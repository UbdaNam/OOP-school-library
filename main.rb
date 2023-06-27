require_relative 'app'
require_relative 'menu'

def trigger_choice(options, option, app)
  if options.key?(option)
    app.send(options[option])
  else
    puts 'Invalid option, please try again.'
  end
end

def main
  app = App.new
  menu = Menu.new
  puts 'Welcome to my School Library'
  loop do
    menu.get_menu
    user_choice = gets.chomp.to_i
    options = menu.get_options
    trigger_choice(options, user_choice, app)
  end
end

main
