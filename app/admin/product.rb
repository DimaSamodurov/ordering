ActiveAdmin.register Product do

  permit_params :name, :price


  index do
    column :name
    column :price
    column :price_list do |product|
      Hash[product.price_list.map { |price| [price.effective_date.strftime('%FT%R'), price.price] }]

    end


      column 'table product' do |product|
        panel "Product prices" do
          table_for ProductPrice.for(product.name).each do |pr|
            column(:price)    {|pr| pr.price }
            column(:effective_date)    { |pr| link_to(pr.effective_date, admin_product_price_path(pr)) }
          end
        end
      end



      actions
    end
  end
