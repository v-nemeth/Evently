require 'rails_helper'

RSpec.feature "UserAuthentication", type: :feature do
  before(:each) do

  end

  scenario "User signs up" do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact
    click_button 'Sign up'

    expect(page).to have_content('success')
    expect(page.current_path).to eq(root_path)
  end

  scenario "User signs in" do
    user = FactoryBot.create(:user, email: 'user@example.com', password: 'password')

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content('success')
    expect(page.current_path).to eq(root_path)
  end

  scenario "User signs out" do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_button 'Logout'

    expect(page.current_path).to eq(new_user_session_path)
  end
end
