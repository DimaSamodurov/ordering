require 'rails_helper'

feature 'Power user can change price of product and choose date when it price will be able', type: :system do
  context 'registration power user' do


    let (:admin){admin = AdminUser.create(email: 'adminwhite@admin.com', password: '123456white')}

    describe'create product price'do
    def select_date(date, options = {})

      year, month, day = date.split(',')
      select year,  :from => "product_price_effective_date_1i"
      select month, :from => "product_price_effective_date_2i"
      select day,   :from => "product_price_effective_date_3i"
    end

    scenario 'for exist product' do
    sign_in admin

    visit '\admin'
    product = Product.create(name: 'bread', price:3)
    expect(page).to have_content "Product Prices"

    click_on 'Product Prices'
    click_on 'New Product Price'
    fill_in 'Product name', with: 'bread'
    page.select 'bread', from: 'Product*'

    fill_in 'Price', with: 2


    select_date("2013,December,7", :from => "Effective date")
    click_on 'Create Product price'
    expect(page).to have_content "Product price was successfully created"
    expect(page).to have_content '2013'
   expect(ProductPrice.last.effective_date). eql? ("2013-12-07-00-00")
  end
end
end
end
