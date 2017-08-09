#encoding: utf-8

class DataProvider
	
	def getHeader
		return {'Authorization'=>'TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE'}
	end

	### DiscoverPaymentMethods
    def discoverPaymentMethodsResponseOK
    	return '[{"idMedioPago":"1","nombre":"AMEX","tipoMedioPago":"Crédito","idBanco":"52","nombreBanco":"BANCO BICA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"52","nombreBanco":"BANCO BICA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"52","nombreBanco":"BANCO BICA"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"52","nombreBanco":"BANCO BICA"},{"idMedioPago":"900","nombre":"VISA RECARGABLE","tipoMedioPago":"Recargable","idBanco":"52","nombreBanco":"BANCO BICA"},{"idMedioPago":"908","nombre":"CABAL PRECARGADA","tipoMedioPago":"Recargable","idBanco":"55","nombreBanco":"BANCO CAJA POPULAR DE TUCUMAN"},{"idMedioPago":"6","nombre":"CABAL","tipoMedioPago":"Crédito","idBanco":"49","nombreBanco":"BANCO CETELEM"},{"idMedioPago":"900","nombre":"VISA RECARGABLE","tipoMedioPago":"Recargable","idBanco":"49","nombreBanco":"BANCO CETELEM"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"11","nombreBanco":"BANCO CIUDAD DE BUENOS AIRES"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"11","nombreBanco":"BANCO CIUDAD DE BUENOS AIRES"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"11","nombreBanco":"BANCO CIUDAD DE BUENOS AIRES"},{"idMedioPago":"2","nombre":"DINERS","tipoMedioPago":"Crédito","idBanco":"12","nombreBanco":"BANCO COMAFI"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"12","nombreBanco":"BANCO COMAFI"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"12","nombreBanco":"BANCO COMAFI"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"12","nombreBanco":"BANCO COMAFI"},{"idMedioPago":"1","nombre":"AMEX","tipoMedioPago":"Crédito","idBanco":"8","nombreBanco":"BANCO CREDICOOP"},{"idMedioPago":"6","nombre":"CABAL","tipoMedioPago":"Crédito","idBanco":"8","nombreBanco":"BANCO CREDICOOP"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"8","nombreBanco":"BANCO CREDICOOP"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"8","nombreBanco":"BANCO CREDICOOP"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"33","nombreBanco":"BANCO DE CORDOBA"},{"idMedioPago":"910","nombre":"ARGENCARD","tipoMedioPago":"Recargable","idBanco":"15","nombreBanco":"BANCO DE LA NACION ARGENTINA"},{"idMedioPago":"13","nombre":"MAESTRO","tipoMedioPago":"Débito","idBanco":"15","nombreBanco":"BANCO DE LA NACION ARGENTINA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"15","nombreBanco":"BANCO DE LA NACION ARGENTINA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"15","nombreBanco":"BANCO DE LA NACION ARGENTINA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"3","nombreBanco":"BANCO DE LA PROVINCIA DE BS.AS."},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"3","nombreBanco":"BANCO DE LA PROVINCIA DE BS.AS."},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"3","nombreBanco":"BANCO DE LA PROVINCIA DE BS.AS."},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"58","nombreBanco":"BANCO DE LA REP. ORIENTAL DEL URUGUAY"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"20","nombreBanco":"BANCO DE SAN JUAN"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"20","nombreBanco":"BANCO DE SAN JUAN"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"20","nombreBanco":"BANCO DE SAN JUAN"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"16","nombreBanco":"BANCO DEL TUCUMAN"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"16","nombreBanco":"BANCO DEL TUCUMAN"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"44","nombreBanco":"BANCO FINANSUR"},{"idMedioPago":"1","nombre":"AMEX","tipoMedioPago":"Crédito","idBanco":"17","nombreBanco":"BANCO GALICIA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"17","nombreBanco":"BANCO GALICIA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"17","nombreBanco":"BANCO GALICIA"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"17","nombreBanco":"BANCO GALICIA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"14","nombreBanco":"BANCO HIPOTECARIO"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"14","nombreBanco":"BANCO HIPOTECARIO"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"9","nombreBanco":"BANCO ITAU ARGENTINA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"9","nombreBanco":"BANCO ITAU ARGENTINA"},{"idMedioPago":"13","nombre":"MAESTRO","tipoMedioPago":"Débito","idBanco":"2","nombreBanco":"BANCO MACRO"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"2","nombreBanco":"BANCO MACRO"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"2","nombreBanco":"BANCO MACRO"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"50","nombreBanco":"BANCO MAS VENTAS"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"1","nombreBanco":"BANCO PATAGONIA"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"1","nombreBanco":"BANCO PATAGONIA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"21","nombreBanco":"BANCO SANTA CRUZ"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"21","nombreBanco":"BANCO SANTA CRUZ"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"21","nombreBanco":"BANCO SANTA CRUZ"},{"idMedioPago":"1","nombre":"AMEX","tipoMedioPago":"Crédito","idBanco":"18","nombreBanco":"BANCO SANTANDER"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"18","nombreBanco":"BANCO SANTANDER"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"10","nombreBanco":"BANCO SUPERVIELLE"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"10","nombreBanco":"BANCO SUPERVIELLE"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"7","nombreBanco":"BBVA BANCO FRANCES"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"7","nombreBanco":"BBVA BANCO FRANCES"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"22","nombreBanco":"BIND"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"6","nombreBanco":"CITIBANK"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"6","nombreBanco":"CITIBANK"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"24","nombreBanco":"COLUMBIA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"29","nombreBanco":"EFECTIVO SI"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"29","nombreBanco":"EFECTIVO SI"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"5","nombreBanco":"HSBC BANK ARGENTINA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"5","nombreBanco":"HSBC BANK ARGENTINA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"4","nombreBanco":"ICBC"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"4","nombreBanco":"ICBC"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"4","nombreBanco":"ICBC"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"27","nombreBanco":"MIRA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"25","nombreBanco":"NARANJA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"25","nombreBanco":"NARANJA"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"26","nombreBanco":"NEVADA"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"23","nombreBanco":"NUEVO BANCO DE ENTRE RIOS"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"23","nombreBanco":"NUEVO BANCO DE ENTRE RIOS"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"23","nombreBanco":"NUEVO BANCO DE ENTRE RIOS"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"13","nombreBanco":"NUEVO BANCO DE SANTA FE"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"13","nombreBanco":"NUEVO BANCO DE SANTA FE"},{"idMedioPago":"43","nombre":"VISA DEBITO","tipoMedioPago":"Débito","idBanco":"13","nombreBanco":"NUEVO BANCO DE SANTA FE"},{"idMedioPago":"14","nombre":"MASTERCARD","tipoMedioPago":"Crédito","idBanco":"19","nombreBanco":"OTROS"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"19","nombreBanco":"OTROS"},{"idMedioPago":"42","nombre":"VISA","tipoMedioPago":"Crédito","idBanco":"28","nombreBanco":"TARSHOP"}]'
    end 

	def discoverPaymentMethodsResponseFail
        return '[]'
	end

	### Transactions
	def transactionsRequest(test_condition)
		
		generalData = Hash.new
		generalData[:merchant] = 41702
		generalData[:security] = "TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE"
		generalData[:operationDatetime] = "20170308041300"
		generalData[:remoteIpAddress] = "192.168.11.87"
		generalData[:channel] = "BVTP"

		operationData = Hash.new
		operationData[:operationType] = "Compra"
		operationData[:operationID] = "1234"
		operationData[:currencyCode] = "032"
		operationData[:concept] = "compra"
		operationData[:amount] = "10,99"

		availablePaymentMethods = ["1", "42"]
		operationData[:availablePaymentMethods] = availablePaymentMethods
		availableBanks = ["6", "24", "29"]
		operationData[:availableBanks] = availableBanks

		buyerPreselection = Hash.new 
		buyerPreselection[:paymentMethodId] = "42"
		buyerPreselection[:bankId] = "6"
		operationData[:buyerPreselection] = buyerPreselection 


		# Esto es no obligatorio , puede mandarse un hash vacio 
		technicalData = Hash.new
		technicalData[:sdk] = "Ruby"
		technicalData[:sdkversion] = "1.4"
		technicalData[:lenguageversion] = "1.8"
		technicalData[:pluginversion] = "2.1"
		technicalData[:ecommercename] = "TEST"
		technicalData[:ecommerceversion] = "3.1"
		technicalData[:cmsversion] = "2.4"

		case test_condition
		when 'fail'
			operationData[:amount] = ''
		when 'fail_user'
			generalData[:merchant] = 0
		end


		return { generalData: generalData, operationData: operationData, technicalData: technicalData }
	end

	def transactionsResponseOk
		return '{"publicRequestKey": "d8c8c9a9-f649-467d-a6e2-022eac851232","merchantId": "41702","channel": "11"}'
	end

	def transactionsResponseFail
		return '{"errorCode": "1014","errorMessage": "Completá este campo.","channel": "11"}'
	end	

	def transactionsResponseUserFail
		return '{"errorCode": "702","errorMessage": "Cuenta de vendedor invalida","channel": "11"}'
	end	


	### PushNotification
	def pushNotificationRequest(test_condition)
		generalData = Hash.new
		generalData[:merchant] = 41702
		generalData[:security] = "TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE"
		generalData[:remoteIpAddress] = "192.168.11.87"
		generalData[:publicRequestKey] = "607fb6ce-9aca-4de3-89be-a233474f1414" #"cae31848-07a4-48fc-842c-aef021db8a74"
		generalData[:operationName] = "Compra"

		operationData = Hash.new
		operationData[:resultCodeMedioPago] = "-1" 
		operationData[:resultCodeGateway] = "-1"
		operationData[:idGateway] = "8"
		operationData[:resultMessage] = "Aprobada"
		operationData[:operationDatetime] = "20160425101010"
		operationData[:ticketNumber] = "7866463542424"
		operationData[:codigoAutorizacion] = "455422446756567"
		operationData[:currencyCode] = "032"
		operationData[:operationID] = "1234"
		operationData[:concept] = "compra"
		operationData[:amount] = "10,99"
		operationData[:facilitiesPayment] = "03"

		tokenizationData = Hash.new
		tokenizationData[:publicTokenizationField] = "sydguyt3e862t76ierh76487638rhkh7"
		tokenizationData[:credentialMask] = "4510XXXXX00001"

		case test_condition
		when 'fail'
			operationData[:amount] = ''
		when 'fail_user'
			generalData[:merchant] = 0
		end

		return { generalData: generalData, operationData: operationData, tokenizationData: tokenizationData }
	end	

	def pushNotificationResponseOk
		return '{"statusCode":"-1","statusMessage":"OK"}'
	end

	def pushNotificationResponseFail
		return '{"errorCode":"1014","errorMessage":"Completá este campo.","channel":"11"}'
	end

	def pushNotificationResponseUserFail
		return '{"errorCode": "702","errorMessage": "Cuenta de vendedor invalida","channel": "11"}'
	end

	### GET CREDENTIALS
    def GetCredentialsOptions(test_condition)
    	params = {user:'mail@todopago.com', password:'Password1'}
    	case test_condition 
		when 'failUser'
			params[:user] = "aaaa@bbbb.com"
		when 'failPassword' 
			params[:password]= 'aaaaaa';				
		end

    	return params 

    end

    def GetCredentialsResponseOK
    	return '{"Credentials":{"codigoResultado":1,"resultado":{"codigoResultado":0,"mensajeKey":null,"mensajeResultado":"Aceptado"},"merchantId":2153,"APIKey":"TODOPAGO f3d8b72c94ab4a06be2ef7c95490f7d3"}}'
    end

    def GetCredentialsResponseFailUser
    	return '{"Credentials":{"codigoResultado":1,"resultado":{"codigoResultado":1050,"mensajeKey":1050,"mensajeResultado":"Este usuario no se encuentra registrado. Revisá la información indicada o registrate."},"merchantId":null,"APIKey":null}}'
    end

    def GetCredentialsResponseFailPassword
    	return '{"Credentials":{"codigoResultado":1,"resultado":{"codigoResultado":1055,"mensajeKey":1055,"mensajeResultado":"La contraseña ingresada es incorrecta. Revisala."},"merchantId":null,"APIKey":null}}'
    end


end