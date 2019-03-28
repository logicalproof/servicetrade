require "spec_helper"

RSpec.describe Servicetrade::Job do
  resource = Servicetrade::Job.new
  context "when a job is created" do
    it "should return a list of allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT"])
    end
    it "should return a resource url without an id" do
      expect(resource.url).to eq("/job")
    end
  end
  context "list_post_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.list_post_params).to be_instance_of(Hash)
    end
    it "should include the autoAssignContract entry" do
      expect(resource.list_post_params[:autoAssignContract][:type]).to eq("boolean")
    end
  end

  context "list_put_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.list_put_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.list_put_params[:autoAssignContract]).to eq(nil)
    end
  end

  context "list_get_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.list_get_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.list_get_params[:autoAssignContract]).to eq(nil)
    end
    it "should include boolean for counts :type" do
      expect(resource.list_get_params[:type][:allowed_values]).to eq(["unknown", "repair", "construction", "upgrade", "service_call", "urgent_service_call", "priority_service_call", "emergency_service_call", "cleaning", "inspection", "priority_inspection", "reinspection", "survey", "preventative_maintenance", "quality_assurance", "inspection_repair", "delivery", "pickup", "exchange", "sales", "installation", "warranty", "training", "testing", "administrative", "replacement", "design", "hookup"])
    end
  end
end


  