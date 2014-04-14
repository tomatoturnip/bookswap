require 'spec_helper'

feature 'a user signs in', %Q{
  As a registered bookswapper
  I want to be able to log in to the site
  So that I can use the service
} do

  # Acceptance criteria:
  # * there is an option to sign up if I don't have an account
  # * must enter correct email
  # * must enter correct password
  # * can optionally reset password
  # * if logged in successfully, verification message displays, and is logged in
  # * if invalid credentials, error message displays, views login page again

  scenario 'signing in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content("Welcome #{user.first_name}")
    expect(page).to have_content("Successfully signed in")
  end
end
