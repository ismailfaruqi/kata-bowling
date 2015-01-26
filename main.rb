base_dir = File.expand_path(File.join(File.dirname(__FILE__)))
Dir[File.join(base_dir, "lib/**/*.rb")].each { |f| require f }

continue = 'n'

loop do
  puts "Insert a valid bowling frame sequence..."
  begin
    final_score = Frames.new(gets).final_score
    puts "The final score is #{final_score}"
  rescue => e
    puts "Whoops! It seems that you've entered an invalid frame sequence!"
  end
  answer = nil
  loop do
    print "Do you want to continue? (y/n) "
    answer = gets.chomp
    break if (['y', 'n'].include?(answer.to_s))
  end
  continue = answer
  break if continue == 'n'
end
puts "Thank you!"