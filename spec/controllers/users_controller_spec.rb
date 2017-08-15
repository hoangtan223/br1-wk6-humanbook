require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "user is logged in" do
    describe "GET #index" do
      it "returns a success response" do
        user = User.create name: "Adam", email: "adam@example.com", password: "asdfasdf"
        get :index, params: {}, session: {user_id: user.id}
        expect(response).to be_success
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
