class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |row|
      str = ""
      row.each do |digit|
        str << digit.to_s
      end
      puts str
    end
  end

  def blur
    # good code
    puts "trans-sandwich"

    #make copy of data
    dataCopy = []
    @data.map { |row|
      newRow = []
      row.map { |value|
        newRow.push(value)
      }
      dataCopy.push(newRow)
    }

    #on each side of a '1', make also a '1'
    @data.each_with_index.map { |row, i|
      row.each_with_index.map { |value, j|

        if value == 1

          #up
          if i-1 >= 0
            dataCopy[i-1][j] = 1
          end

          #down
          if i+1 < @data.length
            dataCopy[i+1][j] = 1
          end

          #left
          if j-1 >= 0
            dataCopy[i][j-1] = 1
          end

          #right
          if j+1 < @data[i].length
            dataCopy[i][j+1] = 1
          end

        end

      }
    }

    return dataCopy
  end

  def blur_manhattan_distance(n)
    n.times { blur_transformation }
  end
end

# image = Image.new([
#   [0, 0, 0, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 0, 0, 0],
#   [0, 0, 1, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 0, 1, 0],
#   [0, 0, 0, 0, 0, 0, 0, 0],
# ])
#
# image.output_image
# image.blur
# image.output_image
