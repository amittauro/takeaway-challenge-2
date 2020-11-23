class Order

  attr_reader :takeaway, :basket, :message
  def initialize(takeaway = Takeaway.new, message = Message.new)
    @takeaway = takeaway
    @message = message
    @basket = {}
  end

  def add_item(item:, quantity:)
    return 'sorry this item is not on the menu' unless menu_includes?(item)

    basket[item] = quantity
    basket
  end

  def place(amount)
    message.send if total_basket_cost == amount
  end

  private

  def menu_includes?(item)
    takeaway.menu.keys.include?(item)
  end

  def total_basket_cost
    basket.map do |item, quantity|
      takeaway.menu[item]*quantity
    end.reduce(:+)
  end
end
