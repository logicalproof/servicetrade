require "spec_helper"

RSpec.describe Servicetrade::JobInterface do
  resource = Servicetrade::JobInterface.new
  context "when a job is created" do
    it "should return a list of allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT"])
    end
    it "should return a resource url without an id" do
      expect(resource.base_url).to eq("/job")
    end
  end
  context "post_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.post_params).to be_instance_of(Hash)
    end
    it "should include the autoAssignContract entry" do
      expect(resource.post_params[:autoAssignContract][:type]).to eq("boolean")
    end
  end

  context "put_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.put_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.put_params[:autoAssignContract]).to eq(nil)
    end
  end

  context "get_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.get_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.get_params[:autoAssignContract]).to eq(nil)
    end
    it "should include boolean for counts :type" do
      expect(resource.get_params[:type][:allowed_values]).to eq(["unknown", "repair", "construction", "upgrade", "service_call", "urgent_service_call", "priority_service_call", "emergency_service_call", "cleaning", "inspection", "priority_inspection", "reinspection", "survey", "preventative_maintenance", "quality_assurance", "inspection_repair", "delivery", "pickup", "exchange", "sales", "installation", "warranty", "training", "testing", "administrative", "replacement", "design", "hookup"])
    end
  end
end


  