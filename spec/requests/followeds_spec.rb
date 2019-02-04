require 'rails_helper'

RSpec.describe "Followeds", type: :request do
  describe "GET /followeds" do
    it "works! (now write some real specs)" do
      get followeds_path
      expect(response).to have_http_status(200)
    end
  end
end
