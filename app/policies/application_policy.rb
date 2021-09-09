class ApplicationPolicy
  attr_reader :trainer, :record

  def initialize(trainer, record)
    @trainer = trainer
    @record = record
  end

  class Scope
    attr_reader :trainer, :scope

    def initialize(trainer, scope)
      @trainer = trainer
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
