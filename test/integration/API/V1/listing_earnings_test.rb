require 'test_helper'

class ListingEarningsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'return list of earnings' do
    get '/earnings'
    assert_equal 200, response.status
  end

  test 'list filtered by earnings_beat data' do
    Earning.create!(company_symbol: 'ITEST', earnings_released_on: '2016-05-09 11:51:26', earnings: '0.50', earnings_last_q: '0.25')
    get '/earnings?earnings_beat=25', format: :json
    assert_equal Mime::JSON, response.content_type
    assert_equal 200, response.status
    earnings = JSON.parse(response.body, symbolize_names: true)
    assert_equal earnings.size, 1
    json_response = [{:company_symbol=>"ITEST", :earnings_released_on=>"05/09/2016", :earnings=>"0.50", :expectation=>nil, :earnings_last_q=>"0.25", :revenue=>nil}]
    assert_equal earnings, json_response
    company_symbols = earnings.collect { |s| s[:company_symbol] }
    assert_includes company_symbols, 'ITEST'
    values = earnings.find { |e| e[:company_symbol] == 'ITEST' }
    assert_equal 6, values.size
    assert_equal '05/09/2016', values[:earnings_released_on]
    assert_equal '0.50', values[:earnings]
    assert_equal '0.25', values[:earnings_last_q]
  end

  test 'list filtered by expectation_beat' do
    Earning.create!(company_symbol: 'ATEST', earnings_released_on: '2016-05-09 11:51:26', earnings: '0.50', expectation: '0.45')
    get '/earnings?expectation_beat=10', format: :json
    assert_equal Mime::JSON, response.content_type
    assert_equal 200, response.status
    earnings = JSON.parse(response.body, symbolize_names: true)
    atest = earnings.select { |e| e[:company_symbol] == 'ATEST'}
    json_response = [{:company_symbol=>'ATEST', :earnings_released_on=>"05/09/2016", :earnings=>"0.50", expectation: '0.45', :earnings_last_q=>nil, :revenue=>nil}]
    assert_equal atest, json_response
  end
end
