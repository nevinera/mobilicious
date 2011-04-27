require 'action_pack'

module MightBeMobile
  def self.included(base)
    # puts "included!"
  end

  def is_mobile?
    return request.headers['User-Agent'] =~ /mobile/i
  end

end


ActionController::Base.instance_eval do
  def might_be_mobile
    include MightBeMobile
    helper_method :is_mobile?
  end
end


