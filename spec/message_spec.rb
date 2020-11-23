require 'message'

describe Message do
  describe '#create' do
    it 'sends an sms' do
      message = Message.new
      expect(message.create.body).to eq(
        "Thank you your order was placed and will be delivered at #{(Time.now + 3600).strftime('%H:%M')}")
    end
  end
end
