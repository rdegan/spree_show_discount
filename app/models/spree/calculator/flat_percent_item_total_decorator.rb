Spree::Calculator::FlatPercentItemTotal.class_eval do
  def compute(object)
    case object
      when Spree::Order
        return unless object.present? and object.line_items.present?
        item_total = object.line_items.map(&:amount).sum
        value = item_total * BigDecimal(self.preferred_flat_percent.to_s) / 100.0
        (value * 100).round.to_f / 100
      when Spree::Product
        value = object.price * BigDecimal(self.preferred_flat_percent.to_s) / 100.0
        (value * 100).round.to_f / 100
      else
        0
    end
  end
end