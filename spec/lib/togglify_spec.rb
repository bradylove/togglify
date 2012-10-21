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

  context "#Togglify" do
    it "should yield if toggle is enabled" do
      Togglify.send(:storage).write_on :forum
      expect { |b| Togglify(:forum, &b) }.to yield_control
    end

    it "should not yield if toggle is disabled" do
      Togglify.send(:storage).write_off :forum
      expect { |b| Togglify(:forum, &b) }.not_to yield_control
    end
  end

  context "#enable" do
    it "should enable the toggle" do
      Togglify.enable :forum
      Togglify.enabled?(:forum).should be_true
    end

    it "should disable the toggle" do
      Togglify.disable :forum
      Togglify.enabled?(:forum).should be_false
    end
  end

  context "#enabled?" do
    it "should be enabled by default" do
      FileUtils.rm path
      Togglify.enabled?(:forum).should be_true
    end

    it "should be true if status is enabled" do
      Togglify.send(:storage).write_on :forum
      Togglify.enabled?(:forum).should be_true
    end

    it "should be false status is not enabled" do
      Togglify.send(:storage).write_off :forum
      Togglify.enabled?(:forum).should be_false
    end
  end

  context "#storage" do
    it "should have a storage object" do
      Togglify.send(:storage).class.should eq Togglify::Storage
    end

    it "should be a private method" do
      -> { Togglify.storage }.should raise_error
    end

    it "should not allow the object to be changed" do
      -> { Togglify.storage = "Something Else" }.should raise_error
      -> { Togglify.send(:storage=, "Something Else") }.should raise_error
    end
  end
end
