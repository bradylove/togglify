require 'spec_helper'

describe Togglify::Storage do
  let(:storage) { Togglify::Storage.new }
  let(:path)    { Rails.root + ".togglify"}

  before(:each) do
    FileUtils.rm path if File.exists? path
  end

  before(:each) do
    Rails.env = "test"

  end

  it "should be a class" do
    Togglify::Storage.class.should eq Class
  end

  it "should have a pstore object" do
    storage.pstore.class.should eq PStore
  end

  context "#write_on" do
    it "should write enabled to the pstore" do
      storage.write_on(:forum).should eq({ id: :forum, test: :enabled })
    end

    it "should change the toggle to a symbol if string is given" do
      storage.write_on("forum").should eq({ id: :forum, test: :enabled })
    end

    it "should add to the exisiting data hash" do
      storage.write_on(:forum)
      Rails.env = "development"
      storage.write_on(:forum).should eq({ id: :forum, test: :enabled, development: :enabled })
    end

    it "should overwite an existing data hash" do
      storage.write_on(:forum).should eq({ id: :forum, test: :enabled })
      storage.write_off(:forum).should eq({ id: :forum, test: :disabled })
    end
  end

  context "#write_off" do
    it "should write disabled to the pstore" do
      storage.write_off(:forum).should eq({ id: :forum, test: :disabled })
    end

    it "should change the toggle to a symbol if string is given" do
      storage.write_off("forum").should eq({ id: :forum, test: :disabled })
    end
  end

  context "#read" do
    it "should read the toggle state from the pstore" do
      storage.write_off :forum
      storage.read(:forum).should eq({ id: :forum, test: :disabled})
    end

    it "should change the toggle to sym if string is given" do
      storage.write_off :forum
      storage.read("forum").should eq({ id: :forum, test: :disabled })
    end

    it "should get all the root objects if no parameters given" do
      storage.write_off(:forum)
      storage.write_off(:blog)
      storage.list.should eq([:forum, :blog])
    end
  end

  context "#sanitize" do
    it "should change a string to a symble" do
      storage.send(:sanitize, "forum").should eq :forum
    end

    it "should downcase a string before symbolizing" do
      storage.send(:sanitize, "Forum").should eq :forum
    end

    it "should downcase and symbolize a class name" do
      storage.send(:sanitize, String).should eq :string
    end
  end
end
