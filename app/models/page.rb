# `Page` represents a page on the website.
# By default, it includes all Trek model concerns,
# but you can disable the ones you don't need.
class Page < ApplicationRecord
  belongs_to :pageable, polymorphic: true, optional: true
  has_many :menu_nodes, as: :linkable, dependent: :delete_all

  has_closure_tree name_column: :slug,
    order: "position",
    numeric_order: true

  # Translate the attributes below.
  include Trek::Translatable
  translate_attributes :slug, :title, :description

  # Format the attributes below.
  include Trek::Formattable
  format_attributes Trek::TypographyFormatter, :title, :description

  include Trek::Contentable
  include Trek::Fragmentable
  include Trek::Orderable
  include Trek::Pages::Pathable
  include Trek::Pages::SearchEngineOptimizable
  include Trek::Pages::Scopes
  include Trek::Sectionable
  include Trek::Sluggable
  include Trek::Pages::Versionable
  include Trek::Keyable

  validates :title, presence: true

  strip_attributes

  include RecordImageUploader::Attachment(:image)

  def to_s
    title
  end
end
