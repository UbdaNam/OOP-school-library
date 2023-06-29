require_relative '../teacher'

describe Teacher do
  context 'Tests for teacher class' do
    let(:teacher) { Teacher.new(24, 'Doctor', 'Nam', parent_permission: false) }

    it 'Should create new teacher obj' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'Should set specialization correctly' do
      specialization = teacher.specialization
      expect(specialization).to eq 'Doctor'
    end

    it 'can_use_services? method should return true always ' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
