require_relative 'twilio_variables'
require_relative 'lib/takeaway'
takeaway = Takeaway.new
takeaway.add_item(item: 'pizza', quantity: 2)
takeaway.place_order(20)
