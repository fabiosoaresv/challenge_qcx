require 'rails_helper'

feature 'User sees the main page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('What do you want know?')
  end

  scenario 'when choice range is LAST_YEAR' do
    visit root_path
    select 'LAST_YEAR', from: 'params[choice]'
    click_on 'Confirmar'
  end

  scenario 'when choice range is LAST_MONTH' do
    visit root_path
    select 'LAST_MONTH', from: 'params[choice]'
    click_on 'Confirmar'
  end

  scenario 'when choice range is LAST_WEEK' do
    visit root_path
    select 'LAST_WEEK', from: 'params[choice]'
    click_on 'Confirmar'
  end

  scenario 'when choice range is LAST_DAY' do
    visit root_path
    select 'LAST_DAY', from: 'params[choice]'
    click_on 'Confirmar'
  end
end
