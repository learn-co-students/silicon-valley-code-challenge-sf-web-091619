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
        @@all.map do |value|
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


class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @all
    end

    def self.tres_commas_club
        @@all.select do |start_up|
        start_up.total_worth >= 1000000000    
        end 
    end

    # Advanced Methods

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.each do |value|
            value.venture_capitalist == self
        end
    end

    def portfolio
        starts = []
        self.funding_rounds.each do |value|
            starts << value.startup
        end
        starts.uniq
    end

    def biggest_investment
        biggest = funding_rounds[0]
        funding_rounds.each do |value|
            if value.investment > biggest.investment
                biggest = value
            end
        end
        biggest
    end

    # def invested(domain)
    #     startups = []
    #     Startup.all.each do |value|
    #         if value.domain == domain
    #             startups << value
    #         end
    #      total = FundingRound.all.map do |val|
    #         if val.startup == startups


    #     end
    # end

    def invested(domain)
        count = 0
        funding_rounds.map do |value|
            if value.startup.domain == domain
                count += value.investment
            end
        end
        count
    end



end


class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end


end
