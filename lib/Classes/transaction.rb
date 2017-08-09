#encoding: utf-8
class Transaction

	attr_accessor :generalData, :operationData, :technicalData, :response, :attr_required
	
	def initialize(generalData=nil, operationData=nil, technicalData=nil)
		@attr_required = {
							:merchant => 'fixnum', 
							:security => 'string', 
							:operationDatetime => 'time', 
							:remoteIpAddress => 'ip',
							:channel => 'string',
							:operationID => 'string',
							:currencyCode => 'string',
							:amount => 'amount'	
						}
		@generalData   = generalData
		@operationData = operationData
		@technicalData = technicalData
		@response = ""
	end
end

