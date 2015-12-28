class Gallery < ActiveRecord::Base
  include BossTokenAble::Model
  include SlugAble

  has_many :pictures, dependent: :destroy

  def increase_visits!
    update_column(:visits, visits + 1)
  end

  def last_update
    pictures.order('created_at desc').limit(1).first.updated_at
  rescue NoMethodError
    updated_at
  end

  def to_s
    name.blank? ? slug : name
  end
end
