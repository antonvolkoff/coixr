require 'spec_helper'

feature "Searches" do
  scenario "successful search by query" do
    FactoryGirl.create(:article, title: 'Test Article')

    visit root_url(query: "article")

    expect(page).to have_content 'Test Article'
  end
end
