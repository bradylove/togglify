require 'togglify/storage'

module Togglify
  @@file_path = nil

  class << self
    def file_path
      @@file_path || Rails.root + "/.togglify"
    end

    def file_path=(file_path)
      @@file_path = file_path
    end
  end
end
