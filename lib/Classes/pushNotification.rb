#encoding: utf-8
class PushNotification

	attr_accessor :generalData, :operationData, :tokenizationData, :response, :attr_required
	
	def initialize(generalData=nil, operationData=nil, tokenizationData=nil)	
		@attr_required = {
							:merchant => 'fixnum', 
							:security => 'string', 
							:publicRequestKey => 'string',
							:operationName => 'string',
							:operationDatetime => 'time', 
							:currencyCode => 'string',
							:operationID => 'string',
							:amount => 'amount',	
							:facilitiesPayment => 'string',
							:publicTokenizationField => 'string'
						}

		@generalData   = generalData
		@operationData = operationData
		@tokenizationData = tokenizationData
		@response = ""
	end
end


