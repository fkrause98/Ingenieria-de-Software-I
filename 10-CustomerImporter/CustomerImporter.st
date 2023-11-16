!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session input'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'assertions' stamp: 'FK 11/15/2023 20:58:43'!
assertAddressOfSecondCustomerIsCorrect: customer2Address

	self assert: (customer2Address streetNameIs: 'Alem').
	self assert: (customer2Address streetNumberIs: 1122).
	self assert: (customer2Address townIs: 'CABA').
	self assert: (customer2Address zipCodeIs: 1001).
	self assert: (customer2Address provinceIs: 'CABA').! !

!ImportTest methodsFor: 'assertions' stamp: 'FK 11/15/2023 20:57:52'!
assertFirstAddressOfFirstCustomerIsCorrect: customer1FirstAddress

	self assert: (customer1FirstAddress streetNameIs: 'San Martin').
	self assert: (customer1FirstAddress streetNumberIs: 3322).
	self assert: (customer1FirstAddress townIs: 'Olivos').
	self assert: (customer1FirstAddress zipCodeIs: 1636).
	self assert: (customer1FirstAddress provinceIs: 'BsAs').! !

!ImportTest methodsFor: 'assertions' stamp: 'FK 11/15/2023 20:54:00'!
assertFirstCustomerDataIsCorrect: customer

	self assert: (customer firstNameIs: 'Pepe').
	self assert: (customer lastNameIs: 'Sanchez').
	self assert: (customer identificationTypeIs: 'D').
	self assert: (customer identificationNumberIs: '22333444').! !

!ImportTest methodsFor: 'assertions' stamp: 'FK 11/15/2023 20:58:25'!
assertSecondAddressOfFirstCustomerIsCorrect: customer1SecondAddress

	self assert: (customer1SecondAddress streetNameIs: 'Maipu').
	self assert: (customer1SecondAddress streetNumberIs: 888).
	self assert: (customer1SecondAddress townIs: 'Florida').
	self assert: (customer1SecondAddress zipCodeIs: 1122).
	self assert: (customer1SecondAddress provinceIs: 'Buenos Aires').! !

!ImportTest methodsFor: 'assertions' stamp: 'FK 11/15/2023 20:53:53'!
assertSecondCustomerDataIsCorrect: customer2

	self assert: (customer2 firstNameIs:  'Juan').
	self assert: (customer2 lastNameIs: 'Perez').
	self assert: (customer2 identificationTypeIs: 'C').
	self assert: (customer2 identificationNumberIs: '23-25666777-9').! !


!ImportTest methodsFor: 'tests' stamp: 'FK 11/15/2023 20:53:41'!
test01ImportAndCheckEveryCustomer
	| numberOfCustomers customer1 customer2 customers |
	self importCustomers: input.
	
	numberOfCustomers := (session selectAllOfType: Customer) size.
	self assert: numberOfCustomers equals: 2.

	customers := session select: [ :aCustomer | aCustomer identificationTypeIs: 'D'] ofType: Customer.
	self assert: customers size equals: 1.
	
	customer1 := customers anyOne.
	self assertFirstCustomerDataIsCorrect: customer1.
	
	customers := session select: [ :aCustomer | aCustomer identificationTypeIs: 'C'] ofType: Customer.
	self assert: customers size equals: 1.

	customer2 := customers anyOne.
	self assertSecondCustomerDataIsCorrect: customer2.! !

!ImportTest methodsFor: 'tests' stamp: 'FK 11/15/2023 20:56:39'!
test02CheckAddressOfBothCustomers
	| customer1FirstAddress customer1SecondAddress customer2Address |.

	self importCustomers: input.
		
	customer1FirstAddress := (session select: [:anAddress | anAddress provinceIs: 'BsAs' ] ofType: Address) anyOne.

	self assertFirstAddressOfFirstCustomerIsCorrect: customer1FirstAddress.
	
	customer1SecondAddress := (session select: [:anAddress | anAddress provinceIs: 'Buenos Aires' ] ofType: Address) anyOne.
	
	self assertSecondAddressOfFirstCustomerIsCorrect: customer1SecondAddress.
	
	customer2Address := (session select: [:anAddress | anAddress provinceIs: 'CABA' ] ofType: Address) anyOne.
	
	self assertAddressOfSecondCustomerIsCorrect: customer2Address.! !


!ImportTest methodsFor: 'testing' stamp: 'FK 11/15/2023 19:40:28'!
importCustomers: anInputStream
	(CustomerImporter withDBSession: session andInputStream: anInputStream) doImport! !

!ImportTest methodsFor: 'testing' stamp: 'FK 11/14/2023 23:44:48'!
setUp
	| newLine |
	newLine := Character newLineCharacter asString.
	input := ReadStream on: 
	'C,Pepe,Sanchez,D,22333444', newLine,
	'A,San Martin,3322,Olivos,1636,BsAs',newLine,
	'A,Maipu,888,Florida,1122,Buenos Aires',newLine,
	'C,Juan,Perez,C,23-25666777-9',newLine,
	'A,Alem,1122,CABA,1001,CABA',newLine.
	session := DataBaseSession for: (Array with: Address with: Customer).
! !

!ImportTest methodsFor: 'testing' stamp: 'FK 11/14/2023 20:47:55'!
tearDown
	session commit.
	session close.! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'FK 11/15/2023 20:41:48'!
provinceIs: aProvince

	^province = aProvince
	! !


!Address methodsFor: 'street' stamp: 'FK 11/15/2023 20:42:29'!
streetNameIs: aStreetName

	^streetName = aStreetName ! !

!Address methodsFor: 'street' stamp: 'FK 11/15/2023 20:42:11'!
streetNumberIs: aStreetNumber

	^streetNumber = aStreetNumber ! !


!Address methodsFor: 'town' stamp: 'FK 11/15/2023 20:42:58'!
townIs: aTown

	^town = aTown! !


!Address methodsFor: 'initialization' stamp: 'FK 11/15/2023 20:40:29'!
initializeWithStreetName: aStreetName streetNumber: aStreetNumber town: aTown zipCode: aZipCode province: aProvince
	streetName := aStreetName.
	streetNumber := aStreetNumber.
	town := aTown.
	zipCode := aZipCode.
	province := aProvince.! !


!Address methodsFor: 'zip code' stamp: 'FK 11/15/2023 20:43:17'!
zipCodeIs: aZipCode

	^zipCode = aZipCode! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Address class' category: 'CustomerImporter'!
Address class
	instanceVariableNames: ''!

!Address class methodsFor: 'as yet unclassified' stamp: 'FK 11/15/2023 20:39:01'!
streetName: aStreetName streetNumber: aStreetNumber town: aTown zipCode: aZipCode province: aProvince
	^self new initializeWithStreetName: aStreetName streetNumber: aStreetNumber town: aTown zipCode: aZipCode province: aProvince.! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'FK 11/14/2023 20:47:55'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'FK 11/15/2023 20:17:28'!
hasAddress: anAddress

	^addresses includes: anAddress.! !

!Customer methodsFor: 'addresses' stamp: 'FK 11/15/2023 20:24:02'!
overAddressesDo: aClosure
	addresses do: aClosure.! !


!Customer methodsFor: 'name' stamp: 'FK 11/15/2023 20:19:47'!
firstNameIs: aFirstName

	^firstName = aFirstName
! !

!Customer methodsFor: 'name' stamp: 'FK 11/15/2023 20:18:25'!
lastNameIs: aLastName

	^lastName = aLastName
! !


!Customer methodsFor: 'identification' stamp: 'FK 11/15/2023 20:14:47'!
identificationNumberIs: anIdentificationNumber

	^identificationNumber = anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'FK 11/15/2023 20:15:15'!
identificationTypeIs: anIdentificationType

	^identificationType = anIdentificationType! !


!Customer methodsFor: 'initialization' stamp: 'FK 11/15/2023 20:11:02'!
initializeWithName: aName surname: surname withIdType: idType andIdNumber: idNumber.
	super initialize.
	firstName := aName.
	lastName := surname.
	identificationType := idType.
	identificationNumber := idNumber.
	addresses := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Customer class' category: 'CustomerImporter'!
Customer class
	instanceVariableNames: ''!

!Customer class methodsFor: 'as yet unclassified' stamp: 'FK 11/15/2023 20:08:54'!
named: aFirstName  surnamed: aLastName withIdentificationType: idType andIdentificationNumber: idNumber
	^self new initializeWithName: aFirstName surname: aLastName withIdType: idType andIdNumber: idNumber.! !


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session anInputStream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'FK 11/15/2023 19:40:28'!
initializeWithDBSession: aSession andInputStream: anAnInputStream
	session := aSession.
	anInputStream := anAnInputStream.! !


!CustomerImporter methodsFor: 'parsing' stamp: 'FK 11/15/2023 20:45:50'!
addressFromCSVLine: addressData 
	| newAddress| 
	newAddress := Address
		streetName: addressData second
		streetNumber: addressData third asNumber
		town: addressData fourth
		zipCode: addressData fifth asNumber
		province: addressData sixth.
	^newAddress.! !

!CustomerImporter methodsFor: 'parsing' stamp: 'FK 11/15/2023 20:05:46'!
customerFromCSVLine: aCSVStringLineWithCustomerData
	| newCustomer |
	newCustomer := Customer 
		named: aCSVStringLineWithCustomerData second 
		surnamed: aCSVStringLineWithCustomerData third
		withIdentificationType: aCSVStringLineWithCustomerData fourth
		andIdentificationNumber: aCSVStringLineWithCustomerData fifth.
	^newCustomer.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'FK 11/15/2023 20:36:27'!
doImport
	| newCustomer line |
			
	session beginTransaction.
	
	line := anInputStream nextLine.
	[ line notNil ] whileTrue: [
		(line beginsWith: 'C') ifTrue: [ | customerData |
			(newCustomer isNil) ifFalse: [ session persist: newCustomer ].
			customerData := line findTokens: $,.
			newCustomer := self customerFromCSVLine: customerData.
			].

		(line beginsWith: 'A') ifTrue: [ | addressData newAddress |
			addressData := line findTokens: $,.
			newAddress := 			self addressFromCSVLine: addressData.
			newCustomer addAddress: newAddress.
		].

		line := anInputStream nextLine. ].
	session persist: newCustomer.
	

	anInputStream close.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'FK 11/15/2023 19:40:28'!
withDBSession: aSession andInputStream: anAnInputStream
	^self new initializeWithDBSession: aSession andInputStream: anAnInputStream! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'FK 11/14/2023 20:47:55'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'FK 11/14/2023 20:47:55'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'FK 11/14/2023 20:47:55'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'FK 11/14/2023 20:47:55'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'FK 11/14/2023 20:47:55'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'FK 11/14/2023 20:47:55'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'FK 11/15/2023 20:24:15'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses overAddressesDo: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'FK 11/14/2023 20:47:55'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'FK 11/14/2023 20:47:55'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'FK 11/14/2023 20:47:55'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'FK 11/14/2023 20:47:55'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'FK 11/14/2023 20:47:55'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'FK 11/14/2023 20:47:55'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !
