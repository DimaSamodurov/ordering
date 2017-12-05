require 'rails_helper'

feature 'Power User registration', type: :system do
  scenario 'successful registration' do
    admin = AdminUser.create(email: 'admin@sample.net', password: '123456')
    sign_in admin

    visit '\admin'

    expect(page).to have_content 'Dashboard'
  end
end
