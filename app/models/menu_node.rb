class MenuNode < ApplicationRecord
  belongs_to :parent, optional: true
  belongs_to :linkable, polymorphic: true, optional: true

  has_closure_tree dependent: :destroy,
    order: "position",
    numeric_order: true

  # Translate the attributes below.
  include Trek::Translatable
  translate_attributes :title, :label

  include Trek::Orderable

  validates :key, uniqueness: { scope: "parent" }, allow_nil: true

  strip_attributes

  def icon?
    icon_key?
  end

  def icon
    IconComponent.new(icon_key) if icon_key
  end

  def external_link?
    linkable_type == "ExternalLink"
  end

  def to_s
    title || label || key
  end

  def to_param
    key || id
  end
end
