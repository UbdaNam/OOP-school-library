require_relative '../student'

describe Student do
  context 'Tests for student class' do
    let(:student) { Student.new(24, 'A', 'Ubda', parent_permission: false) }

    it 'Should create new student' do
      expect(student).to be_an_instance_of(Student)
    end

    it 'Should set name correctly' do
      name = student.name
      expect(name).to eq 'Ubda'
    end

    it 'Play_hooky should return "¯(ツ)/¯" ' do
      expect(student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
