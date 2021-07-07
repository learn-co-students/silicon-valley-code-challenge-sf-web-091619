class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
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

    def self.find_by_founder(founder_name)
        @@all.select do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        @@all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(ven_cap, type, inv,)
        FundingRound.new(self, ven_cap, type, inv)
    end

    def num_funding_rounds
        rounds.count
    end

    def total_funds
        rounds.sum do |fr|
            fr.investment
    end

    def investors
        rounds.map do |fr|
            fr.venture_capitalist
        end.uniq
    end

    def big_investors
        investors.select do |inv|
            VentureCapitalist.tres_commas_club.include?(inv)
        end.uniq
    end

    #Helper Method

    def rounds
        FundingRound.all.select do |fr|
            fr.startup == self
        end
    end




end