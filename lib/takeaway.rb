class Takeaway

  attr_reader :menu
  def initialize
    @menu = {'pizza' => 10, 'pasta' => 12, 'carbonara' => 8, 'panini' => 6,
    'lasagna' => 15, 'spaghetti bolognese' => 14, 'ravioli' => 9}
  end

  def view_menu
    menu_list = ['Takeaway menu']
    menu.each do |item, price|
      menu_list << "#{item}: £#{price}"
    end
    menu_list.join("\n")
  end
end
