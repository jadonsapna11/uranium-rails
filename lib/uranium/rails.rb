require 'rails'
require 'uranium/assert_select' if ::Rails.env.test?
require 'uranium/rails/engine' if ::Rails.version >= '3.1'
require 'uranium/rails/railtie'
module UraniumRails
  module Rails
  end
end
