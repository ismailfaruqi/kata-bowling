require_relative '../frames'
require 'pry'

describe Frames do
  before do
    @a = Frames.new
  end

  it "calculates lowest score" do
    @a.frames = '0-0-0-0-0-0-0-0-0-0-'
    expect(@a.final_score).to eq(0)
  end

  it "calculates highest score" do
    @a.frames = 'XXXXXXXXXXXX'
    expect(@a.final_score).to eq(300)
  end

  it "calculates spare" do
    @a.frames = '5/5/5/5/5/5/5/5/5/5/5'
    expect(@a.final_score).to eq(150)
  end
end
