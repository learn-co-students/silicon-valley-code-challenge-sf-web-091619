class VentureCapitalist
  attr_reader :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select { |capitalist| capitalist.total_worth > 1000000000 }
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end
 
  def funding_rounds
    FundingRound.all.select { |round| round.venture_capitalist == self }
  end

  def startups
    startups = funding_rounds.map { |round| round.startup }
  end

  def portfolio
    startups.uniq
  end

  def biggest_investment
    funding_rounds.max_by { |round| round.investment }
  end
  
  def invested(string)
    #iterate over funding_rounds of venture_capitalist. 
    #as each "round" has only 1 startup, can chain into it to get the domain
    funding_rounds.select { |round| round.startup.domain == string }
  end

  # def to_s
  #   "#{name} #{total_worth}"
  # end

end
