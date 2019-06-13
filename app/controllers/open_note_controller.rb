# frozen_string_literal: true

# Creates notes in Bear
class OpenNoteController < ApplicationController
  def open_note
    @slack_client = Slack::Web::Client.new

    @slack_client.chat_postMessage(
      channel: params[:channel_id],
      text: 'Click below to open the note',
      attachments: [
        fallback: 'Create your note in Bear?',
        actions: [
          {
            type: 'button',
            text: 'Open Note',
            url: "bear://x-callback-url/open-note?title=#{url_encoded_title}",
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
