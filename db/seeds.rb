# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Earning.create!(company_symbol: 'AES', earnings_released_on: Time.now, earnings: '0.13', expectation: '0.20', earnings_last_q: '0.25', revenue: '-12.9%')
Earning.create!(company_symbol: 'RESI', earnings_released_on: Time.now, earnings: '0.30', expectation: '0.24', earnings_last_q: '0.22', revenue: '-54.9%')
Earning.create!(company_symbol: 'EBIX', earnings_released_on: Time.now, earnings: '0.67', expectation: '0.58', earnings_last_q: '0.51', revenue: '11.4%')
Earning.create!(company_symbol: 'LPX', earnings_released_on: 1.day.ago, earnings: '0.07', expectation: '0.01', earnings_last_q: '-0.13', revenue: '7.1%')
