class EarningSerializer < ActiveModel::Serializer
  attributes :company_symbol, :earnings_released_on, :earnings, :expectation, :earnings_last_q, :revenue

  def attributes
    data = super
    data[:earnings_released_on] = data[:earnings_released_on].strftime("%m/%d/%Y")
    data
  end
end
