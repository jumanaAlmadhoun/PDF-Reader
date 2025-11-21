require "rails_helper"

RSpec.describe DocumentsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      document = create(:document)
      get :show, params: {id: document.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Document" do
        expect {
          post :create, params: {document: {title: "Test Document", pdf_file: fixture_file_upload("test.pdf", "application/pdf")}}
        }.to change(Document, :count).by(1)
      end

      it "redirects to the created document" do
        post :create, params: {document: {title: "Test Document", pdf_file: fixture_file_upload("test.pdf", "application/pdf")}}
        expect(response).to redirect_to(Document.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Document" do
        expect {
          post :create, params: {document: {title: ""}}
        }.to change(Document, :count).by(0)
      end
    end
  end
end
