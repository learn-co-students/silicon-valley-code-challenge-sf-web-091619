class FundingRound

    attr_reader :startup, :venture_capatilist
    attr_accessor :type, :number

    @@all = []

    def initialize(startup, venture_capitalist)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @number = number
        @@all << self
    end

    def self.all
        @@all
    end


end
