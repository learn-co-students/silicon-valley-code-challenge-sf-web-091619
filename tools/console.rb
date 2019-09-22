require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

ts = Startup.new("Flatiron", "Norris", "tech")
gg = Startup.new("dgdgh", "Norrfdfis", "rsgsxg")
tv = VentureCapitalist.new("Norris", 20000000000)
tf = FundingRound.new(ts, tv, "Round One", 123134215)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line