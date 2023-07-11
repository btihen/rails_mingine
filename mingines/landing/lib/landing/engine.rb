module Landing
  class Engine < Rails::Engine
    isolate_namespace Landing

    initializer 'landing', before: :load_config_initializers do
      Rails.application.routes.append do
        # this will make this engine the root page for the whole app
        mount Landing::Engine => '/'

        # most engines will use this instead
        # mount Landing::Engine => '/landing'
      end
    end
  end
end
