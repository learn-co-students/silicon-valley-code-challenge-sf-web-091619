require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

newsy = Startup.new("newsy", "kat", ".com")
glossier = Startup.new("glossier", "emily", ".com")
makeUp = Startup.new("makeUp", "emily", ".com")
fasterly = Startup.new("fasterly", "holly", ".edu")

alexis = VentureCapitalist.new("alexis", 1500000000)
regina = VentureCapitalist.new("regina", 3250000000)
james = VentureCapitalist.new("james", 100000000)
phil = VentureCapitalist.new("phil", 120000005000)

glossier.sign_contract(alexis, "Series C", 100000000)
glossier.sign_contract(phil, "Series A", 15000000)
glossier.sign_contract(james, "Seed", 2500000)
glossier.sign_contract(james, "Series B", 1500000)

regina.offer_contract(glossier, "Series A", 3450000)
regina.offer_contract(fasterly, "Seed", 10000)
alexis.offer_contract(glossier, "Angel", 100000)
alexis.offer_contract(glossier, "Series C", 200000000)
regina.offer_contract(glossier, "Series B", 1500000)
regina.offer_contract(makeUp, "Angel", 200000)

# p FundingRound.all.select { |round| round.startup == glossier }

puts "self.find_by_founder('emily') = glossier"
puts Startup.find_by_founder('emily')

puts "self.domains = ['.com', 'com'...]"
p Startup.domains

puts "self.tres_commas_club = [alexis, regina, phil]"
puts VentureCapitalist.tres_commas_club

puts "all of the funding rounds"
p FundingRound.all

puts 
puts 'glossier funding rounds = 3'
p glossier.num_funding_rounds
puts

puts 'total funds '
p glossier.total_funds
puts

puts 'unique investors'
puts glossier.investors
puts

puts 'unique big investors'
puts glossier.big_investors
puts

puts 'new funding_round instance'
p alexis.offer_contract(glossier, "Angel", 100000)
puts

puts 'list of funding_rounds'
p regina.funding_rounds
puts

puts 'uniq list of startups invested'
p regina.portfolio

puts 
puts 'largest funding round given'
p regina.biggest_investment
puts
puts "domain investment"
p regina.invested(".edu")

# binding.pry
0#leave this here to ensure binding.pry isn't the last li