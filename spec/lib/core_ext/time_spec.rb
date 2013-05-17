
require 'spec_helper'

describe Time do
  context "with QualityTime extensions" do

    shared_examples_for "a symmetrically convertible Date value" do

      it "returns an equivalent Date for value in Julian range" do
        t = Time.send(constructor, 1582, 10, 4)
        t.send(method).send(reconverter).should == t
      end

      it "returns an equivalent Date for value in proleptic Gregorian range" do
        t = Time.send(constructor, 1582, 10, 14)
        t.send(method).send(reconverter).should == t
      end

      it "returns an equivalent Date for value in Gregorian range" do
        t = Time.send(constructor, 1582, 10, 15)
        t.send(method).send(reconverter).should == t
      end

    end

    shared_examples_for "a value convertible to a fixed calendar Date" do

      it "returns an equivalent Date for value in Julian range" do
        t = Time.send(constructor, 1582, 10, 4)
        t.send(method).start.should == start_day
      end

      it "returns an equivalent Date for value in proleptic Gregorian range" do
        t = Time.send(constructor, 1582, 10, 14)
        t.send(method).start.should == start_day
      end

      it "returns an equivalent Date for value in Gregorian range" do
        t = Time.send(constructor, 1582, 10, 15)
        t.send(method).start.should == start_day
      end

    end

    describe "#to_gregorian_date" do

      let(:method)    { :to_gregorian_date }
      let(:start_day) { Date::GREGORIAN    }

      context "with UTC Time object" do

        let(:constructor) { :utc         }
        let(:reconverter) { :to_utc_time }

        it_should_behave_like "a symmetrically convertible Date value"
        it_should_behave_like "a value convertible to a fixed calendar Date"

      end

      context "with local Date object" do

        let(:constructor) { :local         }
        let(:reconverter) { :to_local_time }

        it_should_behave_like "a symmetrically convertible Date value"
        it_should_behave_like "a value convertible to a fixed calendar Date"

      end

    end

    describe "#to_julian_date" do

      let(:method)    { :to_julian_date }
      let(:start_day) { Date::JULIAN    }

      context "with UTC Time object" do

        let(:constructor) { :utc         }
        let(:reconverter) { :to_utc_time }

        it_should_behave_like "a symmetrically convertible Date value"
        it_should_behave_like "a value convertible to a fixed calendar Date"

      end

      context "with local Time object" do

        let(:constructor) { :local         }
        let(:reconverter) { :to_local_time }

        it_should_behave_like "a symmetrically convertible Date value"
        it_should_behave_like "a value convertible to a fixed calendar Date"

      end

    end

    describe "#to_date" do

      let(:method) { :to_date }

      context "with UTC Time object" do

        let(:constructor) { :utc         }
        let(:reconverter) { :to_utc_time }

        it_should_behave_like "a symmetrically convertible Date value"
        # NOTE: start day of Date is variable

      end

      context "with local Time object" do

        let(:constructor) { :local         }
        let(:reconverter) { :to_local_time }

        it_should_behave_like "a symmetrically convertible Date value"

      end

    end

  end
end

