FactoryBot.define do
  factory :document do
    title { "Sample Document" }

    after(:build) do |document|
      document.pdf_file.attach(
        io: StringIO.new("test pdf content"),
        filename: "test.pdf",
        content_type: "application/pdf"
      )
    end
  end
end
