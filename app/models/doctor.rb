class Doctor < ApplicationRecord
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.return_doctors_by_years_of_experience
    order('years_practiced DESC')
  end
end
