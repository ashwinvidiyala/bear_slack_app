# Opens Bear
class OpenBearController < ApplicationController
  def open_bear
    @slack_client = Slack::Web::Client.new

    @slack_client.chat_postMessage(
      channel: params[:channel_id],
      text: "Please click on the button below to open Bear",
      attachments: [
        fallback: 'Open Bear',
        actions: [
          {
            type: 'button',
            text: 'Open Bear',
            url: 'bear://x-callback-url',
            style: 'primary'
          }
        ]
      ]
    )
  end
end
