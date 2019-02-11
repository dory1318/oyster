require 'oystercard'

describe Oystercard do
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

it 'deducted money from oyster' do
  subject.top_up(20)
  subject.deduct(5)
  expect(subject.balance).to eq 15
end

end
