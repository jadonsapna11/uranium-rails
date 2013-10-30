require 'rails'
require 'uranium-rails/assert_select' if ::Rails.env.test?
require 'uranium-rails/rails/engine' if ::Rails.version >= '3.1'
require 'uranium-rails/rails/railtie'
module UraniumRails
  module Rails
  end
end
