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
      toggle = sanitize(toggle)
      @pstore.transaction { @pstore[toggle.to_sym] = { id: toggle.to_sym, status: :enabled } }
    end

    def write_off(toggle)
      toggle = sanitize(toggle)
      @pstore.transaction { @pstore[toggle.to_sym] = { id: toggle.to_sym, status: :disabled } }
    end

    private

    def sanitize(toggle)
      toggle.to_s.downcase.to_sym
    end
  end
end
