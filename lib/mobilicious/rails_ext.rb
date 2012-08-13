require 'action_pack'

module MightBeMobile
  MOBILE_REGEX = /mobile/i

  def is_mobile?
    if session[:mobile_param]
      session[:mobile_param] == '1'
    else
      request.user_agent =~ MOBILE_REGEX
    end
  end

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if is_mobile?
  end
end

ActionController::Base.instance_eval do
  def might_be_mobile
    include MightBeMobile
    helper_method :is_mobile?
    before_filter :prepare_for_mobile
  end
end
