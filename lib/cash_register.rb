class CashRegister
    attr_accessor :total, :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @item = title
        @last_total = price * quantity
        quantity.times do 
            @cart << @item
        end
    end

    def apply_discount
        if @discount > 0
            @total = @total.to_int - @discount * 10
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        @total = @total - @last_total
    end

end
