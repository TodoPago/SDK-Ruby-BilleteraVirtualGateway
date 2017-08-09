#encoding: utf-8
require 'rest-client'
require 'json'

require_relative "ServiceConnector"

class RestConnector < ServiceConnector

	def initialize(j_header_http, args)
		super(j_header_http, args)

		# atributos
		@bvgEndPoint = @endPoint + $bvgTenant
		@credentialsEndPoint = @endPoint + $restAppend
	end

	def getCredentials(user)
	    url = @credentialsEndPoint + "Credentials"

	    if not self.validateEmail(user.getData[:USUARIO])
	    	raise ResponseException.new, 'mail ingresado invalido'
	    end

	    response = RestClient::Request.execute(:url => url, :method => :post, :payload => user.getData.to_json,  :headers => { :content_type => :json, :accept => :json }, :verify_ssl => false)
	    response = JSON.parse(response)

	    if response['Credentials']['resultado']['codigoResultado'] != 0
	    	raise ResponseException.new, response
	    end

	    user.merchant = response['Credentials']['merchantId']
	    user.apiKey = response['Credentials']['APIKey']

	    return user
  	end

	def discoverPaymentMethodsBvg(discoverEndpointBVG)
		response = ""
		response = RestClient::Resource.new(@bvgEndPoint + discoverEndpointBVG, :verify_ssl => false).get()
    	return response
	end

	def getTransactions(transactionEndpoint, data)
		response = ""
        response = RestClient::Request.execute(:url => @bvgEndPoint + transactionEndpoint, :method => :post, :payload => data,   :headers => { :Authorization => @j_header_http['Authorization'], :content_type => :json, :accept => :json }, :verify_ssl => false)
    	return response
	end

	def pushNotification(pushNotificationEndpoint, data)
		response = 0
		publicRequestKey = JSON.parse(data)["generalData"]["publicRequestKey"].to_s
		url = @bvgEndPoint + pushNotificationEndpoint + '/' + publicRequestKey 
		response = RestClient::Request.execute(:url => url, :method => :put, :payload => data,   :headers => { :Authorization => @j_header_http['Authorization'], :content_type => :json,    :accept => :json  }, :verify_ssl => false)
    	
    	return response
	end

	def validateEmail(string)
		
		if string=~ /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/		
			result = true
		else
			result = false
		end

		return result
	end
end

