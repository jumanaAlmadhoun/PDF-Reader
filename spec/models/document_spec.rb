require "rails_helper"

RSpec.describe Document, type: :model do
  it "is invalid without a title" do
    document = build(:document, title: nil)
    expect(document).not_to be_valid
  end

  it "is invalid without a pdf_file" do
    document = Document.new(title: "Test")
    expect(document).not_to be_valid
  end

  it "is valid with title and pdf_file" do
    document = create(:document)
    expect(document).to be_valid
  end
end
