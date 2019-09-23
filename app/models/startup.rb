class Startup
  attr_reader :founder, :name, :domain
  # attr_accessor 

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    self.class.all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder_name)
    self.all.find { |startup| startup.founder == founder_name }
  end

  def self.domains
    self.all.map { |startup| startup.domain }
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |round| round.startup == self }
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    funds = funding_rounds.map { |round| round.investment }
    funds.sum
  end

  def investors
    investors = funding_rounds.map { |round| round.venture_capitalist }
    investors.uniq
  end

  def big_investors
    billionaires = VentureCapitalist.tres_commas_club
    investors = funding_rounds.select do |round|
      billionaires.include?(round.venture_capitalist)
    end
    investors.uniq
  end

end
