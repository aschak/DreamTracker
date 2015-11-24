require 'spec_helper'
require 'rails_helper'

feature 'User Comments Creation' do

  before :each do
    sign_up_as_claire # id 1
    click_button 'Sign Out'
    sign_up_as_kareem # id 2
    make_comment("great123")
  end

  it "homepage has add comment option" do
    expect(page).to have_content "Add Comment"
  end

  it "validates the comment body" do
    visit "/users/1"
    fill_in "Comment", with: ""
    click_button "Add Comment"
    expect(page).to have_content "Body can't be blank"
  end

  it "Adds comments" do
    visit "/users/1"
    expect(page).to have_content "great123"
  end

  it "Deletes comments" do
    visit "/users/1"
    click_button "Delete Comment"
    expect(page).not_to have_content "great123"
  end

end
