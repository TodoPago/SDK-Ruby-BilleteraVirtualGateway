#encoding: utf-8
require_relative "../lib/bvg_conector.rb"
require_relative "../lib/Classes/pushNotification.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"

require "test/unit"


class PushNotificationTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider
	
	def testPushNotificationOk
	    
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = BvgConnector.new(@dataProvider.getHeader(), "test")
		
		sdk.setRestConnector(@clientMock)
		
		params = @dataProvider.pushNotificationRequest('ok')
		
		pushNotification = PushNotification.new(params[:generalData], params[:operationData], params[:tokenizationData])
		pushNotification = sdk.pushNotification(pushNotification)

		assert_equal("-1", pushNotification.response["statusCode"])			
	end

	def testPushNotificationFail
	    
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = BvgConnector.new(@dataProvider.getHeader(), "test")
		
		sdk.setRestConnector(@clientMock)
		
		params = @dataProvider.pushNotificationRequest('fail')
		
		pushNotification = PushNotification.new(params[:generalData], params[:operationData], params[:tokenizationData])
		pushNotification = sdk.pushNotification(pushNotification)

		assert_not_equal("-1", pushNotification.response["statusCode"])			
	end

	def testPushNotificationFailUser

		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = BvgConnector.new(@dataProvider.getHeader(), "test")
		
		sdk.setRestConnector(@clientMock)
		
		params = @dataProvider.pushNotificationRequest('fail_user')
		
		pushNotification = PushNotification.new(params[:generalData], params[:operationData], params[:tokenizationData])
		pushNotification = sdk.pushNotification(pushNotification)

		assert_equal("702", pushNotification.response["errorCode"])
	end
end