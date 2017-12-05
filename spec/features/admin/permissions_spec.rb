require 'rails_helper'

feature 'Admin Panel Access', type: :system do
  scenario 'prohibited for not authenticated users' do
    visit '/admin'

    expect(page.current_path).to eq '/admin/login'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
