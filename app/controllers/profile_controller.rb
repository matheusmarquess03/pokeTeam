class ProfileController < ApplicationController
  before_action :set_trainer, only: %i[show]
  def show; end

  private

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end
end
