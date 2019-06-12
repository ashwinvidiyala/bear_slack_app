Rails.application.configure do
  Slack.configure do |config|
    config.token = Rails.application.credentials.slack[:api_token]
  end
end
