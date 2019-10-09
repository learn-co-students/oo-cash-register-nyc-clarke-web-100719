
class CashRegister
    attr_accessor :total, :discount
    attr_reader :last_price
    def initialize(*discount)
        @total = 0
        @discount = discount[0]
        @items = []
        @last_price = 0
    end

    
    # def discount
    #     discount = 20
    # end
   
    def add_item(item,price,quantity=1)
        quantity.times { @items << item}
        if quantity > 0 
            self.total+= price * quantity
        else
            self.total+= price
        end
       @last_price = price * quantity
    end
def apply_discount
    coupon = (@total * @discount.to_f) / 100.0
  if self.discount != nil && self.discount > 0
      @total-= coupon
    "After the discount, the total comes to $#{@total.round}."
  else
     "There is no discount to apply."
  end
end
  
def items
    @items
end
def void_last_transaction
  @total -= @last_price
end

end

cash = CashRegister.new