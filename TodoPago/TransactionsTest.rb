#encoding: utf-8
require_relative "../lib/bvg_conector.rb"
require_relative "../lib/Classes/transaction.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"
require "test/unit"
 

class TransactionsTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testTransactionsOk
	    
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = BvgConnector.new(@dataProvider.getHeader(), "test")
		
		sdk.setRestConnector(@clientMock)
		
		params = @dataProvider.transactionsRequest('ok')
		
		transaction = Transaction.new(params[:generalData], params[:operationData], params[:technicalData])
		transaction = sdk.transactions(transaction)
	    
		assert_equal("d8c8c9a9-f649-467d-a6e2-022eac851232", transaction.response["publicRequestKey"])
		assert_equal("41702", transaction.response["merchantId"])
		
	end	

	def testTransactionsFail

		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = BvgConnector.new(@dataProvider.getHeader(), "test")

		sdk.setRestConnector(@clientMock)

		params = @dataProvider.transactionsRequest('fail')

		transaction = Transaction.new(params[:generalData], params[:operationData], params[:technicalData])
		transaction = sdk.transactions(transaction)

		assert_not_equal("d8c8c9a9-f649-467d-a6e2-022eac851232", transaction.response["publicRequestKey"])
		assert_equal("1014", transaction.response["errorCode"])
	end

	def testTransactionsFailUser

		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = BvgConnector.new(@dataProvider.getHeader(), "test")

		sdk.setRestConnector(@clientMock)

		params = @dataProvider.transactionsRequest('fail_user')

		transaction = Transaction.new(params[:generalData], params[:operationData], params[:technicalData])
		transaction = sdk.transactions(transaction)

		assert_not_equal("d8c8c9a9-f649-467d-a6e2-022eac851232", transaction.response["publicRequestKey"])
		assert_equal("702", transaction.response["errorCode"])
	end

end
