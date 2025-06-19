# `Fragment` is a chunk of content that can be used
# anywhere on the website, and can be edited from
# the admin panel.
class Fragment < ApplicationRecord
  include Trek::Contentable
  include Trek::Keyable

  # Translate the attributes below.
  include Trek::Translatable
  translate_attributes :title, :content

  # TODO: refactor with `include Orderable`
  acts_as_list scope: [:namespace], top_of_list: 0

  strip_attributes

  validates :key, uniqueness: { scope: "namespace" }

  scope :ordered, -> { order(:position) }

  def to_s
    [namespace, key].join(".")
  end
end
