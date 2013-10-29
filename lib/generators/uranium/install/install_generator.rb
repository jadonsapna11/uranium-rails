require 'rails'

# Supply generator for Rails 3.0.x or if asset pipeline is not enabled
if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled || !File.exist?('app/assets/javascripts/application.js') || !File.exist?('app/assets/javascripts/application.js.coffee')
  module UraniumRails
    module Generators
      class InstallGenerator < ::Rails::Generators::Base

        desc "This generator installs UraniumRails"
        source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

        def copy_uranium
          say_status("copying", "uranium js", :green)
          copy_file "uranium-pretty.js", "public/javascripts/uranium-pretty.js"
          copy_file "uranium.js", "public/javascripts/uranium.js"
        end
      end
    end
  end
else
  module UraniumRails
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "This generator add UraniumRails  to application.js or application.js.coffee"
        source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)
        def add_assets
          uranium_rails_defaults = ::Rails.env.production? || ::Rails.env.test? ? %w(uranium) : %w(uranium-pretty)
          insert_into_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[1]} require #{uranium_rails_defaults}\n", :after => "jquery_ujs\n"
        end
        
        def detect_js_format
          return ['.js.coffee', '#='] if File.exist?('app/assets/javascripts/application.js.coffee')
          return ['.js', '//='] if File.exist?('app/assets/javascripts/application.js')
        end
      end
    end
  end
end
