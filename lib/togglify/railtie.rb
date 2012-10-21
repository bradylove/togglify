require 'togglify'

module Togglify
  if defined? Rails::Railtie
    require 'rails'

    class Railtie < Rails::Railtie
      rake_tasks do
        load "tasks/togglify.rake"
      end
    end
  end
end
