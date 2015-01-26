class Frames

  def initialize(str = '')
    self.frames = str
  end

  # obtain the current game's bowling frames
  #
  def frames
    @frames
  end

  # assign the string that represents the current game's bowling frames
  #
  def frames=(str)
    @frames = str.chomp.scan(/X|\d-|\d\/|\d/)
  end

  # calculate the final score of a valid sequence of bowling frames
  #
  def final_score
    total = 0
    (0..9).each do |i|
      total += frame_score(i)
    end
    total
  end

  private

  # calculate the score of the idx-th frame
  #
  def frame_score(idx)
    if (@frames[idx] == 'X') # strike
      10 + knocked_down(idx + 1) + knocked_down(idx + 2)
    elsif (@frames[idx].match(/\d\//)) # spare
      10 + knocked_down(idx + 1)
    else
      @frames[idx][0].to_i # total
    end
  end

  # count the number of pins knocked down in the idx-th frame
  #
  def knocked_down(idx)
    if (@frames[idx] == 'X')
      10
    else
      @frames[idx][0].to_i
    end
  end

end