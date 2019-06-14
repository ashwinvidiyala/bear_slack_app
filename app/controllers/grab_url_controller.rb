# frozen_string_literal: true

# Creates a note in Bear with the given URL's content
class GrabUrlController < ApplicationController
  def grab_url
    SlackMessageBuilder.new.create_message(
      channel: params[:channel_id],
      message_text: "Click below to create a note in Bear with the given webpage's content ",
      fallback: 'Create a note in Bear with content of the given webpage',
      button_text: 'Grab URL',
      url: "bear://x-callback-url/grab-url?url=#{url_input}&tags=#{tags_input}"
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
