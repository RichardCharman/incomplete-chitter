require 'spec_helper'

feature 'Creating peeps' do

  scenario 'create a new peep' do
    visit '/peeps/new'
    fill_in 'text',   with: 'This is a peep'
    click_button 'Submit peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'This is a peep'
    end
  end

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end