require 'spec_helper'

describe Togglify do
  let(:path) { Rails.root + "/.togglify" }

  it "should be a module" do
    Togglify.class.should eq Module
  end

  it "should have a file_path class variable" do
    Togglify.file_path = path
    Togglify.file_path.should eq path
  end
end
