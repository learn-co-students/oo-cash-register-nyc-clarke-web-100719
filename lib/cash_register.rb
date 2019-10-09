
class CashRegister
    attr_accessor :discount, :total, :items
    def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @items = []
    @last_item_total = 0
    end    

    def add_item(item, price, quant = 1)
        @total += price * quant
       quant.times {
           @items << item
       }
       @last_item_total = price * quant
    end

    def apply_discount
        if @discount != 0
            float_discount = @discount/100.00
            discount_t = float_discount * @total
            @total -=discount_t
            @total = @total.round
            return "After the discount, the total comes to $#{@total}."
        end
        "There is no discount to apply."
    end

    def void_last_transaction
        @total -= @last_item_total
    end
end
