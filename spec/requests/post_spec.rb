require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/post/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /store" do
    it "returns http success" do
      get "/post/store"
      expect(response).to have_http_status(:success)
    end
  end

end
