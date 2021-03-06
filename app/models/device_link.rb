class DeviceLink < ApplicationRecord
  include SlugAble

  belongs_to :gallery

  scope :enabled, -> () { where(disabled: false) }

  def disable!
    update_attributes!(disabled: true)
  end
end
