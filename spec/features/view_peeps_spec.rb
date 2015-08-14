require 'spec_helper'

feature 'View peeps' do

  scenario 'see existing peeps' do
    peep = Peep.new(text: 'What a lovely day')
    peep.save
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'What a lovely day'
    end
  end

end