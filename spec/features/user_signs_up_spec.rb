require 'spec_helper'

feature 'user registration', %Q{
  As a person interested in using the service
  I want to sign up
  So that I can swap books with others
  } do

  # Acceptance criteria:
  #  * there is an option to log in if I already have an account
  #  * must enter unique and valid email
  #  * must enter a unique username
  #  * must enter a unique password and confirm it
  #  * must enter a valid home address
  #  * if logged in successfully, verification message displays, and is logged in
  #  * if invalid credentials, error message displays, views 'login' page again

  scenario 'a user signs up' do
    visit root_path
    click_on 'Sign up'

    fill_in 'Username', with: 'tester'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'First name', with: 'Lydia'
    fill_in 'Last name', with: 'Ho'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    within('form') do
      click_on 'Sign up'
    end
    expect(page).to have_content('Successfully signed up')
    expect(page).to have_content('Welcome Lydia')
    expect(current_path).to eq(root_path)
  end

  scenario 'a user signs up without a username' do
    visit new_user_registration_path
    FactoryGirl.build(:user)

    within('form') do
      click_on 'Sign up'
    end
    expect(page).to have_content("can't be blank")
  end

  scenario 'a user signs up without an email' do
    visit new_user_registration_path
    FactoryGirl.build(:user, username: 'pebbles', email: nil)

    within('form') do
      click_on 'Sign up'
    end
    expect(page).to have_content("can't be blank")
  end
end
