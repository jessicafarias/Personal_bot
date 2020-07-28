class Jokes
    @joke = {0 => "The cool part about naming your kid is you don’t have to add six numbers to make sure the name is available",
        1 => "I ate a clock yesterday, it was very time-consuming.",
        2 => "Did you hear about the crook who stole a calendar? He got twelve months.", 
        3 => "Did you hear about the semi-colon that broke the law? He was given two consecutive sentences.",
        4 => "I can still remember a time when I the humanity knew more than a bot."}

    def initialize(id)
        @id = id
    end

    def self.request_joke
        @joke[rand(5)]
    end

    def self.create_joke(new_msj)
        @new={@joke.length+1=> "+"+new_msj.to_s+"+"}
        @joke.merge(@new)
    end
end