require 'test_helper'

class API::V1::EarningsControllerTest < ActionController::TestCase
  def setup
    @request.headers['Accept'] = 'application/vnd.earnings_api.v1'
    Earning.create!(company_symbol: 'TEST', earnings_released_on: '2016-05-09 11:51:26', earnings: '0.7', expectation: '0.5', earnings_last_q: '0.25', revenue: '25%')
  end

  test 'GET #index' do
    get :index, format: :json
    assert_equal Mime::JSON, response.content_type
    assert_equal 200, response.status
    earnings = JSON.parse(response.body, symbolize_names: true)
    company_symbols = earnings.collect { |s| s[:company_symbol] }
    assert_includes company_symbols, 'TEST'
    values = earnings.find { |e| e[:company_symbol] == 'TEST' }
    assert_equal 6, values.size
    assert_equal "05/09/2016", values[:earnings_released_on]
    assert_equal '0.7', values[:earnings]
    assert_equal '0.5', values[:expectation]
    assert_equal '0.25', values[:earnings_last_q]
    assert_equal '25%', values[:revenue]
  end
end
