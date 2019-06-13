# frozen_string_literal: true

# Opens tags in Bear
class OpenTagController < ApplicationController
  def open_tag
    @slack_client = Slack::Web::Client.new

    @slack_client.chat_postMessage(
      channel: params[:channel_id],
      text: 'Click below to open the tag',
      attachments: [
        fallback: 'Open your tag in Bear',
        actions: [
          {
            type: 'button',
            text: 'Open Tag',
            url: "bear://x-callback-url/open-tag?name=#{url_encoded_title}",
            style: 'danger'
          }
        ]
      ]
    )
  end

  private

  def url_encoded_title
    params[:text].gsub(/ +/, '%20')
  end
end
