require 'spec_helper'

feature 'a user signs in' do
  scenario 'signing in' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    # visit new_user_session_path
    # fill_in 'Email', with: user.email
    # fill_in 'Password', with: user.password

    # click_on 'Sign in'
    expect(page).to have_content("Welcome #{user.first_name}")
    expect(page).to have_content("Successfully signed in")
  end
end
