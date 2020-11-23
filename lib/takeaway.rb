require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :order, :client
  def initialize(client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token']))
    @client = client
    @menu = {'pizza' => 10, 'pasta' => 12, 'carbonara' => 8, 'panini' => 6,
    'lasagna' => 15, 'spaghetti bolognese' => 14, 'ravioli' => 9}
    @order = {}
  end

  def view_menu
    menu_list = ['Takeaway menu']
    menu.each do |item, price|
      menu_list << "#{item}: £#{price}"
    end
    menu_list.join("\n")
  end

  def add_item(item:, quantity:)
    return 'sorry this item is not on the menu' unless menu.keys.include?(item)

    order[item] = quantity
    order
  end

  def place_order(amount)
    order_costs = []
    order.each do |item, quantity|
      order_costs << menu[item]*quantity
    end
    if order_costs.reduce(:+) == amount
      from = ENV['from']
      to = ENV['to']
      message = client.messages.create(
        from: from,
        to: to,
        body: "Thank you your order was placed and will be delivered at #{(Time.now + 3600).strftime('%H:%M')}"
      )
      message
    end
  end
end

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
