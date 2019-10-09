class CashRegister
    attr_accessor :total, :discount, :last_item_total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item_arr = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity 
        quantity.times do 
            @item_arr << title
        end        
        @last_item_total = price * quantity 
    end

    def apply_discount
        self.total *= (1 - self.discount / 100.0) #instance's own total now equals total less discount percentage
        if self.discount > 0
            "After the discount, the total comes to $#{@total.round}."
        else
            "There is no discount to apply."
        end
    end 

    def items
        @item_arr 
    end

    def void_last_transaction
        self.total -= self.last_item_total     
    end

end


