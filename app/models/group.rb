class Group < ActiveRecord::Base
  validates_presence_of :rank, :name
  validates_uniqueness_of :name

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }

  belongs_to :primary_product, class_name: Product
  has_many :products
end
