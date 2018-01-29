class Product < ApplicationRecord
  include ActiveModel::Dirty
  has_many :order_items

  attribute :previous_price

  before_save :set_time_to_price





  def check_change_price
      if price_changed?
        puts price
        puts previous_price
        previous_price_before_string = price_was
        previous_price_in_string = previous_price_before_string.to_s
        ultimate_previous_price = previous_price.to_s
        ultimate_previous_price =  previous_price_in_string + "  " +  " , " + ultimate_previous_price
        assign_attributes({:previous_price => ultimate_previous_price})

      end

    end


    def set_time_to_price

      if time_to_price_changed? && price_changed?
        new_price = price
        old_price = price_was
        assign_attributes({:updated_at => time_to_price})
        if time_to_price == Time.now
          assign_attributes({:price => new_price})
          check_change_price
      else
        assign_attributes({:price => old_price})
      end
    else
      check_change_price
    end

    end

end
