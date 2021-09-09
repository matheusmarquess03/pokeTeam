class ApplicationController < ActionController::Base
  before_action :authenticate_trainer!

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  layout :layout_by_resource
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age gender picture])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name age gender picture])
  end

  private

  def layout_by_resource
    if devise_controller? && !devise_registration_edit_view?
      'login'
    else
      'application'
    end
  end

  def devise_registration_edit_view?
    request.fullpath.match?('/trainers/edit') || (request.fullpath.match('/trainers') && params[:action] == 'update')
  end

  # PUNDIT: Change current_user to current_trainer
  def pundit_user
    current_trainer
  end

  def user_not_authorized
    flash[:alert] = I18n.t(:you_are_not_authorized_to_perform_this_action)
    redirect_to(request.referer || home_path)
  end
end
