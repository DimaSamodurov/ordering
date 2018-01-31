require 'rails_helper'

feature 'Create and order', type: :system do
  context 'with data entered correctly' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    scenario 'enter a new order' do
      create :product, name: 'abrakadabra'

      visit root_path

      expect(page).to have_text('Ваші замовлення')

      click_on 'Нове замовлення'

      expect(page).to have_content('abrakadabra')
    end
  end
end
