require 'pry'
class CashRegister
    attr_accessor :total, :discount
    def initialize(discount = 0)
        @total = 0
        @discount ||= discount
    end

    def add_item(title, price, quantity = 1)
        quantity.times {items << title}
        @total += (price * quantity)
        prices << (price*quantity)
    end
    

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            @total = @total - (@total * @discount/100)
            return "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items ||= []
    end

    def prices
        @prices ||= []
    end
    
    def void_last_transaction
        @total = @total - @prices.pop
    end
end
