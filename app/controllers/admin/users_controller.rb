module Admin
  class UsersController < Trek::ResourceController
    def new
      super
      @object.role = "editor"
    end

    private

    def model
      User
    end

    def success_redirect
      if allowed_to?(:index?, @object)
        [:admin, model_collection]
      elsif allowed_to?(:show?, @object)
        [:admin, @object]
      else
        [:admin, :root]
      end
    end
  end
end
