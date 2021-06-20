require 'rails_helper'

RSpec.describe PhrasesController, type: :controller do
  let(:valid_attributes) {
    {
      value: "test",
      pinyin: "test",
      english_translation: "test"
    }
  }

  let(:invalid_attributes) {
    {
      value: nil,
      pinyin: nil,
      english_translation: "test"
    }

  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      phrase = Phrase.create!(valid_attributes)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      phrase = Phrase.create!(valid_attributes)
      get :show, params: {id: phrase.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      phrase = Phrase.create!(valid_attributes)
      get :edit, params: {id: phrase.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Phrase" do
        expect {
          post :create, params: {phrase: valid_attributes}, session: valid_session
        }.to change(Phrase, :count).by(1)
      end

      it "successfully creates the phrase" do
        post :create, params: {phrase: valid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      it "returns a unsuccesful response (i.e. to display the 'new' template)" do
        post :create, params: {phrase: invalid_attributes}, session: valid_session
        expect(response).not_to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          value: "another_test",
          pinyin: "another_test",
          english_translation: "test"
        }
      }

      it "updates the requested phrase" do
        phrase = Phrase.create! valid_attributes
        put :update, params: {id: phrase.to_param, phrase: new_attributes}, session: valid_session
        phrase.reload
        
        expect(phrase.value).to eql("another_test")
        expect(phrase.pinyin).to eql("another_test")
        expect(phrase.english_translation).to eql("test")
      end

      it "redirects to the phrase" do
        phrase = Phrase.create!(valid_attributes)
        put :update, params: {id: phrase.to_param, phrase: valid_attributes}, session: valid_session
        expect(response).to redirect_to(phrase)
      end
    end

    context "with invalid params" do
      it "returns a failure response (i.e. to display the 'edit' template)" do
        phrase = Phrase.create!(valid_attributes)
        put :update, params: {id: phrase.to_param, phrase: invalid_attributes}, session: valid_session
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      phrase = Phrase.create!(valid_attributes)
      expect {
        delete :destroy, params: {id: phrase.to_param}, session: valid_session
      }.to change(Phrase, :count).by(-1)
    end

    it "redirects to the phrases list" do
      phrase = Phrase.create!(valid_attributes)
      delete :destroy, params: {id: phrase.to_param}, session: valid_session
      expect(response).to redirect_to(phrases_url)
    end
  end
end
