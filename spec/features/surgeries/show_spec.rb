require "rails_helper"

RSpec.describe "Surgeries show page" do
  describe "When I visit the Surgeries show page" do
    before :each do
      @surgery1 = Surgery.create!(title: "Tonsillectomy",
                                  day_of_week: "Tuesday",
                                  operating_room_number: 113)
    end

    it "displays the surgery's title, day of the week and operating room number" do
      visit "/surgeries/#{@surgery1.id}"
    end
  end
end
