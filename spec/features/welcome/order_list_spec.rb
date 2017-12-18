require 'rails_helper'

feature 'Домашня сторінка', type: :system do
  context 'для зареєстрованого користувача що має замовлення' do
     let(:user) { create :user }
     let(:another_user) { create :user, email: 'another@test.net' }

    scenario 'відображає замовленя активного користувача, але не інших користувачів.' do
      order1 = create :order, user: user, status: Order::NEW
      order2 = create :order, user: user, status: Order::SUBMITTED

      order3 = create :order, user: another_user

      sign_in user

      visit root_path

      expect(page).to have_content 'Ваші замовлення'

      expect(page).to show_orders(order1, order2)
      expect(page).to_not show_orders(order3)
    end
  end
end
