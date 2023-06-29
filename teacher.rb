require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json
    {
      :id => @id,
      :name => @name,
      :age => @age,
      :parent_permission => @parent_permission,
      :specialization => @specialization,
      :rentals => @rentals
    }
  end

end
