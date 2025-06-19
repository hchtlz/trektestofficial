# `PageVersion` is a version of a `Page`.
# There's always only one `current` version per page,
# and there can be other versions.
# Any version can be promoted to `current`.
class PageVersion < ApplicationRecord
  include Trek::Sectionable

  belongs_to :page, inverse_of: :versions

  validate :only_one_current_version_per_page, if: :current_since?
  validate :always_one_current_version_per_page, unless: :current_since?

  after_initialize :set_default_name, if: :new_record?

  strip_attributes

  delegate :sectioned?, to: :page

  include RecordImageUploader::Attachment(:image)

  def to_s
    name
  end

  def current?
    current_since?
  end

  def current_image
    image
  end

  def current_image_url
    image_url
  end

  def other_versions
    page.versions.where.not(id:)
  end

  def set_default_name
    return if page.blank?

    self.name ||= "#{page.title} (#{I18n.l(Time.zone.now.to_date)})"
  end

  private

  def only_one_current_version_per_page
    return unless other_versions.where.not(current_since: nil).any?

    errors.add(:current_since, "can't be set if there is already a current version")
  end

  def always_one_current_version_per_page
    return if other_versions.where.not(current_since: nil).any?

    errors.add(:current_since, "can't be nil if there is no current version")
  end
end
