require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable
  
  after_filter :set_header
  
  skip_before_action :verify_authenticity_token
  
  def voice
    response = Twilio::TwiML::Response.new do |r|
	  r.Say 'Welcome to Sam and Seb website.
	  Use your last name dot first name as your username.
	  Remove any space or special characters.
	  If this is your first time please use your birthday as your password.
	  Thank you.', :voice => 'alice'
	  #r.Play 'http://linode.rabasa.com/cantina.mps'
	end
	
	render_twiml response
  end
  
  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '+15005550006', to: '+14042192104', body: 'Learning to send text'
	render plain: message.status
  end
end