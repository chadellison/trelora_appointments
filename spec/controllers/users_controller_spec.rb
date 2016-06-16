require "rails_helper"

RSpec.describe Api::V1::UsersController do
  include AuthHelper
  before(:each) do
    User.create(username: "bob", password: "123")
    http_login
  end

  it "creates a user" do
    expect(User.count).to eq 1
    post :create, format: :json, user: { username: "jones", password: "123" }
    expect(response).to have_http_status(:success)
    expect(User.count).to eq 2
    expect(User.last.username).to eq "jones"
  end

  it "shows a user" do
    get :show, id: User.last.id, format: :json

    expect(response).to have_http_status(:success)
    user_hash = JSON.parse(response.body, symbolize_names: true)
    expect(user_hash[:username]).to eq "bob"
  end

  it "destroys a user" do
    user = User.create(username: "billyjo", password: "abc")
    expect(User.count).to eq 2

    delete :destroy, id: user.id, format: :json
    expect(response).to have_http_status(:success)
    expect(User.count).to eq 1
  end
end

# it "creates an item" do
#     expect(Item.count).to eq 0
#     post :create, format: :json, post: { name: "Item", description: "this item"}
#     expect(response).to have_http_status(:success)
#
#     expect(Item.count).to eq 1
#   end
