class Earning < ActiveRecord::Base

  def Earning.earnings_beat beat
    beat = beat.to_f
    hits = self.select { |e| e[:earnings].to_f > 0 && e[:earnings_last_q].to_f > 0 }
    hits = hits.select { |e| ( (e[:earnings].to_f - e[:earnings_last_q].to_f)/e[:earnings_last_q].to_f) * 100 >= beat }
  end
end
