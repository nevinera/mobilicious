# Mobilicious

require 'mobilicious/rails_ext'

module Mobilicious
  class Railtie < Rails::Railtie
    Mime::Type.register_alias 'text/html', :mobile
  end
end
