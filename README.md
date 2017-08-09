<a name="inicio"></a>		
Todo Pago - módulo SDK-Ruby para conexión con gateway de pago
=======

 + [Instalación](#instalacion)
 	+ [Creación de la gema BVGConector](#creategem)
 	+ [Instalación de la gema BVGConector](#installgem)
 	+ [Versiones de Ruby soportadas](#Versionesderubysoportadas)
 	+ [Generalidades](#general)
 + [Uso](#uso)		
  + [Inicializar la clase correspondiente al conector (BVGConector)](#initconector)
  + [Ambientes](#test)
  + [Billetera Virtual para Gateways](#BVG)
    + [Diagrama de Secuencia](#bsa-uml)
    + [Descubrimiento de medios de pago](#discover)
    + [Transacciones](#transaction) 
    + [PushNotification](#pushnotification)
    + [Obtener Credenciales](#credenciales)
    
<a name="instalacion"></a>		
## Instalación		
Se debe descargar la última versión del SDK desde el botón Download ZIP del branch master.
Se debe crear un archivo .gem que debe ser instalado para poder utilizarlo.

<a name="creategem"></a>   
### 1. Creación de la gema BVGConector
Abrir la consola tipear:
```
	cd "ruta-del-sdk"
```
Donde ruta-del-sdk es la ruta donde se descomprimió el zip

Para crear el archivo .gem se debe ejecutar el comando gem build
```
        gem build BVGConector.gemspec
```

Se debe obtener el archivo BVGConector.gem

[<sub>Volver a inicio</sub>](#inicio)	

<a name="installgem"></a>   
#### 2. Instalación de la gema BVGConector
```
        gem install ./BVGConector.gem
        gem install json
```
[<sub>Volver a inicio</sub>](#inicio)	

<a name="Versionesderubysoportadas"></a> 

#### 3. Versiones de Ruby soportadas    
La versión implementada de la SDK, esta testeada para versiones de Ruby desde 1.9.3 en adelante.

[<sub>Volver a inicio</sub>](#inicio)

<a name="general"></a>
#### 4. Generalidades
Esta versión soporta únicamente pago en moneda nacional argentina (CURRENCYCODE = 32).

[<sub>Volver a inicio</sub>](#inicio)	
<br>
<a name="uso"></a>		
## Uso		

<a name="initconector"></a>
#### Inicializar la clase correspondiente al conector (BVGConector).

- crear una estructura como la del ejemplo con los http header suministrados por todo pago
```ruby
j_header_http = {
    "Authorization"=>"PRISMA f3d8b72c94ab4a06be2ef7c95490f7d3"
}
```
- crear una instancia de la clase TodoPago

```ruby		
mode = 'test' # identificador de entorno obligatorio, la otra opción es prod

conector = TodoPagoConector.new(j_header_http,
                                mode) # Mode y http_header provisto por TODO PAGO   
```				
<a name="test"></a>      
#### Ambientes

El SDK-Ruby permite trabajar con los ambiente de Developers y de Producción de Todo Pago.<br>
El ambiente se debe instanciar como se indica a continuacion.

```ruby
#identificador de entorno obligatorio, la otra opcion es prod
mode = "test" 

#authorization key del ambiente requerido
j_header_http = {
    'Authorization'=>'TODOPAGO 8A891C0676A25FBF052D1C2FFBC82DEE'
}

conector = BvgConnector.new(j_header_http, mode)
```

Puede consultar los datos de prueba en la [web de TodoPago](https://developers.todopago.com.ar/site/datos-de-prueba).

[<sub>Volver a inicio</sub>](#inicio)
<br>

<a name="BVG"></a>
## Billetera Virtual para Gateways

La Billetera Virtual para Gateways es la versión de Todo Pago para los comercios que permite utilizar los servicios de la billetera TodoPago dentro de los e-commerce, respetando y manteniendo sus respectivas promociones con bancos y marcas y números de comercio (métodos de adquirencia). Manteniendo su Gateway de pago actual, y utilizando BSA para la selección del medio de pago y la tokenizacion de la información para mayor seguridad en las transacciones.

<a name="bsa-uml"></a>
#### Diagrama de secuencia

![Diagrama de Secuencia BSA](http://www.plantuml.com/plantuml/png/ZL9BJiCm4Dtd5BDi5roW2oJw0I7ngMWlC3ZJOd0zaUq4XJknuWYz67Q-JY65bUNHlFVcpHiKZWqib2JjACdGE2baXjh1DPj3hj187fGNV20ZJehppTNWVuEEth5C4XHE5lxJAJGlN5nsJ323bP9xWWptQ42mhlXwQAlO0JpOTtZSXfMNT0YFcQzhif1MD0oJfRI22pBJdYYm1jnG-ubinjhZjcXUoQ654kQe1TiafG4srczzpE0-9-iC0f-CSDPgQ3v-wQvtLAVskTB5yHE156ISofG33dEVdFp0ccYoDQXje64z7N4P1iN_cRgZmkU8yH48Gm4JLIA3VJM0UIzrRob2H6s_xl1PAaME38voRqYH28l6DgzJqjxpaegSLE6JvJVIthZNu7BW83BVtAp7hVqTLcVezrr3Eo_jORVD8wTaoERAOHMKgXEErjwI_CpvLk_yS1ZX6pXCrhbzUM0dTsKJRoJznsMUdwOZYMirnpS0)

Para acceder al servicio, los vendedores podrán adherirse en el sitio exclusivo de Botón o a través de su ejecutivo comercial. En estos procesos se generará el usuario y clave para este servicio.

<a name="discover"></a>
#### Discover
El método **discover** permite conocer los medios de pago disponibles

```ruby	
####################################  DiscoverPaymentMethods   ############################################
discover = Discover.new()
discover = conector.discoverPaymentMethods(discover)
puts '--------------- DISCOVER ------------------------------'
puts discover.paymentMethods
puts '-------------------------------------------------------'
```

Por cada medio de pago veremos lo siguiente:

Campo       | Descripción           | Tipo de dato | Ejemplo
------------|-----------------------|--------------|--------
id          | Id del medio de pago  | numérico     | 42
nombre      | Marca de la tarjeta   | string       | "VISA"
tipo        | Tipo de medio de pago | string       | "Crédito"
idBanco     | Id del banco          | numérico     | 10
nombreBanco | Nombre del banco      | string       | "Banco Ciudad"

Ejemplo de respuesta:

```
    object(TodoPago\BSA\PaymentMethod)#8 (5) {
      ["id":protected]=>
      string(2) "42"
      ["nombre":protected]=>
      string(4) "VISA"
      ["tipo":protected]=>
      string(8) "Crédito"
      ["idBanco":protected]=>
      NULL
      ["nombreBanco":protected]=>
      NULL
    }
```

[<sub>Volver a inicio</sub>](#inicio)
<br>

<a name="transaction"></a>
#### Transacciones

El método **transaction** permite registrar una transacción.

Para utilizar este metodo se requiere seguir estos pasos
- se instancia el conector 
- se instancia la clase Transaction
- se pasa por parametro el objeto Transaction al metodo transactions del conector.
  Esto devuelve el objeto Transaction con la respuesta de la consulta en el atributo response.
Ejemplo:
```ruby	
#######################################    TRANSACTION   ################################################## 
generalData = Hash.new
generalData[:merchant] = "1"
generalData[:security] = "PRISMA 86333EFD8AD0C71CEA3BF06D7BDEF90D"
generalData[:operationDatetime] = "201604251556134"
generalData[:remoteIpAddress] = "192.168.11.87"
generalData[:channel] = "BVTP"

operationData = Hash.new
operationData[:operationType] = "Compra"
operationData[:operationID] = "1234"
operationData[:currencyCode] = "032"
operationData[:concept] = "compra"
operationData[:amount] = "999,99"

availablePaymentMethods = ["1", "42"]
operationData[:availablePaymentMethods] = availablePaymentMethods

availableBanks = ["6", "24", "29"]
operationData[:availableBanks] = availableBanks

buyerPreselection = Hash.new 
buyerPreselection[:paymentMethodId] = "42"
buyerPreselection[:bankId] = "11"
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

transaction = Transaction.new(generalData, operationData, technicalData)
transaction = conector.transactions(transaction) 


puts '--------------- TRANSACTIONS ------------------------------'
puts transaction.response
puts '-------------------------------------------------------'

```

Ejemplo de respuesta:

```
  array(5) {
    ["transactionid"]=>
    string(36) "f9878b59-5ce6-408b-ace6-02ccc2d16ecb"
    ["publicRequestKey"]=>
    string(36) "b6f492ea-b829-43c0-a8f6-5af95ae93001"
    ["requestKey"]=>
    string(36) "9ca41afb-48d0-4268-a9c5-5904d9f207a4"
    ["url_HibridFormResuorces"]=>
    string(28) "www.google.com.ar/Formulario"
    ["channel"]=>
    string(2) "11"
  }

```

#### Datos de referencia   

<table>
<tr><th>Nombre del campo</th><th>Required/Optional</th><th>Data Type</th><th>Comentarios</th></tr>
<tr><td>security</td><td>Required</td><td>String</td><td>Authorization que deberá contener el valor del api key de la cuenta del vendedor (Merchant)</td></tr>
<tr><td>operationDatetime</td><td>Required</td><td>String</td><td>Fecha Hora de la invocacion en Formato yyyyMMddHHmmssSSS</td></tr>
<tr><td>remoteIpAddress</td><td>Required</td><td>String</td><td>IP desde la cual se envía el requerimiento</td></tr>
<tr><td>merchant</td><td>Required</td><td>String</td><td>ID de cuenta del vendedor</td></tr>
<tr><td>operationType</td><td>Optional</td><td>String</td><td>Valor fijo definido para esta operatoria de integración</td></tr>
<tr><td>operationID</td><td>Required</td><td>String</td><td>ID de la operación en el eCommerce</td></tr>
<tr><td>currencyCode</td><td>Required</td><td>String</td><td>Valor fijo 32</td></tr>
<tr><td>concept</td><td>Optional</td><td>String</td><td>Especifica el concepto de la operación</td></tr>
<tr><td>amount</td><td>Required</td><td>String</td><td>Formato 999999999,99</td></tr>
<tr><td>availablePaymentMethods</td><td>Optional</td><td>Array</td><td>Array de Strings obtenidos desde el servicio de descubrimiento de medios de pago. Lista de ids de Medios de Pago habilitados para la transacción. Si no se envía están habilitados todos los Medios de Pago del usuario.</td></tr>
<tr><td>availableBanks</td><td>Optional</td><td>Array</td><td>Array de Strings obtenidos desde el servicio de descubrimiento de medios de pago. Lista de ids de Bancos habilitados para la transacción. Si no se envía están habilitados todos los bancos del usuario.</td></tr>
<tr><td>buyerPreselection</td><td>Optional</td><td>BuyerPreselection</td><td>Preselección de pago del usuario</td></tr>
<tr><td>sdk</td><td>Optional</td><td>String</td><td>Parámetro de versión de API</td></tr>
<tr><td>sdkversion</td><td>Optional</td><td>String</td><td>Parámetro de versión de API</td></tr>
<tr><td>lenguageversion</td><td>Optional</td><td>String</td><td>Parámetro de versión de API</td></tr>
<tr><td>pluginversion</td><td>Optional</td><td>String</td><td>Parámetro de versión de API</td></tr>
<tr><td>ecommercename</td><td>Optional</td><td>String</td><td>Parámetro de versión de API</td></tr>
<tr><td>ecommerceversion</td><td>Optional</td><td>String</td><td>Parámetro de versión de API</td></tr>
<tr><td>cmsversion</td><td>Optional</td><td>String</td><td>Parámetro de versión de API</td></tr>
</table>
<br>
<strong>BuyerPreselection</strong>
<br>
<table>
<tr><th>Nombre del campo</th><th>Data Type</th><th>Comentarios</th></tr>
<tr><td>paymentMethodId</td><td>String</td><td>Id del medio de pago seleccionado</td></tr>
<tr><td>bankId</td><td>String</td><td>Id del banco seleccionado</td></tr>
</table>

[<sub>Volver a inicio</sub>](#inicio)
<br>


<a name="pushnotification"></a>
#### Push Notification

El método **pushnotify** permite registrar la finalización de una transacción.

Para utilizar este metodo se requiere seguir estos pasos
- se instancia el conector 
- se instancia la clase PushNotification
- se pasa por parametro el objeto PushNotification al metodo PushNotification del conector.
  Esto devuelve el objeto PushNotification con la respuesta de la consulta en el atributo response.
Ejemplo:
```ruby 
#######################################    PUSH NOTIFICATION   ################################################## 
generalData = Hash.new
generalData[:merchant] = "1"
generalData[:security] = "PRISMA 86333EFD8AD0C71CEA3BF06D7BDEF90D"
generalData[:remoteIpAddress] = "192.168.11.87"
generalData[:publicRequestKey] = "cae31848-07a4-48fc-842c-aef021db8a74"
generalData[:operationName] = "Compra"

operationData = Hash.new
operationData[:resultCodeMedioPago] = "-1" 
operationData[:resultCodeGateway] = "-1"
operationData[:idGateway] = "8"
operationData[:resultMessage] = "Aprobada"
operationData[:operationDatetime] = "201607040857364"
operationData[:ticketNumber] = "7866463542424"
operationData[:codigoAutorizacion] = "455422446756567"
operationData[:currencyCode] = "032"
operationData[:operationID] = "1234"
operationData[:concept] = "compra"
operationData[:amount] = "999,99"
operationData[:facilitiesPayment] = "03"

tokenizationData = Hash.new
tokenizationData[:publicTokenizationField] = "sydguyt3e862t76ierh76487638rhkh7"
tokenizationData[:credentialMask] = "4510XXXXX00001"

pushNotification = PushNotification.new(generalData, operationData, tokenizationData)
pushNotification = conector.pushNotification(pushNotification) 


puts '--------------- PUSH NOTIFICATION ------------------------------'
puts pushNotification.response
puts '-------------------------------------------------------'
#################################################
```

Ejemplo de respuesta:

```
  array(2) {
    ["statusCode"]=>
    string(2) "-1"
    ["statusMessage"]=>
    string(2) "OK"
  }

```

#### Datos de referencia   

<table>
<tr><th>Nombre del campo</th><th>Required/Optional</th><th>Data Type</th><th>Comentarios</th></tr>
<tr><td>Security</td><td>Required</td><td>String</td><td>Authorization que deberá contener el valor del api key de la cuenta del vendedor (Merchant). Este dato viaja en el Header HTTP</td></tr>
<tr><td>Merchant</td><td>Required</td><td>String</td><td>ID de cuenta del comercio</td></tr>
<tr><td>RemoteIpAddress</td><td>Optional</td><td>String</td><td>IP desde la cual se envía el requerimiento</td></tr>
<tr><td>PublicRequestKey</td><td>Required</td><td>String</td><td>publicRequestKey de la transacción creada. Ejemplo: 710268a7-7688-c8bf-68c9-430107e6b9da</td></tr>
<tr><td>OperationName</td><td>Required</td><td>String</td><td>Valor que describe la operación a realizar, debe ser fijo entre los siguientes valores: “Compra”, “Devolucion” o “Anulacion”</td></tr>
<tr><td>ResultCodeMedioPago</td><td>Optional</td><td>String</td><td>Código de respuesta de la operación propocionado por el medio de pago</td></tr>
<tr><td>ResultCodeGateway</td><td>Optional</td><td>String</td><td>Código de respuesta de la operación propocionado por el gateway</td></tr>
<tr><td>idGateway</td><td>Optional</td><td>String</td><td>Id del Gateway que procesó el pago. Si envían el resultCodeGateway, es obligatorio que envíen este campo</td></tr>
<tr><td>ResultMessage</td><td>Optional</td><td>String</td><td>Detalle de respuesta de la operación.</td></tr>
<tr><td>OperationDatetime</td><td>Required</td><td>String</td><td>Fecha Hora de la operación en el comercio en Formato yyyyMMddHHmmssMMM</td></tr>
<tr><td>TicketNumber</td><td>Optional</td><td>String</td><td>Numero de ticket generado</td></tr>
<tr><td>CodigoAutorizacion</td><td>Optional</td><td>String</td><td>Codigo de autorización de la operación</td></tr>
<tr><td>CurrencyCode</td><td>Required</td><td>String</td><td>Valor fijo 32</td></tr>
<tr><td>OperationID</td><td>Required</td><td>String</td><td>ID de la operación en el eCommerce</td></tr>
<tr><td>Amount</td><td>Required</td><td>String</td><td>Formato 999999999,99</td></tr>
<tr><td>FacilitiesPayment</td><td>Required</td><td>String</td><td>Formato 99</td></tr>
<tr><td>Concept</td><td>Optional</td><td>String</td><td>Especifica el concepto de la operación dentro del ecommerce</td></tr>
<tr><td>PublicTokenizationField</td><td>Required</td><td>String</td><td></td></tr>
<tr><td>CredentialMask</td><td>Optional</td><td>String</td><td></td></tr>
</table>

[<sub>Volver a inicio</sub>](#inicio)

<a name="credenciales"></a>
#### Obtener credenciales
El SDK permite obtener las credenciales "Authentification", "MerchandId" y "Security" de la cuenta de Todo Pago, ingresando el usuario y contraseña.<br>
Esta funcionalidad es útil para obtener los parámetros de configuración dentro de la implementación.

- Crear una instancia de la clase User:
```ruby
u = User.new("email@ejemplo.com", "password1")
response = conector.getCredentials(u)
```

**Observación**: El Security se obtiene a partir de apiKey, eliminando TODOPAGO de este último.

[<sub>Volver a inicio</sub>](#inicio)

<br>
