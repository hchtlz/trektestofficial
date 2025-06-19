# `PagePath` represents a path to a given `Page`.
# It can be the current path, or a former path.
# This allows to redirect old paths to the current path.
class PagePath < ApplicationRecord
  # Translate the attributes below.
  include Trek::Translatable
  translate_attributes :path

  belongs_to :page
  has_one :current_page,
    class_name: "Page",
    dependent: :nullify,
    foreign_key: "current_path_id",
    inverse_of: :current_path
end
