require "spec_helper"



RSpec.describe Servicetrade do
  it "has a version number" do
    expect(Servicetrade::VERSION).not_to be nil
  end

  it "stores and returns an auth token" do
    Servicetrade.set_auth_token = "a56b78g63c56a79addf"
    expect(Servicetrade.auth_token).to eq("a56b78g63c56a79addf")
  end
end
