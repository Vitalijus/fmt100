# Set UUID as a default Primary key type
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
