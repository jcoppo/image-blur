class Image
  attr_reader :array2d

  def initialize(array2d)
    @array2d = []
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

  def output_image_with(array)
    array.each do |row|
      str = ""
      row.each do |digit|
        str << digit.to_s
      end
      puts str
    end
  end

  def blur_transformation

    puts "trans-sandwich"

    #make copy of array2d
    newArray = []
    @array2d.map { |row|
      newRow = []
      row.map { |value|
        newRow.push(value)
      }
      newArray.push(newRow)
    }

    #on each side of 1, make it 1 also
    @array2d.each_with_index.map { |row, i|
      row.each_with_index.map { |value, j|

        if value == 1

          #up
          if i-1 >= 0
            newArray[i-1][j] = 1
          end

          #down
          if i+1 < @array2d.length
            newArray[i+1][j] = 1
          end

          #left
          if j-1 >= 0
            newArray[i][j-1] = 1
          end

          #right
          if j+1 < @array2d[i].length
            newArray[i][j+1] = 1
          end

        end

      }
    }

    @array2d = newArray

  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0],
])

image.output_image
image.blur_transformation
image.output_image
image.blur_transformation
image.output_image
image.blur_transformation
image.output_image
