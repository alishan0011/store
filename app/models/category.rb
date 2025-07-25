class Category < ApplicationRecord

  has_many :videos
  has_many :category_accesses
  has_many :users, through: :category_accesses
  
end
