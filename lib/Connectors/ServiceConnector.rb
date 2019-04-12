#encoding: utf-8

$tenant = 't/1.1/'
$bvgTenant = 'ms/'
#$bvgTenant = 'bsa/'
$restAppend = 'api/'

class ServiceConnector
	def initialize(j_header_http, args)#j_wsdl=nil, endpoint=nil, env=nil
		if args[0].eql? "prod"
			endpoint = 'https://apis.todopago.com.ar/'
		else
			endpoint = 'https://portal.integration.todopago.com.ar/'
			#endpoint = 'https://localhost:10443/'
		end

		# atributos
		@j_header_http = j_header_http
		@endPoint 	   = endpoint
	end
end
