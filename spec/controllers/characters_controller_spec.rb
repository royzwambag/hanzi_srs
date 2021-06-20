require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
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
      character = Character.create!(valid_attributes)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      character = Character.create!(valid_attributes)
      get :show, params: {id: character.to_param}, session: valid_session
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
      character = Character.create!(valid_attributes)
      get :edit, params: {id: character.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Character" do
        expect {
          post :create, params: {character: valid_attributes}, session: valid_session
        }.to change(Character, :count).by(1)
      end

      it "successfully creates the character" do
        post :create, params: {character: valid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      it "returns a unsuccesful response (i.e. to display the 'new' template)" do
        post :create, params: {character: invalid_attributes}, session: valid_session
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

      it "updates the requested character" do
        character = Character.create! valid_attributes
        put :update, params: {id: character.to_param, character: new_attributes}, session: valid_session
        character.reload
        
        expect(character.value).to eql("another_test")
        expect(character.pinyin).to eql("another_test")
        expect(character.english_translation).to eql("test")
      end

      it "redirects to the character" do
        character = Character.create!(valid_attributes)
        put :update, params: {id: character.to_param, character: valid_attributes}, session: valid_session
        expect(response).to redirect_to(character)
      end
    end

    context "with invalid params" do
      it "returns a failure response (i.e. to display the 'edit' template)" do
        character = Character.create!(valid_attributes)
        put :update, params: {id: character.to_param, character: invalid_attributes}, session: valid_session
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      character = Character.create!(valid_attributes)
      expect {
        delete :destroy, params: {id: character.to_param}, session: valid_session
      }.to change(Character, :count).by(-1)
    end

    it "redirects to the characters list" do
      character = Character.create!(valid_attributes)
      delete :destroy, params: {id: character.to_param}, session: valid_session
      expect(response).to redirect_to(characters_url)
    end
  end
end
