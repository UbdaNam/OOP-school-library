require 'rspec'
require_relative '../rental'

describe Rental do
  let(:date) { '2023-06-30' }
  let(:book) { { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', rentals: [] } }
  let(:person) { { id: 1, name: 'John Doe', rentals: [] } }

  subject { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'adds the rental to the book rentals list' do
      expect(book[:rentals]).to be_empty
      subject
      expect(book[:rentals]).to contain_exactly({ date: '2023-06-30', person_id: 1 })
    end

    it 'adds the rental to the person rentals list' do
      expect(person[:rentals]).to be_empty
      subject
      expect(person[:rentals]).to contain_exactly({ date: '2023-06-30', book_title: 'The Great Gatsby', book_author: 'F. Scott Fitzgerald' })
    end
  end
end
