require "rails_helper"

RSpec.feature "Creating of new hospital" do
	scenario "with valid params" do
		visit "/"

		click_link "New Hospital"
		fill_in "Number", with: "909"
		click_button "Create Hospital"

		expect(page).to have_content("Hospital was successfully created.")
	end

	scenario "with invalid params" do
		visit "/"

		click_link "New Hospital"
		click_button "Create Hospital"

		expect(page).to have_content("Hospatal was not been created.")
	end
end