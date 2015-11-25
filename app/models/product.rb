class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :rank, :name, :image
  validates_uniqueness_of :name

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }

  belongs_to :group
end
