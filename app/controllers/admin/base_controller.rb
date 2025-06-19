module Admin
  class BaseController < ApplicationController
    include Trek::Authentication
    include Trek::Authorization
    include Trek::Localization

    helper Trek::I18nHelper
    helper Trek::ThemeHelper

    layout "admin"

    default_form_builder Trek::FormBuilder
  end
end
