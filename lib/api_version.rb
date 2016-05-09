class ApiVersion
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?('application/vnd.earnings_api.v#{@version}')
  end
end
