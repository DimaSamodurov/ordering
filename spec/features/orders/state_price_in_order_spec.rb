require 'rails_helper'

feature 'Ціна продуктів у підтвердженому замовленні не змінюється' do
  describe 'Оновлення ціни продукту' do
    old_price = 7.40

    let(:user) { create :user }
    let!(:product) { create :product, price: old_price, name: 'pen' }
    let!(:product1) { create :product, price: 15.00, name: 'pencil' }

    context 'що входить до вже сформованого замовлення' do

      before do
        @order = create :order, status: 'submitted', user: user
        @order.order_items << build(:order_item, product: product, quantity: 2)
        @order.order_items << build(:order_item, product: product1, quantity: 1)
      end

      scenario 'не змінює сумарну вартість замовлення' do
        expect { product.update_attributes price: 9 }.to_not change { @order.subtotal }
      end

      scenario 'не змінює вартість позиції цього продукту в замовленні' do
        product.update_attributes price: 9

        order_item = @order.order_items.find_by(product_id: product.id)
        expect(order_item.unit_price).to eql old_price
      end
    end
  end
end
