require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require "./modules/save_data.rb"
require "./modules/load_data.rb"
require "json"

class App
  include SaveData
  include LoadData

  def initialize
    @students = []
    @teachers = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts
    puts 'Book List'
    @books.each_with_index do |book, index|
      puts "Book #{index + 1}. #{book[:title]} written by #{book[:author]}"
    end
    puts
  end

  def list_all_people
    puts
    puts 'People List'
    @students.each_with_index do |student, index|
      puts "[Student] #{index + 1}. Name: #{student[:name]}, ID: #{student[:id]}, Age: #{student[:age]}"
    end
    @teachers.each_with_index do |teacher, index|
      puts "[Teacher] #{index + 1}. Name: #{teacher[:name]}, ID: #{teacher[:id]}, Age: #{teacher[:age]}"
    end
    puts
  end

  def create_student
    puts
    puts 'Enter student name:'
    name = gets.chomp
    puts 'Enter student age:'
    age = gets.chomp.to_i
    puts "Enter student's classroom:"
    classroom = gets.chomp
    puts 'Does student have parent permission [Y/N]:'
    have_permission = gets.chomp.downcase
    have_permission = have_permission == 'y'
    student = Student.new(age, classroom, name, parent_permission: have_permission)
    @students << student.to_json
    puts 'Student created successfully'
    puts
  end

  def create_teacher
    puts
    puts 'Enter teacher name:'
    name = gets.chomp
    puts 'Enter teacher age:'
    age = gets.chomp.to_i
    puts "Enter teacher's specialization:"
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @teachers << teacher.to_json
    puts 'Teacher created successfully'
    puts
  end

  def create_person
    puts
    puts 'Please choose an option:'
    puts '1. Create student'
    puts '2. Create teacher'

    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option, please try again.'
    end
  end

  def create_book
    puts
    puts 'Enter title of the book:'
    title = gets.chomp
    puts 'Enter author name:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book.to_json
    puts 'Book created successfully'
    puts
  end

  def list_people
    puts
    if (@students.length + @teachers.length).zero?
      puts 'Please create person first'
      puts
      nil
    else

      puts 'Choose a person from the below options:'
      puts 'People List'
      @students.each_with_index do |student, index|
        puts "#{index + 1}) [Student #{index + 1}] Name: #{student[:name]}, ID: #{student[:id]}, Age: #{student[:age]}"
      end
      @teachers.each_with_index do |teacher, index|
        print "#{@students.length + index + 1}) [Teacher #{index + 1}] "
        puts "Name: #{teacher[:name]}, ID: #{teacher[:id]}, Age: #{teacher[:age]}"
      end
    end
  end

  def list_books
    puts 'Book List'
    if @books.empty?
      puts 'Please, create a book first'
      puts
      nil
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) [Book #{index + 1}] #{book[:title]} written by #{book[:author]}"
      end
    end
  end

  def create_rental
    list_people
    index = gets.chomp.to_i
    person = if index <= @students.length
               @students[index - 1]
             else
               @teachers[index - 1 - @students.length]
             end
    puts 'Choose a book from the below options:'
    list_books
    book_index = gets.chomp.to_i
    book = @books[book_index - 1]
    puts 'Enter rental date (DD/MM/YYYY):'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental.to_json
    puts 'Rental created successfully'
    puts
  end

  def list_rentals_by_id
    puts 'Enter id of the person:'
    id = gets.chomp.to_i
    person_rentals = @rentals.select { |rental| rental[:person][:id] == id }
    if person_rentals.empty?
      puts 'There are no rentals for this person'
      puts
      nil
    else
      person_rentals.each_with_index do |rental, index|
        print "#{index + 1}) [Rental #{index + 1}] "
        puts "Date: #{rental[:date]}, Book: #{rental[:book][:title]} written by #{rental[:book][:author]}"
      end
    end
  end
end
