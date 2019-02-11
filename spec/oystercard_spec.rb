require 'oystercard'

describe Oystercard do
  let(:station){ double :station }
it 'has initial balance zero' do
  expect(subject.balance).to eq 0
end

it 'top up oystercard' do
  subject.top_up(20)
  expect(subject.balance).to eq 20
end

it 'balance cannot be more than £90' do
  expect{subject.top_up(91)}.to raise_error 'Balance is over the limit'
end

it 'balance cannot be less than £1' do
  expect{subject.touch_in(station)}.to raise_error 'You do not have enough funds on the card'
end

it 'we are not in journey without touch in' do
expect(subject.in_journey?).to eq(false)
end

it 'is in journey'do
  subject.top_up(2)
  subject.touch_in(station)
  expect(subject.in_journey?).to eq(true)
end

it 'is not in journey anymore' do
  subject.touch_out
  expect(subject.in_journey?).to eq(false)
  end

  it 'oyster is deducted by the correct fare' do
    subject.top_up(10)
   expect{subject.touch_out}.to change{subject.balance}.by(-1)
  end

  it 'what is the entry station' do
    subject.top_up(20)
    subject.touch_in(station)
    expect(subject.entry_station).to eq(station)
  end
end
