ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :user_id, :product_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :order do |order|
      order.id
    end
    column :user do |order|
      order.user.name
    end

    column :products do |order|
      order.order_items.map { |item| item.product.name }.join(', ')
    end

    column 'Разом', :subtotal

    actions
  end

end
