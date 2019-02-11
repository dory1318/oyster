class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  LIMIT = 90
  MIN_BALANCE = 1
  FARE = 1


def initialize
  @balance = 0
  @in_journey = false
  @entry_station = nil
end

def top_up(value)
  fail 'Balance is over the limit' unless @balance + value <= LIMIT
  @balance += value
end

def in_journey?
  @in_journey
end

def touch_in(station)
  fail 'You do not have enough funds on the card' if @balance <= MIN_BALANCE
  @in_journey = true
  @entry_station = station
end

def touch_out
  deduct(FARE)
  @in_journey
end

private

def deduct(amount)
  @balance -= amount
end

end
