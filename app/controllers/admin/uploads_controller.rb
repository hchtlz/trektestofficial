module Admin
  class UploadsController < ApplicationController
    include Trek::Authentication
    include Trek::Localization

    skip_forgery_protection

    def image
      set_rack_response ImageUploader.upload_response(:cache, request.env)
    end

    private

    def set_rack_response((status, headers, body))
      self.status = status
      self.headers.merge!(headers)
      self.response_body = body
    end
  end
end
