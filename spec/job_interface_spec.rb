require "spec_helper"

RSpec.describe Servicetrade::JobInterface do

  context "when a GET request is made" do
    it "should create a GET url payload" do
      job = Servicetrade::JobInterface.new
      url = job.set_url_payload("GET")
      expect(url).to eq("https://api.servicetrade.com/api/tag/job")
    end

    it "should add a resource if one is supplied" do
      job = Servicetrade::JobInterface.new
      url = job.set_url_payload("GET", 123456)
      expect(url).to eq("https://api.servicetrade.com/api/tag/job/123456")
    end
  end

  context "when a POST request is made" do
    it "should create a POST url payload" do
      job = Servicetrade::JobInterface.new
      url = job.set_url_payload("POST")
      expect(url).to eq("https://api.servicetrade.com/api/tag/jobs")
    end
  end

  context "when a PUT request is made" do
    it "should create a PUT url payload" do
      job = Servicetrade::JobInterface.new
      url = job.set_url_payload("PUT")
      expect(url).to eq("https://api.servicetrade.com/api/tag/jobs")
    end
  end

  context "when a DELETE request is made" do
    it "should create a DELETE url payload" do
      job = Servicetrade::JobInterface.new
      url = job.set_url_payload("DELETE")
      expect(url).to eq("https://api.servicetrade.com/api/tag/jobs")
    end
  end



end