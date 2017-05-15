class University < ApplicationRecord
  has_many :majors
  has_many :courses, :through=> :majors

end
