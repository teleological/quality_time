
require 'spec_helper'

describe Date do
  context "with QualityTime extensions" do

    shared_examples_for "a symmetrically convertible Time value" do

      it "returns an equivalent Time for Julian value, Julian start" do
        d = Date.new(1582, 10, 4)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for Julian value, Gregorian start" do
        d = Date.new(1582, 10, 4, Date::GREGORIAN)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for proleptic Gregorian gap value" do
        d = Date.new(1582, 10, 14, Date::GREGORIAN)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for Gregorian value" do
        d = Date.new(1582, 10, 15)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for Gregorian value, Julian start" do
        d = Date.new(1582, 10, 15, Date::JULIAN)
        d.send(method).to_date.should == d
      end

    end

    describe "#to_local_time" do

      let(:method) { :to_local_time }

      it_should_behave_like "a symmetrically convertible Time value"

      it "returns a local Time object" do
        Date.new.send(method).should_not be_utc
      end

    end

    describe "#to_utc_time" do

      let(:method) { :to_utc_time }

      it_should_behave_like "a symmetrically convertible Time value"

      it "returns a utc Time object" do
        Date.new.send(method).should be_utc
      end

    end

    # The following examples do not specify the behavior of QualityTime
    # but demonstrate why it's needed: Standard library Date#to_time
    # doesn't play well with Julian dates
    describe "#to_time" do

      let(:method) { :to_time }

      it "returns an equivalent Time for Julian value, Julian start" do
        pending "Date#to_time does not return a valid Time for Julian dates"
        d = Date.new(1582, 10, 4)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for Julian value, Gregorian start" do
        d = Date.new(1582, 10, 4, Date::GREGORIAN)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for proleptic Gregorian gap value" do
        d = Date.new(1582, 10, 14, Date::GREGORIAN)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for Gregorian value" do
        d = Date.new(1582, 10, 15)
        d.send(method).to_date.should == d
      end

      it "returns an equivalent Time for Gregorian value, Julian start" do
        pending "Date#to_time does not return a valid Time for Julian dates"
        d = Date.new(1582, 10, 15, Date::JULIAN)
        d.send(method).to_date.should == d
      end

      it "returns a local Time object" do
        Date.new.to_time.should_not be_utc
      end

    end

  end
end

