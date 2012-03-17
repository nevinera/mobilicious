require 'action_pack'

module MightBeMobile

  MOBILE_REGEX = /mobile/i

  def is_mobile?
    return true if params[:mobile].present?
    return request.headers['User-Agent'] =~ MOBILE_REGEX
  end

end


ActionController::Base.instance_eval do
  def might_be_mobile
    include MightBeMobile
    helper_method :is_mobile?
  end
end


