require 'spec_helper'

feature 'user has a profile page', %Q{
  As a registered bookswapper
  I want to have a profile page
  So that I can provide information about myself
  } do

  # Acceptance criteria:
  # * must enter home address
  # * edit profile settings

  scenario 'registered user can enter home address for personal profile' do
    visit books_path
    click_on 'My BookShelf'

    fill_in 'Street Address', with: '123 Hyne Street'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Zipcode', with: '02129'

    click_on 'submit'

    expect(page).to have_content('123 Hyne Street')
  end
end
