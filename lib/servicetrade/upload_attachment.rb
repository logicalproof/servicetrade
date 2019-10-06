module ServiceTrade
  class UploadAttachment

    def self.upload_job_paperwork(job_id, file, authenticator)
      action = Servicetrade::Action::PrepareAttachment.new
      api_interface = Servicetrade::ApiInterface.new(action, authenticator)
      api_interface.post(purposeId: 1, entityId: job_id, entityType: 3, file: file)
    end





  end
end
