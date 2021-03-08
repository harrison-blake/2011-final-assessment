require "rails_helper"

describe Doctor, type: :model do
   describe "relationships" do
      it {should have_many(:doctor_surgeries)}
      it {should have_many(:surgeries).through(:doctor_surgeries)}
   end

   describe "Class Methods" do
     before :each do
       @doctor1 = Doctor.create!(name: "William Defoe",
                                 years_practiced: 8,
                                 university: "Harvard School of Medicine")
       @doctor2 = Doctor.create!(name: "Nicole Kidman",
                                 years_practiced: 13,
                                 university: "University of West Virginia")

       @doctor3 = Doctor.create!(name: "Brad Pitt",
                                years_practiced: 2,
                                university: "University of West Virginia")

     end

     describe "##return_doctors_by_years_of_experiences" do
       it "returns all doctors in order by years practiced most to least" do
         doctors = Doctor.return_doctors_by_years_of_experience

         expect(doctors.first).to eq(@doctor2)
         expect(doctors.second).to eq(@doctor1)
         expect(doctors.third).to eq(@doctor3)
       end
     end

     describe "##return_most_experienced_doctor" do
       it "returns the doctor with the most years practiced" do
         doctor = Doctor.return_most_experienced_doctor
         expect(doctor).to eq(@doctor2)
       end
     end

     describe "##return_least_experienced_doctor" do
       it "returns the doctor with the least years practiced" do
         doctor = Doctor.return_least_experienced_doctor
         expect(doctor).to eq(@doctor3)
       end
     end
   end
end
