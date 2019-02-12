require_relative 'station'

class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journey
  LIMIT = 90
  MIN_BALANCE = 1
  FARE = 1


def initialize
  @balance = 0
  @entry_station = nil
  @journey = {}
end

def top_up(value)
  fail 'Balance is over the limit' unless @balance + value <= LIMIT
  @balance += value
end

def in_journey?
  !!entry_station
end

def touch_in(station)
  fail 'You do not have enough funds on the card' if @balance <= MIN_BALANCE
  @entry_station = station
  @journey.merge!(entry: station)
end

def touch_out(exit_station)
  deduct(FARE)
  @journey.merge!(exit: exit_station)
  @entry_station = nil
end

private

def deduct(amount)
  @balance -= amount
end

end
