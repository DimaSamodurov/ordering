require 'rails_helper'
feature 'Динамічні ціни', type: :system do
  context 'користувач, при створенні нового замовлення' do

    let(:user) { create :user }

    before do
      sign_in user
    end

    let!(:product) { create :product, price: 7.40 }

    scenario 'бачить поточну ціну продукту' do
      visit new_order_path

      within '.product-price' do
        expect(page).to have_content ('7.40')
      end

      product.update_attributes price: 9.20

      visit new_order_path

      within '.product-price' do
        expect(page).to have_content ('9.20')
      end
    end

  end
end
