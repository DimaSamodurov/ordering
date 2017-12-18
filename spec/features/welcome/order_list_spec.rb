require 'rails_helper'

feature 'Домашня сторінка', type: :system do
  context 'для зареєстрованого користувача що має замовлення' do
     let(:user) { create :user }

     before do
       create :order, user: user, status: Order::NEW
       create :order, user: user, status: Order::SUBMITTED
     end

    scenario 'відображення списку замовлень' do
      sign_in user

      visit root_path

      expect(page).to have_content 'Ваші замовлення'

      expect(page).to show_orders
    end
  end
end
