require_relative "../../spec/spec_helper"


describe Endpoints do
  context "all mock endpoints" do
    it "returns endpoint" do
      get "/endpoints"
      last_response.ok?
    end
    it "returns 200" do
      get "/endpoints"
      expect(last_response.status).to eq 200
    end
  end
end