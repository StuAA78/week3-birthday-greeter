class Birthday

  attr_reader :date

  def initialize(string)
    @date = Date.parse(string)
  end

  def day
      @date.mday
  end

  def month
    @date.month
  end

  def year
    @date.year
  end

  def difference(supplied_date)
    (supplied_date - @date).to_i
  end

  def this_year_difference(supplied_date)
    (supplied_date - date_this_year).to_i
  end

  def date_this_year
    Date.new(Date.today.year, @date.month, @date.day)
  end

  def day_days
    this_year_difference(Date.today).abs == 1 ? "day" : "days"
  end

end
