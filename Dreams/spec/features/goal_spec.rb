require 'spec_helper'
require 'rails_helper'

feature "Goal creation process" do

  before :each do
    sign_up_as_claire
  end

  it "has link to new goal" do
    expect(page).to have_content "New Goal"
  end

  it "has a new goal form" do
    click_on('New Goal')
    expect(page).to have_content "Create New Goal"
  end

  feature "filling out a goal" do
    before :each do
      FactoryGirl.create(:user)
      click_on "New Goal"
    end

    it "takes a title and description" do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Description'
    end

    it "validates presence of title" do
      fill_in 'Description', with: "Goal description"
      click_on 'Create Goal'
      expect(page).to have_content("Title can't be blank")
    end

    it "validates presence of description" do
      fill_in 'Title', with: "My Goal Title"
      click_on 'Create Goal'
      expect(page).to have_content("Description can't be blank")
    end

    feature "test successful goal" do
      before :each do
        # FactoryGirl.create(:goal)
        make_goal('My Goal Title', 'Goal description')
      end

      it "shows goal on homepage" do
        expect(page).to have_content "My Goal Title"
      end

      it "creates goal show page" do
        click_on 'My Goal Title'
        expect(page).to have_content "Goal description"
      end

    end

  end

end
