# frozen_string_literal: true

# Creates notes in Bear
class OpenNoteController < ApplicationController
  def open_note
    @slack_client = Slack::Web::Client.new

    @slack_client.chat_postMessage(
      channel: params[:channel_id],
      text: 'Click below to open the note',
      attachments: [
        fallback: 'Open your note in Bear',
        actions: [
          {
            type: 'button',
            text: 'Open Note',
            url: "bear://x-callback-url/open-note?title=#{encode_text(params[:text])}",
            style: 'danger'
          }
        ]
      ]
    )
  end
end
