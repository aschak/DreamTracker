require 'spec_helper'
require 'rails_helper'


feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do

    before(:each) do
      fill_in 'username', with: "test_name"
      fill_in 'password', with: "password"
      click_on "Create User"
    end
    # it "redirects to user show page" do
    #   expect(page).to have_url "users/show/1"
    # end

    it "shows username on the homepage after signup" do
      expect(page).to have_content "test_name"
    end
  end

end

feature "logging in" do

  before(:each) do
    FactoryGirl.create(:user)
    visit "/session/new"
    fill_in 'username', with: "test_name"
    fill_in 'password', with: "password"
    click_on "Sign In"
  end

  it "shows username on the homepage after login" do
    expect(page).to have_content "test_name"
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit "/session/new"
    expect(page).to have_content "Sign In"
  end

  it "doesn't show username on the homepage after logout" do
    visit "users/new"
    fill_in 'username', with: "test_name"
    fill_in 'password', with: "password"
    click_on "Create User"
    click_on "Sign Out"
    expect(page).not_to have_content "test_name"
  end

end
