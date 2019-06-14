# frozen_string_literal: true

# Opens tags in Bear
class OpenTagController < ApplicationController
  def open_tag
    SlackMessageBuilder.new.create_message(
      channel: params[:channel_id],
      message_text: "Click below to open the ##{remove_hashtag(params[:text])}# tag",
      fallback: 'Open your tag in Bear',
      button_text: 'Open Tag',
      url: "bear://x-callback-url/open-tag?name=#{url_encode_text(remove_hashtag(params[:text]))}"
    )
  end

  private

  def remove_hashtag(text)
    text.tr('#', '')
  end
end
