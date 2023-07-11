module Blogs
  class Engine < Rails::Engine
    isolate_namespace Blogs

    # initializer 'blogs', before: :load_config_initializers do
    #   Rails.application.routes.append do
    #     # this will make this engine the root page for the whole app
    #     # mount Blogs::Engine => '/'

    #     # most engines will use this instead
    #     mount Blogs::Engine => '/blogs'
    #   end
    # end

    # initializer :append_migrations do |app|
    #   unless app.root.to_s.match root.to_s+File::SEPARATOR
    #     app.config.paths['db/migrate/'].concat(
    #       config.paths['db/migrate'].expanded
    #     )
    #   end
    # end
  end
end
