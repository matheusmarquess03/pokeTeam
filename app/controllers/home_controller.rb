class HomeController < ApplicationController
  skip_before_action :authenticate_trainer!, only: [:index]
  def index; end
end
