require 'spec_helper'

feature 'User sign up' do

   def sign_up(user)
    visit "/users/new"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :name, with: user.name
    fill_in :username, with: user.username
    click_button "Sign up"
  end
  
  scenario 'as a new user' do
    user = build.user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.email}")
    expect(User.first.username).to eq("#{user.email}")
  end

end