module Admin
  class Dashboard < Trek::Dashboard::Config
    MODELS_IN_MENU = [
      Page,
      Fragment
    ].freeze

    def self.menu_models
      MODELS_IN_MENU
    end
  end
end
