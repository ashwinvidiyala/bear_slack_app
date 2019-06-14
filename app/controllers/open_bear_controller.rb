# Opens Bear
class OpenBearController < ApplicationController
  def open_bear
    SlackMessageBuilder.new.create_message(
      channel: params[:channel_id],
      message_text: "Please click on the button below to open Bear",
      fallback: 'Open Bear',
      button_text: 'Open Bear',
      url: 'bear://x-callback-url'
    )
  end
end
