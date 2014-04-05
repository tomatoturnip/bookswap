require 'spec_helper'

feature 'user registration' do
  scenario 'a user signs up' do
    visit root_path
    click_on 'Sign up'

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
end
