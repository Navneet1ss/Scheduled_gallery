class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :album, through: :taggings
end
