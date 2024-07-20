require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number in string" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers in string" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of numbers in string" do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    it "checks new lines between numbers in string" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "checks different delimiters in string" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for negative numbers in string" do
      expect { StringCalculator.add("1,-2,3") }.to raise_error("negative numbers are not allowed: -2")
    end

    it "raises an error for multiple negative numbers in string" do
      expect { StringCalculator.add("1,-2,-3") }.to raise_error("negative numbers are not allowed: -2, -3")
    end
  end
end
