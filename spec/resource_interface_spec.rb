require "spec_helper"

RSpec.describe Servicetrade::ResourceInterface do
  context "when a GET request is made" do
    it "should create a GET url payload" do
      job = Servicetrade::ResourceInterface.new
      url = job.set_url_payload("GET")
      expect(url).to eq("https://api.servicetrade.com/api/job/12345")
    end
  end
end