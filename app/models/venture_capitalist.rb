class VentureCapitalist
    
    attr_accessor :name, :totalq

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
        @@all.select do |vc|
            vc.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, inv)
        FundingRound.new(startup, self, type, inv)
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |fr|
            fr.startup
        end.uniq
    end

    def biggest_investment
        funding_rounds.max_by do |fr|
            fr.investment
        end
    end

    def invested(domain)
        rounds = funding_rounds.select do |fr|
            fr.startup.domain == domain
        end
        rounds.sum do |fr|
            fr.investment
        end
    end

end

