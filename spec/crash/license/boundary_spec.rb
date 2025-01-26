# frozen_string_literal: true

RSpec.describe Crash::License::Boundary do
  describe "#add_boundary" do
    it "adds expected boundary" do
      result = described_class.add_boundary("Some\nmultiline\ndata", "CRASH")

      expect(result).to eq(<<~BOUNDARY.chomp)
        ---------------------BEGIN CRASH LICENSE--------------------
        Some
        multiline
        data
        ----------------------END CRASH LICENSE---------------------
      BOUNDARY
    end
  end

  describe "#remove_boundary" do
    it "removes the boundary" do
      result = described_class.remove_boundary(<<~BOUNDARY)
        ---------------------BEGIN CRASH LICENSE--------------------
        Some
        multiline
        data
        ----------------------END CRASH LICENSE---------------------
      BOUNDARY

      expect(result).to eq("Some\nmultiline\ndata")
    end

    it "removes partial boundaries" do
      result = described_class.remove_boundary(<<~BOUNDARY.chomp)
        ---------------------BEGIN CRASH LICENSE--------------------
        Some
        multiline
        data
      BOUNDARY

      expect(result).to eq("Some\nmultiline\ndata")
    end
  end
end