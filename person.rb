require_relative 'interface'
require "json"

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  # def self.from_json(string)
  #   data = JSON.load string
  #   self.new(data['name'], data['age'], data['gender'])
  # end

  private

  def of_age?
    @age >= 18
  end
end
