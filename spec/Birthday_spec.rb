require 'Birthday.rb'

describe Birthday do

  it "can report the day number" do
    birthday = Birthday.new("1978/09/29")
    expect(birthday.day).to eq 29
  end

  it "can report the month number" do
    birthday = Birthday.new("1978/09/29")
    expect(birthday.month).to eq 9
  end

  it "can report the year number" do
    birthday = Birthday.new("1978/09/29")
    expect(birthday.year).to eq 1978
  end

  it "can calculate the difference between the birthday and a date" do
    birthday = Birthday.new("1978/09/29")
    expect(birthday.difference(Date.parse("1978/09/30"))).to eq 1
  end

  it "can turn a supplied date into the corresponding date this year" do
    birthday = Birthday.new("1978/09/29")
    current_date = Date.new(2018, 9, 29)
    expect(birthday.date_this_year).to eq current_date
  end

end
