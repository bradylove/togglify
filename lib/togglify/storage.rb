require 'pstore'

module Togglify
  class Storage
    attr_accessor :pstore

    def initialize
      @pstore = PStore.new(Togglify.file_path)
    end

    def list
      @pstore.transaction(true) { @pstore.roots }
    end

    def read(toggle)
      toggle = sanitize(toggle)
      @pstore.transaction(true) { @pstore[toggle] }
    end

    def write_on(toggle)
      write(toggle, :enabled)
    end

    def write_off(toggle)
      write(toggle, :disabled)
    end

    def env
      Rails.env.to_sym
    end

    private

    def write(toggle, status)
      toggle = sanitize(toggle)
      status = sanitize(status)
      existing_data = read(toggle) || {}
      existing_data.merge!(id: toggle, env => status)

      @pstore.transaction { @pstore[toggle] = existing_data }
    end

    def sanitize(toggle)
      toggle.to_s.downcase.to_sym
    end
  end
end
