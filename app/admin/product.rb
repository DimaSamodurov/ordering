ActiveAdmin.register Product do

  permit_params :name, :price

  index do
    column :name
    column :price
    column :price_list do |product|
      Hash[product.price_list.map { |price| [price.effective_date.strftime('%FT%R'), price.price] }]
    end
    actions
  end
end
