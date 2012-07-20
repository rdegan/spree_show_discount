Spree::Promotion::Actions::CreateAdjustment.class_eval do
  def compute_amount(calculable)
    case calculable
      when Spree::Order
        [(calculable.item_total + calculable.ship_total), super.to_f.abs].min * -1
      when Spree::Product
        [calculable.price, super.to_f.abs].min * -1
      else
        0
    end

  end
end