# frozen_string_literal: true

require 'erb'

# Creates notes in Bear
class OpenNoteController < ApplicationController
  include ERB::Util

  def open_note
    SlackMessageBuilder.new.create_message(
      channel: params[:channel_id],
      message_text: "Click below to open the note \"#{params[:text].titleize}\"",
      fallback: 'Open your note in Bear',
      button_text: 'Open Note',
      url: "bear://x-callback-url/open-note?title=#{url_encode(params[:text])}"
    )
  end
end
