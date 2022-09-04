class DietPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.guest?
  end

  def update?
    user.author?(record) || user.admin_role?
  end

  def destroy?
    user.author?(record) || user.admin_role?
  end
end