require "rails_helper"

RSpec.describe "Doctors index page" do
  describe "When I visit the Doctor Index" do
    before :each do
      @doctor = Doctor.create!(name: "William Defoe",
                               years_practiced: 8,
                               university: "Harvard School of Medicine")
    end

    it "displays a header letting the user know this is the doctors index" do
      visit "/doctors"
      expect(page).to have_content("Doctors Index")
    end

    it "displays all the doctors names, years practiced, and universities" do
      visit "/doctors"

      within(".doctors") do
        expect(page).to have_content("Name: William Defoe")
        expect(page).to have_content("Years Practiced: 8")
        expect(page).to have_content("University: Harvard School of Medicine")
      end
    end
  end
end
