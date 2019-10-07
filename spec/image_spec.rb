require 'spec_helper'

RSpec.describe Image, type: :model do

  describe "blurring should work" do

    it "one pixel should transform" do
      input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]

      expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0]
      ]
     image = Image.new(input)
     expect(image.blur).to eq expected
    end

    it "two pixels should transform" do
      input = [
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 0]
      ]

      expected = [
        [0, 1, 0, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 1, 1, 1],
        [0, 0, 1, 0]
      ]
     image = Image.new(input)
     expect(image.blur).to eq expected
    end

    it "edge pixels should transform" do
      input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [1, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 1],
        [0, 0, 0, 0]
      ]

      expected = [
        [0, 0, 0, 0],
        [1, 0, 0, 0],
        [1, 1, 0, 0],
        [1, 0, 0, 1],
        [0, 0, 1, 1],
        [0, 0, 0, 1]
      ]
     image = Image.new(input)
     expect(image.blur).to eq expected
    end

  end
end
