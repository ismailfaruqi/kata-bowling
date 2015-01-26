class Frames

  MAX_FRAMES = 10

  def initialize()
    @frames = []
  end

  # obtain the current game's bowling frames
  #
  def frames
    @frames
  end

  def from_string(str)
    str.chomp.scan(/X|\d|\/|-/).each_with_index do |turn, index|
      case turn
      when 'X'
        @frames << 10
      when '/'
        @frames << 10 - @frames[index - 1]
      when '-'
        @frames << 0
      else
        @frames << turn.to_i
      end
    end
  end

  # calculate the final score of a valid sequence of bowling frames
  #
  def final_score
    total = 0
    frames = 0
    current_idx = 0
    loop do 
      if is_strike(current_idx)
        total += (@frames[current_idx] + @frames[current_idx + 1] + @frames[current_idx + 2])
        current_idx += 1
      elsif is_spare(current_idx)
        total += (@frames[current_idx] + @frames[current_idx + 1] + @frames[current_idx + 2])
        current_idx += 2
      else
        total += (@frames[current_idx] + @frames[current_idx + 1])
        current_idx += 2
      end
      frames += 1
      break if frames == MAX_FRAMES
    end
    total
  end

  def is_strike(idx)
    @frames[idx] == 10
  end

  def is_spare(idx)
    @frames[idx] + @frames[idx + 1] == 10
  end

end