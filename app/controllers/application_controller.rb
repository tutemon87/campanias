class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate
  protect_from_forgery with: :exception
  include SessionsHelper



  private
    def authenticate
      case request.format
        when 'json'
            authenticate_token || render_unauthorized
        else
          unless current_user
            redirect_to login_url
          end
        end
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        token == 'Responsibility'
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad credentials', status: 401
    end
end
