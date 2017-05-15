class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # attr_accessor :username
  validates :username, presence: true, uniqueness: {case_sesitive: false}
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence:true, length: {maximum: 50}
  validates :email, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validate  :picture_size
  has_many :enrollments
  has_many :courses, :through => :enrollments

  has_many :enrollment_tas
  has_many :tacourses, :through => :enrollment_tas, :source => :course

  has_many :ta_appointments, :class_name => 'Appointment', :foreign_key => 'ta_id'
  has_many :student_appointments, :class_name => 'Appointment', :foreign_key => 'student_id'

  has_many :officehours, :foreign_key => 'ta_id'

  has_many :student_reviews, :class_name => 'Review', :foreign_key => 'student_id'
  has_many :ta_reviews, :class_name => 'Review', :foreign_key => 'ta_id'

  has_many :messages, dependent: :destroy

  mount_uploader :picture, PictureUploader

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
