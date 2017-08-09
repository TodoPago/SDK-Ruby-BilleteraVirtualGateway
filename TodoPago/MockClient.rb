#encoding: utf-8
require 'rest-client'
require 'json'
require_relative "../lib/Connectors/ServiceConnector.rb"
require 'xmlsimple'

require_relative "DataProvider.rb"

class MockClient < ServiceConnector
	attr_accessor :merchant_authorized, :existing_transaction, :existing_request_key, :apiKey, :payments_ok, :dataProvider, :lastRequest

	def initialize(j_header_http, *args)
		@merchant_authorized  = 41702
		@apiKey = 'TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE'
		@user = 'mail@todopago.com'
		@password = 'Password1'
		@payments_ok = true
		@existing_transaction = '185'
		@existing_request_key = '710268a7-7688-c8bf-68c9-430107e6b9da'
		@dataProvider = DataProvider.new()
	end

	def getLastRequest()
		return @lastRequest
	end



	def discoverPaymentMethodsBvg(discoverEndpointBVG)
		@lastRequest = 'https://developers.todopago.com.ar/api/PaymentMethods/Discover' 

		if (@payments_ok)
	    	response = @dataProvider.discoverPaymentMethodsResponseOK()
		else
			response = @dataProvider.discoverPaymentMethodsResponseFail()
		end

	    return response
	end 

	### getTransactions(TRANSACTION_ENDPOINT, dataRequest.to_json)
	def getTransactions(transactionEndpoint, data)
		response = ""
		dataRequest = JSON.parse(data)
		merchant = dataRequest["generalData"]["merchant"] 
		
		if ( @merchant_authorized == merchant )
			if dataRequest["operationData"]["amount"].empty?
				return @dataProvider.transactionsResponseFail() 
			end	
		else
    		return @dataProvider.transactionsResponseUserFail()
    	end

    	return @dataProvider.transactionsResponseOk()
	end

	

	def pushNotification(pushNotificationEndpoint, data)
		response = ""
		dataRequest = JSON.parse(data)
		merchant = dataRequest["generalData"]["merchant"] 
		
		if ( @merchant_authorized == merchant )
			if dataRequest["operationData"]["amount"].empty?
				return @dataProvider.pushNotificationResponseFail() 
			end
		else
			return @dataProvider.pushNotificationResponseUserFail()	
		end


		return  @dataProvider.pushNotificationResponseOk()
	end



	def getCredentials(user)

		@lastRequest = "https://developers.todopago.com.ar/api/Credentials"

	    # aca mando el JSON RestClient.post url, user.getData.to_json, :content_type => :json
	    if ( user.user !=  @user )
	    	response = @dataProvider.GetCredentialsResponseFailUser()
	    	response = JSON.parse(response)

	    	return response
	    end	

	    if ( user.password != @password )
	    	response = @dataProvider.GetCredentialsResponseFailPassword()
	    	response = JSON.parse(response)

	    	return response
	    end

	    response = @dataProvider.GetCredentialsResponseOK()
	    response = JSON.parse(response)

	    user.merchant = response['Credentials']['merchantId']
	    user.apiKey = response['Credentials']['APIKey']

	    return user
	end

	
end