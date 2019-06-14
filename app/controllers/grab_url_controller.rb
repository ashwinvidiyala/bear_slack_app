# frozen_string_literal: true

# Creates a note in Bear with the given URL's content
class GrabUrlController < ApplicationController
  def grab_url
    @slack_client = Slack::Web::Client.new

    @slack_client.chat_postMessage(
      channel: params[:channel_id],
      text: "Click below to create a note in Bear with the given webpage's content ",
      attachments: [
        fallback: 'Create a note in Bear with content of the given webpage',
        actions: [
          {
            type: 'button',
            text: 'Grab URL',
            url: "bear://x-callback-url/grab-url?url=#{url_input}&tags=#{tags_input}",
            style: 'danger'
          }
        ]
      ]
    )
  end

  private

  def parsed_input_text_parameter
    params[:text].split(' ')
  end

  def url_input
    parsed_input_text_parameter.first
  end

  def tags_input
    array_of_tags = parsed_input_text_parameter.drop(1).join(' ').split('#').map(&:strip).reject(&:empty?)
    string_of_tags = ''
    array_of_tags.each do |tag|
      string_of_tags += url_encode_text(tag)
      string_of_tags += ','
    end

    string_of_tags
  end
end
