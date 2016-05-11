class Earning < ActiveRecord::Base

  def Earning.earnings_beat beat
    beat = beat.to_f
    hits = self.select { |e| e[:earnings].to_f > 0 && e[:earnings_last_q].to_f > 0 }
    hits = hits.select { |e| ( (e[:earnings].to_f - e[:earnings_last_q].to_f)/e[:earnings_last_q].to_f) * 100 >= beat }
  end

  def Earning.expectation_beat beat
    beat = beat.to_f
    hits = self.select { |e| e[:earnings].to_f > 0 && e[:expectation].to_f > 0 }
    hits = hits.select { |e| ( (e[:earnings].to_f - e[:expectation].to_f)/e[:expectation].to_f) * 100 >= beat }
  end

  def Earning.earning_expectation_beat earn, expect
    earn_beat = earn.to_f
    expect_beat = expect.to_f
    hits = self.select { |e| e[:earnings].to_f > 0 && e[:expectation].to_f > 0 }
    hits = hits.select { |e| ( (e[:earnings].to_f - e[:earnings_last_q].to_f)/e[:earnings_last_q].to_f) * 100 >= earn_beat }
    hits = hits.select { |e| ( (e[:earnings].to_f - e[:expectation].to_f)/e[:expectation].to_f) * 100 >= expect_beat }
  end
end
