#encoding: utf-8
require "../lib/bvg_conector.rb"
require "../lib/Bvg.rb"
require "../lib/Classes/discover.rb"
require "../lib/Classes/transaction.rb"
require "../lib/Classes/pushNotification.rb"
require "../lib/Classes/user.rb"

require "../lib/Exceptions/empty_field_user_exception.rb"
require "../lib/Exceptions/empty_field_password_exception.rb"
require "../lib/Exceptions/connection_exception.rb"
require "../lib/Exceptions/response_exception.rb"
require 'date'
require 'json'


mode = "test"

j_header_http = {
    'Authorization'=> 'TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE' #'TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE'
}

conector = BvgConnector.new(j_header_http, mode)


#####################################GET CREDENTIALS###############################################
puts '--------------- GET CREDENTIALS ---------------------------'
##Credentials
u = User.new("email@ejemplo.com", "password1")
begin
	response = conector.getCredentials(u)
	puts(response.to_json)
rescue Exception => msg 
	puts(msg)
end
puts'-------------------------------------------------------'

###################################  DiscoverPaymentMethods   ############################################
puts '--------------- DISCOVER BVG ---------------------------'

begin
	discover = conector.discoverPaymentMethodsBVG()
	puts discover
rescue => e 
	puts e.response
end 

puts '-------------------------------------------------------'


#######################################    TRANSACTION   ################################################## 
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
operationData[:amount] = "11,99"

availablePaymentMethods = [1, 42]
operationData[:availablePaymentMethods] = availablePaymentMethods
availableBanks = [6, 24, 29]
operationData[:availableBanks] = availableBanks

buyerPreselection = Hash.new 
buyerPreselection[:paymentMethodId] = 42
buyerPreselection[:bankId] = 6
operationData[:buyerPreselection] = buyerPreselection 


# Esto es no obligatorio , puede mandarse un hash vacio 
technicalData = Hash.new
technicalData[:sdk] = "Ruby"
technicalData[:sdkversion] = "1.4"
technicalData[:lenguageversion] = "1.8"
technicalData[:pluginversion] = "2.1"
technicalData[:ecommercename] = "DH-gate"
technicalData[:ecommerceversion] = "3.1"
technicalData[:cmsversion] = "2.4"

puts '--------------- TRANSACTIONS ------------------------------'
begin
	transaction = Transaction.new(generalData, operationData, technicalData)
	transaction = conector.transactions(transaction)
	puts transaction.response
rescue Exception => e
		puts e
end	
puts '-------------------------------------------------------'

#################################################


#######################################    PUSH NOTIFICATION   ################################################## 

generalData = Hash.new
generalData[:merchant] = 41702
generalData[:security] = "TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE"
generalData[:remoteIpAddress] = "192.168.11.87"
generalData[:publicRequestKey] = "607fb6ce-9aca-4de3-89be-a233474f1414"
generalData[:operationName] = "Compra"

operationData = Hash.new
operationData[:resultCodeMedioPago] = -1 
operationData[:resultCodeGateway] = -1
operationData[:idGateway] = 8
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

puts '--------------- PUSH NOTIFICATION ------------------------------'
begin
	pushNotification = PushNotification.new(generalData, operationData, tokenizationData)
	pushNotification = conector.pushNotification(pushNotification)
	puts pushNotification.response
rescue Exception => e
		puts e
end	
puts '-------------------------------------------------------'
#################################################
