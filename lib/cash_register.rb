class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_price = []
        @last_quantity = []
    end
    attr_accessor :total, :discount, :last_price, :last_quantity

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        quantity.times do 
            @items << item 
        end
        @last_price = price
        @last_quantity = quantity 
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
        @total = @total - self.last_price * self.last_quantity
    end
end
