module Refinery
  module Snoods
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Snoods

      engine_name :refinery_snoods

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "snoods"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.snoods_admin_snoods_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Snoods)
      end
    end
  end
end
