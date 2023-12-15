class SpaceAge
    EARTH_YEAR_SECONDS = 31557600
    EARTH_YEAR = 1
    MERCURY_YEAR = 0.2408467
    VENUS_YEAR = 0.61519726
    MARS_YEAR = 1.8808158
    JUPITER_YEAR = 11.862616
    SATURN_YEAR = 29.447498
    URANUS_YEAR = 84.016846
    NEPTUNE_YEAR = 164.79132

    def initialize(seconds)
        @seconds = seconds.to_f
    end

    def method_missing(method, *args, &block)
        return super(method, *args, &block) unless method.to_s =~ /^on_\w+/
        planet_year_factor = SpaceAge.const_get(method.to_s.split("_")[-1].upcase+"_YEAR")
        @seconds / length_of_year(planet_year_factor)
    end

    private

    def length_of_year(planet_year)
        EARTH_YEAR_SECONDS * planet_year
    end

end