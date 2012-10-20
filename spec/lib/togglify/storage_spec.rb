require 'spec_helper'

describe Togglify::Storage do
  let(:storage) { Togglify::Storage.new }

  before(:all) do
    FileUtils.rm Rails.root + "/.togglify"
  end

  it "should be a class" do
    Togglify::Storage.class.should eq Class
  end

  it "should have a pstore object" do
    storage.pstore.class.should eq PStore
  end

  context "#write_on" do
    it "should write enabled to the pstore" do
      storage.write_on(:forum).should eq({ id: :forum, status: :enabled })
    end

    it "should change the toggle to a symbol if string is given" do
      storage.write_on("forum").should eq({ id: :forum, status: :enabled })
    end
  end

  context "#write_off" do
    it "should write disabled to the pstore" do
      storage.write_off(:forum).should eq({ id: :forum, status: :disabled })
    end

    it "should change the toggle to a symbol if string is given" do
      storage.write_off("forum").should eq({ id: :forum, status: :disabled })
    end
  end

  context "#read" do
    it "should read the toggle state from the pstore" do
      storage.read(:forum).should eq({ id: :forum, status: :disabled})
    end

    it "should change the toggle to sym if string is given" do
      storage.read("forum").should eq({ id: :forum, status: :disabled })
    end
  end

  context "#sanitize" do
    it "should change a string to a symble" do
      storage.send(:sanitize, "forum").should eq :forum
    end

    it "should downcase a string before symbolizing" do
      storage.send(:sanitize, "Forum").should eq :forum
    end
  end
end
