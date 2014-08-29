class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_user

  def user_signed_in?
    !current_user.nil?
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    return @current_user
  end
  
  def authenticate_user!
    redirect_to about_url unless user_signed_in? 
  end
    
  def unauthenticate_user!
    session.delete(:account_group_id)
    redirect_to about_url
  end

  def authorize_api_request
    # TODO Verify authorization token
    uid = request.headers['X-Authorize-UID']
    uri = request.headers['REQUEST_URI']

    data = "#{uid}-#{uri}"
    Rails.logger.info("data = #{data}")
    Rails.logger.info("authorize = [#{request.headers['Authorization']}]")

    authenticate_or_request_with_http_token do |token, options|
      begin
        Rails.logger.info("token = #{token}")
        check = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV["API_SECRET"], data)
        Rails.logger.info("check = #{check} same: #{check == token}")
        token_ok = (check == token)
        if token_ok
          @current_user = User.find_by_provider_and_uid('bouncer', uid)
        end
        token_ok
      rescue Exception => e
        Rails.logger.info("Exception #{e.inspect}")
      end
    end
  end


end
