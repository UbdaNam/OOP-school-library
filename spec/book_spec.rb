require_relative "../book.rb"

describe Book do 
  context "Tests for Book class" do
    let(:book) { Book.new("Atomic habits", "Author 1") }

    it "Should create new book" do 
      expect(book).to be_an_instance_of(Book)
    end
    
    it "Should create new book" do 
      title = book.title
      expect(title).to eq "Atomic habits"
    end

  end
end