#encoding: utf-8

require "../lib/Classes/discover.rb"
require "../lib/Bvg.rb"

require_relative "Connectors/RestConnector"

$versionTodoPago = '1.1.0'

class BvgConnector
  # método inicializar clase
  def initialize(j_header_http, *args)#j_wsdl=nil, endpoint=nil, env=nil
      @discover      = nil

      @restConnector = RestConnector.new(j_header_http, args)
      @BVG           = Bvg.new(@restConnector)
  end

  def setRestConnector(restConnector)
      @restConnector = restConnector
      @BVG = Bvg.new(@restConnector)
  end


  ########################################################################
  ###### GETCREDENTIALS ##################################################
  ########################################################################
  def getCredentials(user)
    return @restConnector.getCredentials(user)
  end

  ######################################################
  ###Metodo publico que descubre los metodos de pago###
  ######################################################
  def discoverPaymentMethodsBVG()
    return @BVG.discoverPaymentMethods()
  end
  
  #######################################################
  # => Public Method 
  # => transaction is an instance of Transaction class
  #######################################################
  def transactions(transaction)
    return @BVG.getTransactions(transaction)
  end   

  #######################################################
  # => Public Method 
  # => pushNotification is an instance of pushNotification class
  #######################################################
  def pushNotification(pushNotification)
    return @BVG.pushNotification(pushNotification)
  end

end

