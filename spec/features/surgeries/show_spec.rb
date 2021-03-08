require "rails_helper"

RSpec.describe "Surgeries show page" do
  describe "When I visit the Surgeries show page" do
    before :each do
      @surgery1 = Surgery.create!(title: "Tonsillectomy",
                                  day_of_week: "Tuesday",
                                  operating_room_number: 113)
      @doctor1 = Doctor.create!(name: "William Defoe",
                                years_practiced: 8,
                                university: "Harvard School of Medicine")
      @doctor2 = Doctor.create!(name: "Nicole Kidman",
                                years_practiced: 13,
                                university: "University of West Virginia")
      @doctor3 = Doctor.create!(name: "Brad Pitt",
                                years_practiced: 1,
                                university: "University of West Virginia")

      @doctor4 = Doctor.create!(name: "Shelley Duvall",
                                years_practiced: 11,
                                university: "University of West Virginia")

      DoctorSurgery.create(doctor: @doctor1, surgery: @surgery1)
      DoctorSurgery.create(doctor: @doctor2, surgery: @surgery1)
      DoctorSurgery.create(doctor: @doctor3, surgery: @surgery1)
    end

    it "displays a header letting the user know this is the surgeries show page" do
      visit "/surgeries/#{@surgery1.id}"
      expect(page).to have_content("#{@surgery1.title}")
    end

    it "displays the surgery's day of the week and operating room number" do
      visit "/surgeries/#{@surgery1.id}"

      within(".surgery-info") do
        expect(page).to have_content("#{@surgery1.day_of_week}")
        expect(page).to have_content("#{@surgery1.operating_room_number}")
      end
    end

    it "displays the names and years practiced of the doctors performing this surgery" do
      visit "/surgeries/#{@surgery1.id}"

      within(".doctors") do
        expect(page).to have_content("Name: William Defoe")
        expect(page).to have_content("Years Practiced: 8")

        expect(page).to have_content("Name: Nicole Kidman")
        expect(page).to have_content("Years Practiced: 13")

        expect(page).to have_content("Name: Brad Pitt")
        expect(page).to have_content("Years Practiced: 1")
      end
    end

    it "displays a section with the most experienced doctor including name and YoE" do
      visit "/surgeries/#{@surgery1.id}"

      within(".most-experienced") do
        expect(page).to have_content("Nicole Kidman")
        expect(page).to have_content("Years Practiced: 13")
      end
    end

    it "displays a section with the least experienced doctor including name and YoE" do
      visit "/surgeries/#{@surgery1.id}"

      within(".least-experienced") do
        expect(page).to have_content("Brad Pitt")
        expect(page).to have_content("Years Practiced: 1")
      end
    end

    it "displays a text field to add a doctor to this surgeyr" do
      visit "/surgeries/#{@surgery1.id}"

      expect(page).to have_field("DoctorName")
    end

    it "adds a doctor to the surgery page and displays doctor info" do
      visit "/surgeries/#{@surgery1.id}"

      fill_in "DoctorName", with: "Shelley Duvall"
      click_button 'Add Doctor'

      expect(current_path).to eq("/surgeries/#{@surgery1.id}")

      within(".doctors") do
        expect(page).to have_content("Name: Shelley Duvall")
        expect(page).to have_content("Years Practiced: 11")

      end
    end
  end
end
