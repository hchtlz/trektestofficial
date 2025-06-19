require "image_processing/vips"

class ImageUploader < Shrine
  plugin :blurhash
  plugin :determine_mime_type
  plugin :remote_url, max_size: nil
  plugin :store_dimensions
  plugin :validation_helpers
  # plugin :derivation_endpoint,
  #   secret_key: Rails.application.credentials.dig(:shrine, :derivation_endpoint, :secret_key),
  #   prefix: "derivations/image",
  #   upload: true,
  #   upload_location: lambda {
  #     # e.g. "derivatives/9a7d1bfdad24a76f9cfaff137fe1b5c7/thumbnail-1000-800"
  #     ["derivatives", File.basename(source.id, ".*"), [name, *args].join("-")].join("/")
  #   }
  #
  # derivation :thumbnail do |file, width, height|
  #   ImageProcessing::Vips
  #     .source(file)
  #     .resize_to_limit!(width.to_i, height.to_i)
  # end

  Attacher.validate do
    validate_max_size 20.megabytes
    validate_max_dimensions [8000, 8000] if validate_mime_type %w[image/jpeg image/png]
  end
end
