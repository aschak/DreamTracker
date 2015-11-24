require 'spec_helper'
require 'rails_helper'

feature 'User Comments Creation' do

  before :each do
    sign_up_as_claire # id 1
    logout
    sign_up_as_kareem # id 2 
  end

  it "homepage has add comment option" do
    expect(page).to have_content "Add Comment"
  end

  it "validates the comment body" do

  end



end
