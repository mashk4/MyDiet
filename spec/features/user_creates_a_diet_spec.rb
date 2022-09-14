require 'rails_helper'

RSpec.describe 'User creates a diet', js: true, type: :feature do
  scenario 'creates a diet' do
    login_as(FactoryBot.create(:user))

    visit new_diet_path
    fill_in 'Name', with: 'My new diet'
    page.execute_script("$('#diet_date').val('2022-09-13')")
    click_on 'Save Diet'
    expect(page).to have_content('My new diet')
  end
end