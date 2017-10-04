class User < ActiveRecord::Base
   serialize :list_of_micropost_id,Array
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :picture, PictureUploader
  validates :password, presence: true, length: { minimum: 6 }
  has_many :microposts
  
  def picture_size
    if picture.size>5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
