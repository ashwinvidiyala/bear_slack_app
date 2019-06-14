# Load the Rails application.
require_relative 'application'

Rails.application.configure do
  # Custom directories with classes and modules you want to be autoloadable.
  config.autoload_paths += %W[#{config.root}/lib]
end

# Initialize the Rails application.
Rails.application.initialize!
