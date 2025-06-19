module Admin
  class PagesController < Trek::ResourceController
    before_action :set_mode, only: [:index]

    def index
      super

      # Hide pages associated to resources
      @objects = @objects.where(pageable_id: nil)

      # Remove root from reorder mode (cannot be moved)
      @objects = @objects.where.not(key: "root") if @mode == :reorder
    end

    def edit
      super

      redirect_to [:edit, :admin, @object.pageable] if @object.pageable.present?
    end

    private

    def model
      Page
    end

    def set_mode
      @mode = :reorder if allowed_to?(:reorder?, model) && params[:mode] == "reorder"
    end
  end
end
