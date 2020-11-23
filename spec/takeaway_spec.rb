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

  describe '#add_item' do
    let (:takeaway) {Takeaway.new}
    context 'when adding items to the order' do
      it 'add the order to the basket' do
        expect(takeaway.add_item(item: 'pizza', quantity: 2)).to eq({
          'pizza' => 2
          })
      end

      it 'doesnt add order if not on menu' do
        expect(takeaway.add_item(item: 'pazza', quantity: 2)).to eq(
          'sorry this item is not on the menu')
      end
    end
  end

  describe '#place_order' do
    context 'when placing an order' do
      it 'sends a text if sum of order matches total' do
        takeaway = Takeaway.new
        (takeaway.add_item(item: 'pizza', quantity: 2))
        expect(takeaway.place_order(20).sid.length).to eq(34)
        expect(takeaway.place_order(20).sid).to be_a(String)
        expect(takeaway.place_order(20).sid[0..1]).to eq('SM')
        expect(takeaway.place_order(20).body).to eq(
          "Thank you your order was placed and will be delivered at #{(Time.now + 3600).strftime('%H:%M')}")
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
