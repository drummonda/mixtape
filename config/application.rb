require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mixtape
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Set up paperclip defaults
    config.paperclip_defaults = {
      :storage => :s3,
      :s3_region => 'us-east-2',
      :bucket => 'drummonda-mixtape',
      :path => '/:class/:attachment/:id_partition/:style/:filename',
      :s3_credentials => "#{Rails.root}/config/aws.yml",
    }
  end
end
