module Admin
  class ExternalLinkPolicy < ApplicationPolicy
    # See https://actionpolicy.evilmartians.io/#/writing_policies
    #
    # def index?
    #   true
    # end
    #
    # def update?
    #   # here we can access our context and record
    #   user.admin? || (user.id == record.user_id)
    # end

    # Scoping
    # See https://actionpolicy.evilmartians.io/#/scoping
    relation_scope do |relation|
      next relation if user.privileged?

      relation.where(user:)
    end
  end
end
