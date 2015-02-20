require 'spec_helper'

feature 'User log in' do
  scenario "invalid credentials" do
    visit 'users/sign_in path'
    fill_in ("Name", with:"daddy")
    click_button "Log in"
    expect (current_path).to_eq(users/sign_in path)
  end
end