require_relative '../lib/frames'
require 'pry'

describe Frames do
  before do
    @a = Frames.new
  end

  it "calculates the lowest score" do
    @a.from_string '0-0-0-0-0-0-0-0-0-0-'
    expect(@a.final_score).to eq(0)
  end

  it "calculates 9-9-9-9-9-9-9-9-9-9-" do
    @a.from_string '9-9-9-9-9-9-9-9-9-9-'
    expect(@a.final_score).to eq(90)
  end

  it "calculates the highest score" do
    @a.from_string 'XXXXXXXXXXXX'
    expect(@a.final_score).to eq(300)
  end

  it "calculates spares" do
    @a.from_string '5/5/5/5/5/5/5/5/5/5/5'
    expect(@a.final_score).to eq(150)
  end

  it "calculates scores with mix between strikes and spares" do
    @a.from_string '0/5-XX0-5/X4-0/X05'
    # score[0] = 10 + 5 = 15
    # score[1] = 5 (20)
    # score[2] = 10 + 10 + 0 = 20 (40)
    # score[3] = 10 + 0 + 0 = 10 (50)
    # score[4] = 0 (50)
    # score[5] = 10 + 10 = 20 (70)
    # score[6] = 10 + 4 + 0 = 15 (84)
    # score[7] = 4 + 0 = 5 (89)
    # score[8] = 10 + 10 = 20 (110)
    # score[9] = 10 + 0 + 5 (123)
    expect(@a.final_score).to eq(123)
  end

  it "raises exception when input is invalid" do
    @a.from_string 'invalid input'
    expect{ @a.final_score }.to raise_error(Exception)
  end

end
