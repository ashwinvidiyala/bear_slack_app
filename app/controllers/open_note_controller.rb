# frozen_string_literal: true

# Creates notes in Bear
class OpenNoteController < ApplicationController
  def open_note
    SlackMessageBuilder.new.create_message(
      channel: params[:channel_id],
      message_text: "Click below to open the note \"#{params[:text].titleize}\"",
      fallback: 'Open your note in Bear',
      button_text: 'Open Note',
      url: "bear://x-callback-url/open-note?title=#{url_encode_text(params[:text])}"
    )
  end
end
