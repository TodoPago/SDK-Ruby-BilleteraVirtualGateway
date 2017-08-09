#encoding: utf-8
require_relative "../lib/bvg_conector.rb"
require_relative "../lib/Classes/user.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"

require "test/unit"


class DiscoverPaymentMethodsBVGTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testdiscoverPaymentMethodsOk
		@dataProvider = DataProvider.new()		
		@clientMock = MockClient.new({}, "test")
		sdk = BvgConnector.new({}, "test")

		sdk.setRestConnector(@clientMock)
		response = sdk.discoverPaymentMethodsBVG()
		
		assert_equal(JSON.parse(@dataProvider.discoverPaymentMethodsResponseOK), response)

	end

	
	def testdiscoverPaymentMethodsFail
		@dataProvider = DataProvider.new()		
		@clientMock = MockClient.new({}, "test")
		@clientMock.payments_ok = false
		sdk = BvgConnector.new({}, "test")
		
		sdk.setRestConnector(@clientMock)
		response = sdk.discoverPaymentMethodsBVG()
		
		assert_not_equal(JSON.parse(@dataProvider.discoverPaymentMethodsResponseOK), response)
	end
end



