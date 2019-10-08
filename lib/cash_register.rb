class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
        @quantities = []
    end
    attr_accessor :total, :discount

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        quantity.times do 
            @items << item 
        end
        @prices << price
        @quantities << quantity 
    end

    def apply_discount
        @total = @total * 0.01 * (100 - discount)
        return "After the discount, the total comes to $#{@total.round}." unless discount == 0
        "There is no discount to apply." 
    end

    def items
        @items
    end

    def void_last_transaction
        @total = @total - @prices[-1] * @quantities[-1]
        @quantities[-1].times do
            @items.pop
        end
        @prices.pop
        @quantities.pop
    end
end
