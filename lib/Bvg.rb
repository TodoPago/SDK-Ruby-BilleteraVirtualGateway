#encoding: utf-8
require_relative "Exceptions/empty_field_exception"
require_relative "Exceptions/response_exception"
require 'json'

#TRANSACTION_ENDPOINT = 'transactions/api/BSA/transaction'
#PUSHNOTIFICATION_ENDPOINT 	 = 'transactions/api/BSA/transaction/notificacionPush'
TRANSACTION_ENDPOINT = 'tx/v1/bsa'
PUSHNOTIFICATION_ENDPOINT = 'tx/v1/bsa'
DISCOVER_ENDPOINT 	 = 'discover/api/BSA/paymentMethod/discover'


##########################################################################################
# => Billetera Stand Alone
##########################################################################################
class Bvg
	attr_accessor :attr_error

	def initialize(restConnector)
		@attr_error = Hash.new
		@restConnector = restConnector
	end	
	#####################################################
	# => Discover is an instance of Discover Class
	####################################################
	def discoverPaymentMethods()
		result = ""
		begin
			responseJson = @restConnector.discoverPaymentMethodsBvg(DISCOVER_ENDPOINT)
    		result = JSON.parse(responseJson)
    	rescue Exception=>e      		
      		raise ResponseException.new(JSON.parse(e.message).to_json)
    	end

    	return result
	end 
	
	#####################################################
	# => Transaction is an instance of Transaction Class
	####################################################
	def getTransactions(transaction)
		if(transaction.generalData==nil)
	  		raise EmptyFieldException.new
		end

		if (transaction.operationData==nil)
		  raise EmptyFieldException.new
		end

		# force channel=BVTP
		transaction.generalData[:channel] = "BVTP"
		# Make request 
		dataRequest = Hash.new
		dataRequest["generalData"]   = transaction.generalData
		dataRequest["operationData"] = transaction.operationData
		dataRequest["technicalData"] = transaction.technicalData

		# Validate Request 
		valid = self.validate(dataRequest , transaction.attr_required ) #, transaction.attr_required_format)

		if (valid)
			# Call method
			begin
				responseJson = @restConnector.getTransactions(TRANSACTION_ENDPOINT, dataRequest.to_json)
				transaction.response = JSON.parse(responseJson)
			rescue => e
				raise e.response
			end			
		else 
			# If not valid, notify errors
			raise EmptyFieldException.new(@attr_error.to_json)
		end	

		return transaction
	end

	#####################################################
	# => pushNotificationObject is an instance of pushNotification Class
	####################################################
	def pushNotification(pushNotificationObject)
		if(pushNotificationObject.generalData==nil)
	  		raise EmptyFieldException.new
		end

		if (pushNotificationObject.operationData==nil)
		  raise EmptyFieldException.new
		end

		if (pushNotificationObject.tokenizationData==nil)
		  raise EmptyFieldException.new
		end

		# Make request 
		dataRequest = Hash.new
		dataRequest["generalData"]   = pushNotificationObject.generalData
		dataRequest["operationData"] = pushNotificationObject.operationData
		dataRequest["tokenizationData"] = pushNotificationObject.tokenizationData

		# Validate Request 
		valid = self.validate(dataRequest , pushNotificationObject.attr_required) #, pushNotificationObject.attr_required_format )
 
		if (valid)
			# Call method
			begin
				responseJson = @restConnector.pushNotification(PUSHNOTIFICATION_ENDPOINT, dataRequest.to_json)
				pushNotificationObject.response = JSON.parse(responseJson)
			rescue => e
				raise e.response
			end
				
		else 
			# If not valid, notify errors
			raise EmptyFieldException.new(@attr_error.to_json)
		end	

		return pushNotificationObject
	end

	#####################################################
	# => Validate Transaction Data
	#####################################################
	def validate(data, attr_required)
        result = true
        # Merge input fields into array
		arr_att = Hash.new
		
		if !self.validate_optional(data)
			return false
		end	
		
		data.each do |k, dataRequest|
			dataRequest.each do |key, value|
    			arr_att[key] = value
			end
		end
		
		# Now I notice if required fields are all positions
		attr_required.each do |key, type|

			if not ( arr_att.key?(key) )
				@attr_error[key] = 'Este campo es requerido '
				result = false
			else
				# If setted, validate format
				value = arr_att[key]
				type_value = value.class

				case type
				when 'time'
					if not self.isDate(value)
						@attr_error[key] = "El campo ingresado debe ser de tipo YYYYMMDDHHmmss"
						result = false
					end
				when 'ip'
					if not self.isIp(value)
						@attr_error[key] = "La ip no pudo ser reconocida como valida"
						result = false
					end
				when 'amount'
					hash_values =  value.split(',')

					if hash_values.length == 2
						hash_values.each do |val|
							h_val = val.split('.')
							if h_val.length > 1
								@attr_error[key] = 'El monto no debe tener puntos, debe tener la forma NN,NN'
								result = false
							end	
						end	

						if hash_values[1].length == 2
							# verificar que no hayan letras 
							if (/\D/.match(hash_values[1]) )
							 	@attr_error[key] = 'El monto debe ser de tipo numerico'
							 	result = false
							end

						else 
							@attr_error[key] = 'El monto debe tener dos decimales'
							result = false
						end

						# verificar que no hayan letras en los enteros
						if (/\D/.match(hash_values[0]) )
						 	@attr_error[key] = 'El monto debe ser de tipo numerico'
						 	result = false
						end
						# verificar que el num total no sea mayor a 999999999,99 
						value = value.sub(',','.')
						if value.to_f > 999999999.99
							@attr_error[key] = 'el numero no debe ser mayor a 999999999,99'
							result = false
						end 
						
					else
						@attr_error[key] = 'El formato del monto es invalido , debe tener la forma NN,NN'
						result = false
					end
				else
					if type_value.to_s.downcase != type	
						@attr_error[key] = "El campo ingresado debe ser de tipo " + type
						result = false
					end
				end
			end
		end	

		return result
	end	


	def validate_optional(data)
		result = true

		if data["operationData"].key?(:idGateway)
			# valido
			num = data["operationData"][:idGateway]
			if num != ""
				if !num.is_a? Integer
					@attr_error[:idGateway] = 'Este campo debe ser entero '
					result = false
				end
			end
		end	


		if data["operationData"].key?(:resultCodeGateway)
			# valido
			num = data["operationData"][:resultCodeGateway].to_i
			if num == 0
				@attr_error[:resultCodeGateway] = 'Este campo debe ser entero '
				result = false
			end
		end

		if data["operationData"].key?(:resultCodeMedioPago)
			# valido
			num = data["operationData"][:resultCodeMedioPago].to_i
			if num == 0
				@attr_error[:resultCodeMedioPago] = 'Este campo debe ser entero '
				result = false
			end
		end

		if data["operationData"].key?(:currencyCode)		
			if data["operationData"][:currencyCode] != "032"
				@attr_error[:currencyCode] = 'Currency Code invalido'
				result = false
			end
		end
		

		if data["operationData"].key?(:buyerPreselection)
			if data["operationData"][:buyerPreselection].key?(:paymentMethodId)
				# valido
				num = data["operationData"][:buyerPreselection][:paymentMethodId]
				if !num.is_a? Integer
					@attr_error[:paymentMethodId] = 'Este campo debe ser entero '
					result = false
				end
			end	

			if data["operationData"][:buyerPreselection].key?(:bankId)
				# valido 
				num = data["operationData"][:buyerPreselection][:bankId]
				if !num.is_a? Integer
					@attr_error[:bankId] = 'Este campo debe ser entero '
					result = false
				end
			end	
		end

		if data["operationData"].key?(:availablePaymentMethods)
			if !is_array_of_integers(data["operationData"][:availablePaymentMethods])
				@attr_error[:availablePaymentMethods] = 'Debe ser un array de enteros no nulos'
				result = false
			end
		end

		if data["operationData"].key?(:availableBanks)
			if !is_array_of_integers(data["operationData"][:availableBanks])
				@attr_error[:availableBanks] = 'Debe ser un array de enteros no nulos'
				result = false
			end
		end			

		return result
	end


	def is_array_of_integers(array_data)
		result = true
		if array_data.class.to_s.downcase == 'array'
			array_data.each do |key|
				result = key.is_a? Integer
			end

		else
			result = false
		end	

		return result
	end

	##############################
	# => validate date format
	##############################
	def isDate(string)
		if string.length > 14
			result = false
			return result
		end
		begin
			yearStr = string.slice(0,4)
			monthStr = string.slice(4,2)
			dayStr = string.slice(6,2)
			hourStr = string.slice(8,2)
			minStr = string.slice(10,2)
			segStr = string.slice(12,-1)


			date = Date.strptime(string,"%Y%m%d%H%M%S")
			result = true

			if hourStr == "24" 
				result = false
			end
			if minStr == "60"
				result = false
			end
			if segStr == "60"
				result = false
			end
		rescue => e
			result = false
		end	
		return result
	end	

	##############################
	# => validate Ip format
	##############################
	def isIp(str)
		return str.count('.')==3 && str.split('.').all? {|s| s[/^\d{1,3}$/] && s.to_i < 256}	
	end

end 
