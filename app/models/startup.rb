class Startup

    attr_accessor :name, :pivot
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.select do |value|
            value.founder == founder
        end
    end

    def self.domains
        @@all.each do |value|
            value.domain
        end
    end

    # Advanced Methods

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        number = FundingRound.all.select do |value|
            value.startup == self
        end
        number.count
    end

    def total_funds
        count = 0
        number = FundingRound.all.each do |value|
            value.startup == self
        end
        inv = number.each do |value|
            count += value.investment
        end
        count
    end

    def investors
        ven = []
        number = FundingRound.all.each do |value| # Iterate through all funding rounds
            value.startup == self # Find funding rounds corresponding to the startup
        end
        number.select do |value| # Iterate through corresponding funding rounds
            ven << value.venture_capitalist# Return array of unique venture capitalists
        end
        ven.uniq
    end

    def big_investors
        big = []
        three = VentureCapitalist.tres_commas_club
        self.investors.each do |value|
            three.each do |val2|
                if value == val2
                    big << value
                end
            end
        end
        big
    end
    

end
