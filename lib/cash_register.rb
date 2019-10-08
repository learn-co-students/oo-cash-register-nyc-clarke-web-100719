class CashRegister

    def initialize(discount=0)
    
        @discount = discount
        @items = []
        @prevTotal = 0
        @total = 0


    end

    attr_reader  :items, :discount
    attr_accessor :total

    def add_item(item, price, quantity=1)
    
        @prevTotal = @total
        @total+=(price*quantity)
        quantity.times do 
            @items << item
        end


    end


    def apply_discount
        if discount == 0
            return "There is no discount to apply."
        else

            @total = @total - (@total * (discount.to_f / 100)).to_i

            return "After the discount, the total comes to $#{@total}."
        end

    end

    def void_last_transaction
        
        #while (@total != @prevTotal) do
            @items.pop
            @total = @prevTotal
        #end
        

    end






end

