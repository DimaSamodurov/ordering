require 'rails_helper'

feature 'Домашня сторінка', type: :system do
  context 'Сховати табличку з підтвердженими замовленнями для зареєстрованого користувача, що має підвердженні замовлення' do
     let(:user) { create :user }
      scenario 'відображає та ховає замовленя активного користувача по кліку на посилання' do

      order = create :order, user: user, status: Order::SUBMITTED

      sign_in user

      visit root_path

      expect(page).to have_content 'Підтвердженні'

      click_on 'Підтвердженні'

      page.find_by_id('ListOrders', visible: false)
    end
  end
end
