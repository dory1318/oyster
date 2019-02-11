class Oystercard
  attr_reader :balance
  LIMIT = 90

def initialize
  @balance = 0
end

def top_up(value)
  fail 'Balance is over the limit' unless @balance + value <= LIMIT
  @balance += value
end

def deduct(fare)
  @balance -= fare
end
# def too_much?
#   @balance + top_up(value) >= LIMIT
# end

end
