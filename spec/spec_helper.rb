require 'simplecov'
SimpleCov.start

require 'rspec'
require 'togglify'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end

# Simulate rails root
module Rails
  @@env = "test"

  def self.root
    File.expand_path("../support/", __FILE__)
  end

  def self.env
    @@env
  end

  def self.env=(env)
    @@env = env
  end
end
