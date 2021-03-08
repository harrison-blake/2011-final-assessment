class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.return_doctors_by_years_of_experience
  end
end
