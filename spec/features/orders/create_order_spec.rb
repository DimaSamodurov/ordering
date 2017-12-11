require 'rails_helper'

feature 'Create and order', type: :system do
  context 'with data entered correctly' do
    let(:user) { user = User.create(email: 'user@sample.net', password: '123456') }

    before do
      sign_in user
    end

    scenario 'order is created successfully' do
      visit root_path

      expect(page).to have_text('Ваші замовлення')

      click_on 'Нове замовлення'
      fill_in 'Note', with: 'abrakadabra'
      click_on 'Create Order'

      expect(page).to have_content('Order was successfully created.')
      expect(page).to have_content('abrakadabra')

      expect(Order.last.note).to eql 'abrakadabra'
    end
  end
end
