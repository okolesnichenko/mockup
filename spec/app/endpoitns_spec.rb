require_relative "../../spec/spec_helper"
require 'json'

describe Endpoints do
  context "GET/POST to endpoints" do
    it "returns endpoint" do
      get "/endpoints"
      last_response.ok?
    end
    it "returns 200" do
      get "/endpoints"
      expect(last_response.status).to eq 200
    end

    it "add posts mock to app" do
      post "/endpoints", {
          method: "GET",
          path: "posts",
          status: 200,
          payload: {
              name: "Golden fish",
              pages: 123
          }
      }.to_json, format: :json
      expect(last_response.body).to eq "OK"
    end

    it "check posts module" do
      get "/posts"
      expect(last_response.status).to eq 200
    end
  end
end