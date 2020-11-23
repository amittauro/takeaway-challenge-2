require 'takeaway'
require 'twilio-ruby'

describe Takeaway do
  describe '#view_menu' do
    let (:takeaway) {Takeaway.new}
    context 'when viewing the takaway menu' do
      it 'returns the menu list' do
        result = [
          'Takeaway menu',
          'pizza: £10',
          'pasta: £12',
          'carbonara: £8',
          'panini: £6',
          'lasagna: £15',
          'spaghetti bolognese: £14',
          'ravioli: £9'
        ].join("\n")
        expect(takeaway.view_menu).to eq(result)
      end
    end
  end
end

# require 'twilio-ruby'
#
# account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # Your Test Account SID from www.twilio.com/console/settings
# auth_token = "your_auth_token"   # Your Test Auth Token from www.twilio.com/console/settings
#
# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: "Hello from Ruby",
#     to: "+12345678901",    # Replace with your phone number
#     from: "+15005550006")  # Use this Magic Number for creating SMS
#
# puts message.sid
#
# require 'twilio-ruby'
#
# account_sid = 'ACa8afdc27b424fc20ae5c60749fa876ca'
# auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
# client = Twilio::REST::Client.new(account_sid, auth_token)
#
# from = '+15551234567' # Your Twilio number
# to = '+15555555555' # Your mobile phone number
#
# client.messages.create(
# from: from,
# to: to,
# body: "Hey friend!"
# )
#
# #string or hashes for items?
