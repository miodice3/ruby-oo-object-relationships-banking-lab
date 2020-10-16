class BankAccount

    @@all = []

    attr_accessor :balance, :status, :deposit
    attr_reader :name

    def initialize(name)
        @balance = 1000
        @name = name
        @status = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(amount)
        @balance = @balance + amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @status == "open" && @balance > 0
    end

    def close_account
         @status = "closed"
    end

end