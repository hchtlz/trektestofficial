require "shrine"

if Rails.env.production? || ENV.fetch("FEATURE_STORAGE", "local") == "s3"
  require "shrine/storage/s3"

  s3_options = {
    bucket: ENV.fetch("S3_BUCKET"),
    region: ENV.fetch("S3_REGION"),
    endpoint: ENV.fetch("S3_ENDPOINT"),
    access_key_id: ENV.fetch("S3_ACCESS_KEY_ID"),
    secret_access_key: ENV.fetch("S3_SECRET_ACCESS_KEY")
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }

  Shrine.plugin :url_options, store: { host: ENV.fetch("S3_BASE_URL") }
elsif Rails.env.development?
  require "shrine/storage/file_system"

  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
  }
else
  require "shrine/storage/memory"

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :determine_mime_type, analyzer: :marcel
Shrine.plugin :pretty_location
Shrine.plugin :upload_endpoint, url: true, max_size: 20.megabytes
