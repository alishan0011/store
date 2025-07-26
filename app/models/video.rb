class Video < ApplicationRecord

  belongs_to :category
  belongs_to :user
  has_one_attached :file

  validates :title, :description, :category_id, presence: true

  enum status: { unpublished: 0, published: 1 }

end
