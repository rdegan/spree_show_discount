module Spree
  module ProductsHelper
    def product_price(product)
      total = product.price
      product.possible_promotions.each do |promotion|
        promotion.promotion_actions.each do |action|
          total += action.compute_amount(product)
        end
      end
      if total != product.price
        [number_to_currency(total),number_to_currency(product.price)]
      else
        [number_to_currency(product.price)]
      end
    end
  end
end