require 'test_helper'

class ApiVersionTest < ActionDispatch::IntegrationTest
  def setup
    @ip = '123.123.12.12'
    @api_version_v1 = ApiVersion.new(version: 1, default: true)
    @header_stub = Struct.new(:headers)
  end

  test 'returns version one via "Accept" headers w/ default: true' do
    req = @header_stub.new({ 'REMOTE_ADDR' => @ip, 'Accept' => 'application/vnd.earnings_api.v1' })
    assert_equal true, @api_version_v1.matches?(req)
  end
end
