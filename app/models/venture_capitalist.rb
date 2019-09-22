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
        funding_rounds.select do |value|
            value.max
        end
    end

    def invested(domain)
        dm = Startup.all.each do |value|
            value.domain
        end
         total = FundingRound.all.each do |val|
            val.investment == dm
        end
    end



end
