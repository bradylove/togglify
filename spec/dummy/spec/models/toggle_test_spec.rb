require 'spec_helper'

describe ToggleTest do
  Togglify(:toggle_tests) do
    it "should return true" do
      ToggleTest.is_it_true?(true).should be_true
    end

    it "should return true" do
      ToggleTest.is_it_true?(false).should be_false
    end
  end

  context "non togglified spec" do
    before :each do
      Togglify.disable :toggle_tests
    end

    it "should raise an error if toggle_tests is disabled" do
      -> { ToggleTest.is_it_true?(true) }.should raise_error
    end
  end
end
