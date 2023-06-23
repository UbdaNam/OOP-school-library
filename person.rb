require "./interface.rb"
require "./CapitalizeDecorator.rb"
require "./TrimmerDecorator.rb"

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

#example to test out decorated class person
person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
puts capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name