# Builds message repsonse to Slack API's request
class SlackMessageBuilder
  attr_reader :slack_client

  def initialize(slack_client: Slack::Web::Client.new)
    @slack_client = slack_client
  end

  def create_message(channel:, message_text:, fallback:, button_text:, url:)
    slack_client.chat_postMessage(
      channel: channel,
      text: message_text,
      attachments: [
        fallback: fallback,
        actions: [
          {
            type: 'button',
            text: button_text,
            url: url,
            style: 'danger'
          }
        ]
      ]
    )
  end
end
