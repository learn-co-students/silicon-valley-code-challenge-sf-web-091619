class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []
    def initialize
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
    def offer_contract(startup, invest_type, amount)
        if amount >= 0
            FundingRound.new(startup, self, invest_type, amount.to_f)
        else
            puts "This start up needs more bread"
        end
    end
    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end
    def portfolio
        rounds = FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
        dup_start = rounds.map do |round|
            round.startup
        end
        dup_start.uniq
    end
    def biggest_investment
        biggest = @funding_rounds[0]
        @funding_rounds.each do |round|
            if round.investment > biggest.investment
                biggest = round
            end
        end
        biggest
    end
    def invested(domain)
        total = 0
        @funding_rounds.each do |round|
            if round.startup.domain == domain
                total += round.investment
            end
        end
        total
    end
end
