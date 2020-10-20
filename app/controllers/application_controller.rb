class ApplicationController < ActionController::Base

<<<<<<< HEAD
=======
	before_action :configure_sign_up_params, if: :devise_controller?

  protected

	def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

>>>>>>> d24b27f59459ed766c42617af8c3ec61a5b447de
  def after_sign_in_path_for(resource)
  	users_path
  end

end
