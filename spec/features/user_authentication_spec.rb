require 'rails_helper'

RSpec.feature "UserAuthentication", type: :feature do
  before(:each) do

  end

  scenario "User signs up" do
    visit new_user_registration_path

    fill_in I18n.t('common.authentication.email'), with: 'test@example.com'
    fill_in I18n.t('common.authentication.password'), with: 'password', match: :prefer_exact
    fill_in I18n.t('common.authentication.password_confirmation'), with: 'password', match: :prefer_exact
    click_button I18n.t('common.authentication.sign_up')

    expect(page.current_path).to eq(root_path)
  end

  scenario "User signs in" do
    user = FactoryBot.create(:user, email: 'user@example.com', password: 'password')

    visit new_user_session_path

    fill_in I18n.t('common.authentication.email'), with: user.email
    fill_in I18n.t('common.authentication.password'), with: user.password
    click_button I18n.t('common.authentication.sign_in')

    expect(page.current_path).to eq(root_path)
  end

  scenario "User signs out" do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in I18n.t('common.authentication.email'), with: user.email
    fill_in I18n.t('common.authentication.password'), with: user.password
    click_button I18n.t('common.authentication.sign_in')
    click_button I18n.t('common.authentication.sign_out')

    expect(page.current_path).to eq(new_user_session_path)
  end
end
