require 'twilio-ruby'

class Message

  attr_reader :client
  def initialize(client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token']))
    @client = client
  end

  def create
    from = ENV['from']
    to = ENV['to']
    new_message = client.messages.create(
      from: from,
      to: to,
      body: "Thank you your order was placed and will be delivered at #{(Time.now + 3600).strftime('%H:%M')}"
    )
    new_message
  end
end
