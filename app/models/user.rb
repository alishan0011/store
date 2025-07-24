class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  validates :name, presence: true
  validates :father_name, presence: true
  validates :cell_no, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :password, presence: true, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email,presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not valid" },uniqueness: true
  

  validates :image, presence: true

  validate :image_validation

  private

  def image_validation
    if image.attached?
      if image.blob.byte_size > 1.megabyte
        errors.add(:image, "size should be less than 1 MB")
      end

      acceptable_types = ["image/jpeg", "image/png", "image/jpg", "image/webp", "image/gif"]
      unless acceptable_types.include?(image.blob.content_type)
        errors.add(:image, "must be a JPEG, PNG, JPG, WEBP, or GIF")
      end
    end
  end


end
