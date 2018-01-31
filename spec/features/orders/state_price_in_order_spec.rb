require 'rails_helper'

feature 'Ціна продуктів у підтвердженому замовленні не змінюється', type: :system do
  context 'Користувач додає продукт з конкретною ціною та підтверджує замовлення' do
    let(:user) { user = User.create(email: 'user@sample.net', password: '123456') }

    before do
      sign_in user
    end
    let!(:product) { create :product, price: 7.40, name: 'pen' }
    scenario 'замовлення успішно створюється та ціна зберігається' do

      visit root_path

      expect(page).to have_text('Ваші замовлення')

      click_on 'Нове замовлення'
      expect(page).to have_content('pen')
      within '.product-price' do
        expect(page).to have_content ('7.40')
      end

      click_on 'Додати'
      click_on 'Відправити замовлення'
      visit root_path
      expect(page).to have_content ('7.4')
      expect(page).to have_content ('submitted')
      expect(Order.last.subtotal).to eql 0.74e1

      product.update_attributes price: 9
      visit root_path
      expect(page).to have_content ('7.4')
      expect(Order.last.subtotal).to eql 0.74e1

      click_on 'Нове замовлення'
      expect(page).to have_content('pen')
      within '.product-price' do
        expect(page).to have_content ('9')
        expect(page).not_to have_content ('7.40')
      end

      click_on 'Додати'
      click_on 'Відправити замовлення'
      visit root_path
      expect(page).to have_content ('9')
      expect(Order.last.subtotal).to eql 9
      expect(page).to have_content ('submitted')
      expect(page).to have_content ('7.4')
      expect(page).to have_content ('submitted')


    end
  end
end
