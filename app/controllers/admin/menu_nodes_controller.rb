module Admin
  class MenuNodesController < Admin::BaseController
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_mode, only: [:edit]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    private

    def model
      MenuNode
    end

    def set_object
      @object = model.find_by(key: params[:id]) || model.find(params[:id])
      raise ActiveRecord::RecordNotFound if @object.nil?

      authorize! @object
    end

    def set_mode
      @mode = :reorder if allowed_to?(:reorder?, model) && params[:mode] == "reorder"
    end
  end
end
