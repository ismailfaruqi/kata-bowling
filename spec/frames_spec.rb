require_relative '../lib/frames'
require 'pry'

describe Frames do
  before do
    @a = Frames.new
  end

  it "calculates the lowest score" do
    @a.frames = '0-0-0-0-0-0-0-0-0-0-'
    expect(@a.final_score).to eq(0)
  end

  it "calculates the highest score" do
    @a.frames = 'XXXXXXXXXXXX'
    expect(@a.final_score).to eq(300)
  end

  it "calculates spares" do
    @a.frames = '5/5/5/5/5/5/5/5/5/5/5'
    expect(@a.final_score).to eq(150)
  end

  it "raises exception when input is invalid" do
    @a.frames = 'invalid input'
    expect{ @a.final_score }.to raise_error(Exception)
  end

end
