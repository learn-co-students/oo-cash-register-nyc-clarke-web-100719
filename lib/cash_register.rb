class CashRegister
    attr_accessor :total, :quantity, :discount, :item

    def initialize(discount = 0)
        self.discount = discount
        @total = 0
        @item = []
    end

    def add_item(item, price, quantity = 1)
        @quantity = quantity
        i = 0 
        while i < quantity
        @item << item
        i += 1
        end
        @price = price
        @total += price * quantity
    end

    def apply_discount
        if @discount == 20
        @total = total - total*discount/100
        p "After the discount, the total comes to $#{@total}."
        else
        p "There is no discount to apply."
        end
    end

    def items
        @item
    end

    def void_last_transaction
        i = 0 
        while i <= @quantity
        new_cart = @item.pop
        i += 1
        end
        @total = @total - @price * @quantity
    end
end