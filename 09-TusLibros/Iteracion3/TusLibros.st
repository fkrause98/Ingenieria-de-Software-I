!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:09:59'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:10:37'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:10:47'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:17:31'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: testObjectsFactory itemSellByTheStore withOccurrences: 0  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:17:31'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add:  testObjectsFactory itemNotSellByTheStore withOccurrences: 2  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:11:18'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:11:25'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'VB 11/8/2023 23:17:31'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore withOccurrences: 2.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'VB 11/8/2023 23:09:12'!
setUp
	testObjectsFactory := (StoreTestObjectsFactory new).! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'validCreditCard expiredCreditCard testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:22:59'!
setUp
	testObjectsFactory := (StoreTestObjectsFactory new).
	validCreditCard := CreditCard number: '5400112233445566' 
						   	expirationDate: (May ofYear: (Date today yearNumber + 1))
						   	owner: 'Eepy Sanchez'.
	expiredCreditCard := CreditCard number: '5400112233445566' 
							expirationDate: (May ofYear: (Date today yearNumber - 1)) 
							owner: 'Eepy Sanchez'.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:23:28'!
test01CheckOutIsNotPossibleIfEmptyCart
	| cart cashier |
	cart := testObjectsFactory createCart.
	cashier := Cashier new.
	self should: [ cashier checkOutFor: cart withCreditCard: validCreditCard ]
		raise: Error
		withMessageText: Cashier emptyCartErrorDescription.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:24:40'!
test02CheckOutIsPossibleWithCartWithOneBook
	| cart cashier |
	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	cashier := Cashier withPricesList: testObjectsFactory defaultCatalog.
	self assert: (cashier checkOutFor: cart withCreditCard: validCreditCard) = 'transaction_id'.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:25:25'!
test03CalculateProperDebitForCart
	| cart cashier |
	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore .
	cart add: testObjectsFactory itemSellByTheStore .
	cashier := Cashier withPricesList: testObjectsFactory defaultCatalog.
	self assert: (cashier calculateDebitFor: cart) = 20.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:27:07'!
test04CheckOutIsNotPossibleWithExpiredCreditCard
	| cart cashier |
	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	cart add: testObjectsFactory itemSellByTheStore.
	cashier := Cashier withPricesList: testObjectsFactory defaultCatalog.
	self should: [cashier checkOutFor: cart withCreditCard: expiredCreditCard ]
		raise: Error
		withMessageText: Cashier creditCardIsExpiredErrorDescription.! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:28:15'!
test01ExpiredCreditCardAnswersCorrectly
	| card |
	card := CreditCard number: '5400112233445566' 
					expirationDate: (May ofYear: (Date today yearNumber - 1)) 
					owner: 'Eepy Sánchez'.
	self assert: card isExpired.! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:28:57'!
test02CreditCardNumberWithLessThan16CharactersShouldNotBeValid

	self should: [CreditCard number: '54001122334455' 
						expirationDate: (May ofYear: (Date today yearNumber + 1))
						owner: 'Eepy Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardMustHave16DigitsErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:29:50'!
test03CreditCardNumberWithMoreThan16CharactersShouldNotBeValid

	self should: [CreditCard number: '540011223344556677' 
						expirationDate: (May ofYear: (Date today yearNumber + 1)) 
						owner: 'Eepy Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardMustHave16DigitsErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:30:28'!
test04CreditCardNumberWithCharactersThatIsNotADigitShouldNotBeValid

	self should: [CreditCard number: '5400112233AA5566' 
						expirationDate: (May ofYear: (Date today yearNumber + 1)) 
						owner: 'Eepy Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardMustHave16DigitsErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:30:52'!
test05CreditCardOwnerNameWithMoreThan30CharactersShouldNotBeValid

	self should: [CreditCard number: '5400112233445566' 
						expirationDate: (May ofYear: (Date today yearNumber + 1)) 
						owner: 'Eepy Tomás Benjamín Juan José Javier Sergio Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardOwnerNameMustHaveAtMost30CharactersErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:31:14'!
test06NotExpiredCreditCardAnswersCorrectly
	| card |
	card := CreditCard number: '5400112233445566' 
					expirationDate: (May ofYear: (Date today yearNumber + 1)) 
					owner: 'Eepy Sánchez'.
	self deny: card isExpired.! !


!classDefinition: #FakeMerchantProcessorTest category: 'TusLibros'!
TestCase subclass: #FakeMerchantProcessorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:31:48'!
test01CanNotDebitANonPositiveAmount
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445566' 
						expirationDate: (May ofYear: (Date today yearNumber + 1)) 
						owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self should: [ merchantProcessor debit: 0 from: creditCard ]
		raise: Error
		withMessageText: FakeMerchantProcessor canNotDebitANonPositiveAmountErrorDescription.! !

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:32:13'!
test02CanNotDebitFromAStolenCard
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445569' 
						expirationDate: (May ofYear: (Date today yearNumber + 1)) 
						owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self should: [ merchantProcessor debit: 100 from: creditCard ]
		raise: Error
		withMessageText: FakeMerchantProcessor stolenCreditCardErrorDescription.! !

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:32:51'!
test03CanNotDebitFromACardWithoutCredit
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445599' 
						expirationDate: (May ofYear: (Date today yearNumber + 1)) 
						owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self should: [ merchantProcessor debit: 100 from: creditCard ]
		raise: Error
		withMessageText: FakeMerchantProcessor creditCardWithoutCreditErrorDescription.! !

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 23:33:05'!
test04ValidCreditCardCanBuy
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445566' 
						expirationDate: (May ofYear: (Date today yearNumber + 1)) 
						owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self assert: ((merchantProcessor debit: 100 from: creditCard) = 'transaction_id').! !


!classDefinition: #InterfaceTest category: 'TusLibros'!
TestCase subclass: #InterfaceTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:37:37'!
setUp
	testObjectsFactory := (StoreTestObjectsFactory new).! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:00'!
test01CreateCartWithNonRegisteredClientIdShouldFail
	| interface clientId password |
	interface := Interface withClients: (Dictionary new) andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	clientId := 'pepito97'.
	password := 'password'.
	
	self   should: [interface createCartFor: clientId withPass: password] 
		raise: Error 
		withMessageText: (Interface invalidClientOrPasswordErrorDescription).! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:07'!
test02CreateCartWithRegisteredClientIdAndWrongPasswordShouldFail
	| interface clientId password clientPasswordDict |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := (Dictionary new).
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: (clientPasswordDict) andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	self   should: [interface createCartFor: clientId withPass: 'passwor'] 
		raise: Error 
		withMessageText: (Interface invalidClientOrPasswordErrorDescription).! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:13'!
test03CreateCartWithRegisteredClientIdAndCorrectPasswordCreatesEmptyCart
	| interface clientId password clientPasswordDict cartId |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	self shouldnt: [interface listCart: cartId] raise: Error.
	.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:18'!
test04AddToCartWithInvalidCartIdShouldFail
	| interface clientPasswordDict |
	
	clientPasswordDict := Dictionary new.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	
	self  should: [interface addToCart: 'notACartID' 
						bookIsbn: testObjectsFactory itemSellByTheStore 
						bookQuantity: 1] 
		raise: Error
		withMessageText: Interface notACartIdErrorDescription.
	.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:24'!
test05ListCartWithInvalidCartIdShouldFail
	| interface clientPasswordDict |
	
	clientPasswordDict := Dictionary new.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	
	self  should: [interface listCart: 'notACartID' ] 
		raise: Error
		withMessageText: Interface notACartIdErrorDescription.
	.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:29'!
test06ListCartWithValidCartIdListsCartISBN
	| interface clientId password clientPasswordDict cartId actualText |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory itemSellByTheStore 
			bookQuantity: 1.
	actualText := (interface listCart: cartId ).
	
	self  assert: actualText = 'validBook|1|'.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:34'!
test07ListCartWithValidCartIdListsCartISBNSeveralBooks
	| interface clientId password clientPasswordDict cartId actualText |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory itemSellByTheStore 
			bookQuantity: 1.
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory anotherItemSellByTheStore 
			bookQuantity: 3.
	actualText := (interface listCart: cartId ).
	
	self  assert: actualText = 'validBook|1|validBook2|3|'.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:39'!
test08AddToCartWithValidCartIdShouldntFail
	| interface clientId password clientPasswordDict cartId |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	
	self shouldnt: [ interface addToCart: cartId 
						bookIsbn: testObjectsFactory itemSellByTheStore 
						bookQuantity: 1. ]
		raise: Error.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:44'!
test09CheckoutFailsWithUnknownCartId
	| interface clientId password cartId clientPasswordDict |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory itemSellByTheStore 
			bookQuantity: 1.
	self should: [ 
		interface 
			checkOutCart: 'notACartId'
			withCreditCardNumber: '5400112233445566'
			expiringOn: (May ofYear: (Date today yearNumber + 1)) 
			andOwner:  'Eepy sanchez'.
		]
		raise: Error
		withMessageText: (Interface notACartIdErrorDescription).! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:14:51'!
test10CheckoutWithValidCartIdAndCreditCard
	| interface clientId password cartId clientPasswordDict |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory itemSellByTheStore 
			bookQuantity: 1.
	self assert:  ((interface 
				checkOutCart: cartId
				withCreditCardNumber: '5400112233445566'
				expiringOn: (May ofYear: (Date today yearNumber + 1)) 
				andOwner:  'Eepy sanchez')
			= 'transaction_id').! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:10:11'!
test11ExpiredCartCantAddBook
	| interface clientId password cartId clientPasswordDict |
	
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	FakeDateAndTime advance30Minutes.
	self should: [interface addToCart: cartId 
						bookIsbn: testObjectsFactory itemSellByTheStore 
						bookQuantity: 1]
		raise: Error
		withMessageText: (Interface expiredCartErrorDescription).! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:12:47'!
test12ExpiredCartCantCheckOut
	| interface clientId password cartId clientPasswordDict |
	
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	interface addToCart: cartId 
						bookIsbn: testObjectsFactory itemSellByTheStore 
						bookQuantity: 1.
	FakeDateAndTime advance30Minutes.
	self should: [interface 
				checkOutCart: cartId
				withCreditCardNumber: '5400112233445566'
				expiringOn: (May ofYear: (Date today yearNumber + 1)) 
				andOwner:  'Eepy sanchez']
		raise: Error
		withMessageText: (Interface expiredCartErrorDescription).! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:12:57'!
test13ExpiredCartCantListCart
	| interface clientId password cartId clientPasswordDict |
	
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	interface addToCart: cartId 
						bookIsbn: testObjectsFactory itemSellByTheStore 
						bookQuantity: 1.
	FakeDateAndTime advance30Minutes.
	self should: [interface listCart: cartId]
		raise: Error
		withMessageText: (Interface expiredCartErrorDescription).! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:13:08'!
test14ExpiredCartAfterTimeTravellingCanAddBook
	| interface clientId password cartId clientPasswordDict |
	
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	FakeDateAndTime advance30Minutes.
	self should: [interface addToCart: cartId 
						bookIsbn: testObjectsFactory itemSellByTheStore 
						bookQuantity: 1]
		raise: Error
		withMessageText: (Interface expiredCartErrorDescription).
	FakeDateAndTime goBack30Minutes.
	self shouldnt: [interface addToCart: cartId 
						bookIsbn: testObjectsFactory itemSellByTheStore 
						bookQuantity: 1]
		raise: Error! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:15:04'!
test15ListPurchasesWithValidClientIdAndPassword
	| interface clientId password cartId clientPasswordDict |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory itemSellByTheStore 
			bookQuantity: 1.
	interface checkOutCart: cartId
			withCreditCardNumber: '5400112233445566'
			expiringOn: (May ofYear: (Date today yearNumber + 1)) 
			andOwner:  'Eepy sanchez'.
	self assert: (interface listPurchasesOfClient: clientId withPass: password) = 'validBook|1|10'.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:15:08'!
test16ListPurchasesWithValidClientIdAndPasswordMultipleBooks
	| interface clientId password cartId clientPasswordDict |
	clientId := 'pepito97'.
	password := 'password'.
	clientPasswordDict := Dictionary new.
	clientPasswordDict add: clientId -> password.
	interface := Interface withClients: clientPasswordDict andCatalog: (testObjectsFactory defaultCatalog) andClock: FakeDateAndTime.
	cartId := interface createCartFor: clientId withPass: password.
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory anotherItemSellByTheStore 
			bookQuantity: 1.
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory itemSellByTheStore 
			bookQuantity: 3.
	interface addToCart: cartId 
			bookIsbn: testObjectsFactory anotherItemSellByTheStore 
			bookQuantity: 1.
	interface checkOutCart: cartId
			withCreditCardNumber: '5400112233445566'
			expiringOn: (May ofYear: (Date today yearNumber + 1)) 
			andOwner:  'Eepy sanchez'.
	self assert: (interface listPurchasesOfClient: clientId withPass: password) = 'validBook|3|validBook2|2|50'.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'VB 11/8/2023 23:11:42'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'FK 11/2/2023 19:24:12'!
calculateTotalPriceWith: aCashier
	
	^items inject: 0 into: [ :total :anItem | total + (aCashier priceForBook: anItem)].! !

!Cart methodsFor: 'queries' stamp: 'VB 11/9/2023 00:13:13'!
items

	^items copy.! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'VB 11/8/2023 23:14:57'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'VB 11/8/2023 23:17:31'!
add: anItem

	^ self add: anItem withOccurrences: 1 ! !

!Cart methodsFor: 'adding' stamp: 'VB 11/8/2023 23:17:31'!
add: anItem withOccurrences: aQuantity

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	items add: anItem withOccurrences: aQuantity .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'queries' stamp: 'FK 11/2/2023 19:24:13'!
calculateDebitFor: aCart
	^aCart calculateTotalPriceWith: self.! !

!Cashier methodsFor: 'queries' stamp: 'FK 11/2/2023 19:19:52'!
priceForBook: anISBN
	^priceList at: anISBN.! !


!Cashier methodsFor: 'checkOut' stamp: 'VB 11/9/2023 11:21:44'!
checkOutFor: aCart withCreditCard: aCreditCard
	
	self assertCartNotEmpty: aCart.
	self assertCreditCardNotExpired: aCreditCard.
	^merchantProcessor debit: (self calculateDebitFor: aCart) from: aCreditCard.
! !


!Cashier methodsFor: 'initialization' stamp: 'VB 11/5/2023 21:02:39'!
initializeWith: aDictionary
	priceList := aDictionary.
	merchantProcessor := FakeMerchantProcessor new.! !


!Cashier methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:20:20'!
assertCartNotEmpty: aCart
	
	(aCart isEmpty) ifTrue: [^self error: self class emptyCartErrorDescription].! !

!Cashier methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:21:06'!
assertCreditCardNotExpired: aCreditCard
	
	(aCreditCard isExpired) ifTrue: [ ^self error: self class creditCardIsExpiredErrorDescription ].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'FK 11/2/2023 19:46:21'!
creditCardIsExpiredErrorDescription
	^'Credit Card is expired'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'FK 11/2/2023 18:53:36'!
emptyCartErrorDescription
	^'Cart can not be empty to do check out'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'FK 11/2/2023 19:16:41'!
withPricesList: aDictionary
	^self new initializeWith: aDictionary.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'number expirationDate owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:46:12'!
cardNumber
	^number.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 18:38:56'!
initializeWith: ccn expirationDate: cced owner: cco
	number := ccn.
	expirationDate := cced.
	owner := cco.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 18:46:26'!
isExpired
	| ccedAsDate |
	ccedAsDate := Date newDay: 1 month: (expirationDate monthNumber) year: (expirationDate year).
	^ccedAsDate < (Date today).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 18:51:59'!
creditCardMustHave16DigitsErrorDescription
	^'Credit card number must have exactly 16 digits'.! !

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:08:44'!
creditCardOwnerNameMustHaveAtMost30CharactersErrorDescription
	^'Credit card owner name must have at most 30 characters'.! !

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:08:00'!
number: ccn expirationDate: cced owner: cco
	(ccn size = 16) ifFalse: [self error: self creditCardMustHave16DigitsErrorDescription].
	(ccn allSatisfy: [ :aChar | aChar isDigit ] ) ifFalse: [self error: self creditCardMustHave16DigitsErrorDescription].
	(cco size > 30) ifTrue: [ self error: self creditCardOwnerNameMustHaveAtMost30CharactersErrorDescription].
	^self new initializeWith: ccn expirationDate: cced owner: cco.! !


!classDefinition: #FakeDateAndTime category: 'TusLibros'!
Object subclass: #FakeDateAndTime
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FakeDateAndTime class' category: 'TusLibros'!
FakeDateAndTime class
	instanceVariableNames: 'fakeNow'!

!FakeDateAndTime class methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 02:01:05'!
advance30Minutes
	fakeNow := fakeNow + 30 minutes.! !

!FakeDateAndTime class methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 08:03:10'!
goBack30Minutes
	fakeNow := fakeNow - 30 minutes.! !

!FakeDateAndTime class methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 02:08:39'!
initializeNew
	fakeNow := (DateAndTime now).! !

!FakeDateAndTime class methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 02:06:44'!
now
	^fakeNow.! !


!classDefinition: #FakeMerchantProcessor category: 'TusLibros'!
Object subclass: #FakeMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FakeMerchantProcessor methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:26:45'!
assertAmountIsPositive: anAmount
	(anAmount strictlyPositive) ifFalse: [self error: self class canNotDebitANonPositiveAmountErrorDescription].! !

!FakeMerchantProcessor methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:30:29'!
assertCreditCard: aCreditCard hasCredit: anAmount
	(aCreditCard cardNumber = '5400112233445599') ifTrue: [self error: self class creditCardWithoutCreditErrorDescription].! !

!FakeMerchantProcessor methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:28:33'!
assertCreditCardIsNotStolen: aCreditCard
	(aCreditCard cardNumber = '5400112233445569') ifTrue: [self error: self class stolenCreditCardErrorDescription].! !


!FakeMerchantProcessor methodsFor: 'debit' stamp: 'VB 11/9/2023 11:31:18'!
debit: anAmount from: aCreditCard
	self assertAmountIsPositive: anAmount.
	self assertCreditCardIsNotStolen: aCreditCard.
	self assertCreditCard: aCreditCard hasCredit: anAmount.
	^'transaction_id'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FakeMerchantProcessor class' category: 'TusLibros'!
FakeMerchantProcessor class
	instanceVariableNames: ''!

!FakeMerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:19:42'!
canNotDebitANonPositiveAmountErrorDescription
	^'The amount to debit must be strictly positive'.! !

!FakeMerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:52:13'!
creditCardWithoutCreditErrorDescription
	^'This credit card does not have enough credit'.! !

!FakeMerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:45:52'!
stolenCreditCardErrorDescription
	^'Stolen credit card'.! !


!classDefinition: #Interface category: 'TusLibros'!
Object subclass: #Interface
	instanceVariableNames: 'clients currentCarts catalog lastCartId clientsPurchases cartsCreationTimes clientByCartId fakeClock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Interface methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:34:52'!
assertCartIdIsValidAndReturnCart: aCartId
	^currentCarts at: aCartId ifAbsent: [^self error: self class notACartIdErrorDescription].! !

!Interface methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:36:42'!
assertCartIsNotExpired: aCartId
	(self isCartExpired: aCartId)	ifTrue: [^self error: self class expiredCartErrorDescription].! !

!Interface methodsFor: 'assertions' stamp: 'VB 11/9/2023 11:44:51'!
assertClientIdAndPasswordAreValid: aClientId with: aPassword
	| password |	
	password := clients at: aClientId ifAbsent: [^self error: self class invalidClientOrPasswordErrorDescription].
	(password = aPassword) ifFalse: [^self error: self class invalidClientOrPasswordErrorDescription].! !


!Interface methodsFor: 'restInterface' stamp: 'VB 11/9/2023 11:38:46'!
addToCart: aCartId 		bookIsbn: anIsbn bookQuantity: aQuantity
	| cart |
	
	cart := self assertCartIdIsValidAndReturnCart: aCartId.
	self assertCartIsNotExpired: aCartId.
	cart add: anIsbn withOccurrences: aQuantity.! !

!Interface methodsFor: 'restInterface' stamp: 'VB 11/9/2023 11:40:28'!
checkOutCart: aCartId withCreditCardNumber: aCCN expiringOn: anExpirationDate andOwner: anOwner
	| cart creditCard cashier transactionId clientId |
	
	cart := self assertCartIdIsValidAndReturnCart: aCartId.
	self assertCartIsNotExpired: aCartId.
	creditCard := CreditCard number: aCCN expirationDate: anExpirationDate owner: anOwner.
	cashier := Cashier withPricesList: catalog.
	transactionId := cashier checkOutFor: cart withCreditCard: creditCard.
	clientId := clientByCartId at: aCartId.
	(clientsPurchases at: clientId) addAll: (cart items).
	^transactionId.! !

!Interface methodsFor: 'restInterface' stamp: 'VB 11/9/2023 11:52:52'!
createCartFor: aClientId withPass: aPasswordString
	| newCartId |	
	
	self assertClientIdAndPasswordAreValid: aClientId with: aPasswordString.
	newCartId := self newCartId.
	currentCarts add: newCartId -> (Cart acceptingItemsOf: catalog).
	clientByCartId add: newCartId -> aClientId.
	cartsCreationTimes add: newCartId -> (fakeClock now).
	^newCartId.! !

!Interface methodsFor: 'restInterface' stamp: 'VB 11/9/2023 12:00:35'!
listCart: aCartId
	| cart |
	cart := self assertCartIdIsValidAndReturnCart: aCartId.
	self assertCartIsNotExpired: aCartId.
	^self listCartAsString: cart.! !

!Interface methodsFor: 'restInterface' stamp: 'VB 11/9/2023 12:05:41'!
listPurchasesOfClient: aClientId withPass: aPasswordString
	| purchases |	
	self assertClientIdAndPasswordAreValid: aClientId with: aPasswordString.
	purchases := clientsPurchases at: aClientId.
	^self listPurchasesAsString: purchases.
	! !


!Interface methodsFor: 'initialization' stamp: 'VB 11/9/2023 11:52:52'!
initializeWith: aClientDictionary andCatalog: aCatalog andClock: aDateAndTimeClass
	clients := aClientDictionary.
	catalog := aCatalog.
	lastCartId := 0.
	clientsPurchases := (aClientDictionary keys) 
					inject: (Dictionary new) 
					into: [:purchasesDict :aKey | purchasesDict add: aKey -> (OrderedCollection new). purchasesDict].
	currentCarts := Dictionary new.
	clientByCartId := Dictionary new.
	cartsCreationTimes := Dictionary new.
	fakeClock := aDateAndTimeClass.! !


!Interface methodsFor: 'testing' stamp: 'VB 11/9/2023 11:52:52'!
isCartExpired: cartId
	^(fakeClock now - (cartsCreationTimes at: cartId)) >= (30 minutes).! !


!Interface methodsFor: 'queries' stamp: 'VB 11/9/2023 12:00:15'!
listCartAsString: aCart
	^(catalog keys) inject: '' into: [:stringList :anIsbn | ((aCart occurrencesOf: anIsbn) = 0) 
								ifFalse: [stringList, anIsbn , '|', (aCart occurrencesOf: anIsbn) asString, '|']
								ifTrue: [stringList]. 
		 					].! !

!Interface methodsFor: 'queries' stamp: 'VB 11/9/2023 12:05:13'!
listPurchasesAsString: purchasesCollection
	| purchasesString totalAmount |
	purchasesString := ''.
	totalAmount := 0.
	(catalog keys) do: [:item | | itemQuantity |
						itemQuantity := (purchasesCollection occurrencesOf: item).
						(itemQuantity = 0)
						ifFalse: [ purchasesString := purchasesString, item, '|', itemQuantity asString, '|'.
								totalAmount := totalAmount + (itemQuantity*(catalog at:item)). ].
					].
	^purchasesString, totalAmount asString.
	! !

!Interface methodsFor: 'queries' stamp: 'VB 11/9/2023 11:48:33'!
newCartId
	lastCartId := lastCartId + 1.
	^lastCartId asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Interface class' category: 'TusLibros'!
Interface class
	instanceVariableNames: ''!

!Interface class methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 02:07:37'!
expiredCartErrorDescription
	^'This cart has expired.'	! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:31:03'!
invalidClientOrPasswordErrorDescription
	^'The client id or password is not valid.'	! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:31:17'!
notACartIdErrorDescription
	^'Unknown cartId.'	! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'VB 11/9/2023 11:08:44'!
withClients: aClientDictionary andCatalog: aCatalog andClock: aDateAndTimeClass
	^self new initializeWith: aClientDictionary andCatalog: aCatalog andClock: aDateAndTimeClass.! !


!classDefinition: #StoreTestObjectsFactory category: 'TusLibros'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:35:37'!
anotherItemSellByTheStore
	
	^ 'validBook2'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:36:06'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:36:17'!
defaultCatalog
	
	| catalog |
	catalog := Dictionary new.
	catalog at: self itemSellByTheStore put: self itemSellByTheStorePrice.
	catalog 	at: self anotherItemSellByTheStore put: self itemSellByTheStorePrice.
	^catalog. ! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:36:32'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:36:39'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'VB 11/8/2023 22:36:46'!
itemSellByTheStorePrice
	
	^10! !
