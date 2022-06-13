module Payment
    MARKETPLACE_FEE = 0.05
    def widget_payment(seller, buyer, price)
        if buyer.balance.to_f > price + (price * MARKETPLACE_FEE)
            User.transaction do
                buyer.lock!
                seller.lock!
                buyer.balance -= (price + (price * MARKETPLACE_FEE))
                buyer.save!
                seller.balance += price
                seller.save!
            end
            return true
        else
            return false
        end
    end
end