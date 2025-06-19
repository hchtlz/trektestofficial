class ExternalLink < ApplicationRecord
  has_many :menu_nodes, as: :linkable, dependent: :destroy

  validates :key, uniqueness: true, allow_nil: true
  validates :url, presence: true

  strip_attributes

  def to_s
    url
  end
end
