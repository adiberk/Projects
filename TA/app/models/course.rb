class Course < ApplicationRecord
	has_many :enrollments
  	has_many :users, :through => :enrollments

	has_many :enrollment_tas
	has_many :tas, :through => :enrollment_tas, :source => :user

	has_many :officehours

	belongs_to :major
	has_one :university, :through => :major
end
