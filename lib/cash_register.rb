require 'pry'

class CashRegister
  # attr_accessor :items
  attr_writer :total, :items

  # ITEMS = []
  @@last_item = {}

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @quantity = 0
  end

  # def total(total_input)
  #   @total = total_input
  #   return @total
  # end

  def total
    @total
  end

  def discount
    @discount
  end

  def apply_discount
    if discount != 0
      @total = @total - (@total * 0.2)
      return "After the discount, the total comes to $#{@total.round}."
    else
      return "There is no discount to apply."
    end
  end

  def add_item(item, price, quantity = nil)
    # binding.pry
    if !quantity.nil?
      1.upto(quantity) { @items << {item => price} }
      # 1.upto(quantity) {@items << {item => price, "quantity" => quantity}}
      @quantity = quantity
      @total += (price * quantity)
    else
      @items << {item => price}
      @total += price

      @quantity = 0
    end
  end

  def items
    item_list = []
    @items.each { |key, val| item_list << key.keys.join('') }
    return item_list
  end


  def void_last_transaction
    # binding.pry
    # @total -= @items.last.values.join('').to_f
    # binding.pry

    if @quantity != 0

      @total -= (@items.last.values.join('').to_f * @quantity)

      1.upto(@quantity) do
        @items.pop
      end

      # binding.pry

    else
      # binding.pry

      @total -= @items.last.values.join('').to_f

      @items.pop
    end

      # if @items.last["quantity"]
      #   @total -= (@items.last.values.join('').to_f * @items.last["quantity"])
      # else
      #   @total -= @@last_item.values.join('').to_f
      # end

      # item_name = items.last.keys.join('')
      #
      # count = 0
      #
      # @items.select do |i|
      #     if items.last.keys.join('') == item_name
      #       count += 1
      #     end
      # end

      # @total -= (@items.last.values.join('').to_f * count)


      # @items.pop
    # @total -= @@last_item.values.join('').to_f

    # if items.empty?
    #   @total = 0.0
    # end

    # return @total
  end

  # binding.pry

end
