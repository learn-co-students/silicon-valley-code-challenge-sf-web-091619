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
        @@all.select do |founder_name|
            founder_name.name == founder
        end
    end

    def self.domains
        Startup.all.select do |name|
            founder.name == self
        end
    end

end
