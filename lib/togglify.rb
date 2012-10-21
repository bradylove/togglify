require 'togglify/storage'

def Togglify(toggle, &block)
  yield if Togglify.enabled? toggle
end

module Togglify
  @@file_path = nil

  class << self
    def file_path
      @@file_path || Rails.root + ".togglify"
    end

    def file_path=(file_path)
      @@file_path = file_path
    end

    def enabled?(toggle)
      stored_toggle = storage.read(toggle)
      return true if stored_toggle.nil?
      return true if stored_toggle[storage.env] == :enabled

      false
    end

    def enable(toggle)
      storage.write_on toggle
    end

    def disable(toggle)
      storage.write_off toggle
    end

    private

    def storage
      Togglify::Storage.new
    end
  end
end
