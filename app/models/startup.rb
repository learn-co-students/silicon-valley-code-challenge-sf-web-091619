class Startup
    attr_accessor :name, :pivot
    attr_reader :founder, :domain
    @@all =[]
    def initialize(founder, domain)
        @founder = founder
        @domain = domain
        @@all << self
    end
    def pivot(domain, name)
        @domain = domain
        @name = name
    end
    def self.all
        @@all
    end
    def self.find_by_founder(string)
        @@all.each do |startup|
            if startup.founder == string
                return startup
            end
        end
    end
    def self.domains
        @@all.map do |startup|
            startup.domain
        end
    end
    def sign_contract(vc, invest_type, amount)
        if amount >= 0
            FundingRound.new(self, vc, invest_type, amount.to_f)
        else
            puts "This start up needs more bread"
        end
    end
    def num_funding_rounds
        rounds = FundingRound.all.select do |round|
            round.startup == self
        end
        rounds.count
    end
    def total_funds
        rounds = FundingRound.all.select do |round|
            round.startup == self
        end
        total = 0
        rounds.each do |round|
            total += round.investment
        end
        total
    end
    def investors
        rounds = FundingRound.all.select do |round|
            round.startup == self
        end
        dup_invest = rounds.map do |round|
            round.venture_capitalist
        end
        dup_invest.uniq
    end
    def big_investors
        biggest = []
        self.investors.each do |investor|
            if VentureCapitalist.tres_commas_club.include?(investor)
                biggest << investor
            end
        end
        biggest
    end
    
end
