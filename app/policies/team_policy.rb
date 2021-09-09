class TeamPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    @record.trainer == @trainer
  end

  def update?
    @record.trainer == @trainer
  end

  def destroy?
    @record.trainer == @trainer
  end
end
