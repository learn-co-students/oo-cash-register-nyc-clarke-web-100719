class CashRegister
    attr_accessor :discount, :total, :items, :quantity, :price

    def initialize(discount = 1)
        @total = 0
        @discount = discount
        @cart = {}
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += price*quantity
    
        @quantity = [] << quantity
        @price = [] << price

        quantity.times{@items << title}
    end

    def apply_discount
        if @discount > 1
            return "After the discount, the total comes to $#{(@total -= @discount*@total*0.01).to_i}." 
        else return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @price[-1]*@quantity[-1]
    end
end
