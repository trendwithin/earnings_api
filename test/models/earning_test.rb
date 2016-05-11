require 'test_helper'

class EarningTest < ActiveSupport::TestCase

  test '#earnings_beat returns valid filtered record' do
    Earning.create!(company_symbol: 'EX', earnings_released_on: '2016-05-09 11:51:26',earnings: '0.5', earnings_last_q: '0.25')
    beat = Earning.earnings_beat '50'
    assert beat.to_s.include?('EX')
  end

  test '#earnings_beat will not return invalid filtered record' do
    Earning.create!(company_symbol: 'EX', earnings_released_on: '2016-05-09 11:51:26',earnings: '0.5', earnings_last_q: '0.25')
    beat = Earning.earnings_beat '200'
    refute beat.to_s.include?('EX')
  end

  test '#expectation_beat returns valid filtered record' do
    Earning.create!(company_symbol: 'EX', earnings_released_on: '2016-05-09 11:51:26',earnings: '0.5', expectation: '0.25')
    beat = Earning.expectation_beat '50'
    assert beat.to_s.include?('EX')
  end

  test '#expectation_beat will not return invalid filtered record' do
    Earning.create!(company_symbol: 'EX', earnings_released_on: '2016-05-09 11:51:26',earnings: '0.5', expectation: '0.25')
    beat = Earning.expectation_beat '200'
    refute beat.to_s.include?('EX')
  end

  test '#earning_expectation_beat returns valid filted record' do
    Earning.create!(company_symbol: 'EX', earnings_released_on: '2016-05-09 11:51:26',earnings: '0.5', expectation: '0.25', earnings_last_q: '0.10')
    beat = Earning.earning_expectation_beat '400', '100'
    assert beat.to_s.include?('EX')
  end

  test '#earning_expectation_beat will not return invalid filted record' do
    Earning.create!(company_symbol: 'EX', earnings_released_on: '2016-05-09 11:51:26',earnings: '0.5', expectation: '0.25', earnings_last_q: '0.10')
    beat = Earning.earning_expectation_beat '500', '200'
    refute beat.to_s.include?('EX')
  end
end
