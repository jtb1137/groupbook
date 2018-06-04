require "rails_helper"

RSpec.feature "Create a new post", type: :feature do
  let(:user) { create(:user) }
  before(:each) { sign_in user }

  shared_examples "user creates a new post" do |branch|
    scenario "successfully" do
      create(:category, name: "category", branch: branch)
      visit send("#{branch}_posts_path")
      find(".new-post-button").click
      fill_in "post[title]", with: "abc" * 10
      fill_in "post[content]", with: "abc" * 15
      select "category", from: "post[category_id]"
      click_on "Create Post"
      expect(page).to have_selector("h3", text: "abc" * 10)
    end
  end

  include_examples "user creates a new post", "hobby"
  include_examples "user creates a new post", "study"
  include_examples "user creates a new post", "team"
end