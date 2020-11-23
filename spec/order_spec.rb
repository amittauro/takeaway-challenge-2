require 'order'

describe Order do
  describe '#add_item' do
    context 'when adding items to the basket' do
      it 'returns a hash of the item with its quantity' do
        takeaway = double('takeaway', menu: { 'pizza' => 10 })
        message = double('message')
        order = Order.new(takeaway, message)
        expect(order.add_item(item: 'pizza', quantity: 2)).to eq(
          { 'pizza' => 2}
        )
      end

      it 'doesnt add order if not on menu' do
        takeaway = double('takeaway', menu: { 'pizza' => 10 })
        message = double('message')
        order = Order.new(takeaway, message)
        expect(order.add_item(item: 'pazza', quantity: 2)).to eq(
          'sorry this item is not on the menu')
      end
    end
  end

  describe '#place' do
    context 'when placing an order' do
      it 'asks message class to send sms' do
        takeaway = double('takeaway', menu: { 'pizza' => 10 })
        message = double('message')
        order = Order.new(takeaway, message)
        order.add_item(item: 'pizza', quantity: 2)
        expect(message).to receive(:send)
        order.place(20)
      end

      it 'raises error if order doesnt match '
    end
  end
end
