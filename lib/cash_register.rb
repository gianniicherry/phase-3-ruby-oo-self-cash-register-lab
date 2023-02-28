class CashRegister
    attr_accessor :total
    attr_accessor :discount
    attr_accessor :title
    attr_accessor :price
    attr_accessor :quantity
    attr_accessor :last_transaction
    attr_accessor :all_titles

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @last_transaction = nil
        @all_titles = []
    end
    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times {@all_titles << title}
        
    end
    def apply_discount
        price_discount = (100 - self.discount.to_f) / 100
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = (self.total * price_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end
    def items
        @all_titles
    end
    def void_last_transaction
        @total - @last_transaction
    end
end
