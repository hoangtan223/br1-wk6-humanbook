require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    {name: "Adam", email: "adam@example.com", password: "asdfasdf"}
  }

  let(:valid_user) {
    User.create(valid_attributes)
  }

  let(:valid_session) {
    { user_id: valid_user.id}
  }

  context "user is logged in" do
    describe "GET #index" do
      it "returns a success response" do
        user = valid_user
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end

      it "loads all user" do
        user = valid_user
        get :index, params: {}, session: valid_session

        expect(assigns(:users)).to eq [user]
      end
    end
  end

  context "user is NOT logged in" do
    describe "GET #index" do
      it "redirects to the home page" do
        get :index, params: {}, session: {}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
