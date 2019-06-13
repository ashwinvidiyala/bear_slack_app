class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def encode_text(text)
    text.gsub(/ +/, '%20')
  end
end
