require 'rails_helper'

feature 'Registration user by admin', type: :system do
      scenario 'successful registration' do
        admin = AdminUser.create(email: 'admin@sample.net', password: '123456')
        sign_in admin

        visit '\admin'

      click_on 'Users'
      click_on 'New User'
      fill_in  'First name', with: 'someuser'
      fill_in  'Last name', with: 'userlastname'
      fill_in 'Password', with: '1234567'
      fill_in 'Email', with: 'user@sample.net'
      fill_in 'Encrypted password', with: '1234567'
      fill_in 'Role', with: 'customer'
      click_on 'Create User'

      expect(page).to have_content 'User was successfully created'

      visit root_path

      click_on 'Login'
      fill_in 'Email', with:'user@sample.net'
      fill_in 'Password', with: '1234567'
      click_on 'Log in'

      expect(page).to have_content 'Вітаємо'

    end
  end
