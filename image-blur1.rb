class Image
  attr_reader :array2d

  def initialize(array2d)
    @array2d = array2d
  end

  def output_image
    @array2d.each do |row|
      str = ""
      row.each do |digit|
        str << digit.to_s
      end
      puts str
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
