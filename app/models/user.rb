class User < ApplicationRecord
  include Trek::Users::Invitable
  include Trek::Users::Locales
  include Trek::Users::Roles
  include Trek::Users::Scopes
  include Trek::Users::Themes
  include Trek::Users::Validations

  strip_attributes

  def to_s
    name || email || super
  end

  authenticates_with_sorcery!
end
