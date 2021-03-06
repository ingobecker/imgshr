class BossToken < ApplicationRecord
  include SlugAble

  belongs_to :gallery, dependent: :destroy
  has_many :pictures, through: :gallery
end
