require 'rails_helper'

feature 'User registration', type: :system do
  context 'with data entered correctly' do
    scenario 'successful registration' do
      visit root_path

      click_on 'Register'
      fill_in 'Email', with: 'testuser@sample.net'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'

      within '.orders-section' do
        expect(page).to have_content 'Ваші замовлення'
      end
    end
  end
end
