class DoctorSurgeriesController < ApplicationController
  def create
    doctor = Doctor.find_by(name: params[:DoctorName])
    surgery = Surgery.find(params[:id])
    DoctorSurgery.create!(doctor: doctor, surgery: surgery)

    redirect_to "/surgeries/#{params[:id]}"
  end
end
