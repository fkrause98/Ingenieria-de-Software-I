!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:32:56'!
test01CreatedCartIsEmpty
	| cart clientId password |
	password := 'contrasenia'.
	clientId := 1234567.
	cart :=  Cart forClient: clientId withPassword: password.
	self assert: cart isEmpty.
	! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:40:03'!
test02CartWithOneItem
	| cart clientId password isbn |
	password := 'contrasenia'.
	clientId := 1234567.
	isbn := '026204630X'.
	cart := Cart forClient: clientId withPassword: password.
	cart addBook: isbn quantity: 1.
	self deny: cart isEmpty.
	self assert: (cart hasBook: isbn times: 1).
	! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:34:46'!
test03CartWithOneItemManyTimes
	| cart clientId password isbn |
	password := 'contrasenia'.
	clientId := 1234567.
	isbn := '026204630X'.
	cart := Cart forClient: clientId withPassword: password.
	cart addBook: isbn quantity: 3.
	self assert: (cart hasBook: isbn times: 3).
	! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:45:56'!
test04CartCantAddBookIfAmountIsBelowOne
	| cart clientId password isbn |
	password := 'contrasenia'.
	clientId := 1234567.
	isbn := '026204630X'.
	cart := Cart forClient: clientId withPassword: password.
	self should: [cart addBook: isbn quantity: -1]
		raise: Error
		withMessageText: 'Book quantity must be 1 or more.'.
	! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 22:16:37'!
test05CartListing
	| cart clientId password isbn1 isbn2 expectedText actualText|
	password := 'contrasenia'.
	clientId := 1234567.
	isbn1 := '026204630X'.
	isbn2 := '026204631X'.
	cart := Cart forClient: clientId withPassword: password.
	cart addBook: isbn1 quantity: 1.
	cart addBook: isbn2 quantity: 2.
	expectedText := isbn2, ' | ', '2', ' | ',
				   isbn1, ' | ', '1', ' | '.
	actualText := cart listCart.
	self assert: actualText = expectedText.
	! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: 'creditCardNumber expirationDate owner amount creditCardChecker'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 22:42:09'!
test01CreditCardNumberCannotBeEmpty
	| aCreditCardNumber expiration anOwner anAmount|
	aCreditCardNumber := ''.
	expiration := 122044.
	anOwner := 'Pepe Sanchez'.
	anAmount := '12.13'.
	creditCardChecker := 
	 	CreditCardChecker 
			withCCNumber: aCreditCardNumber 
			expirationDate: expiration
			owner: anOwner
			andAmount: anAmount.
	self 
		should: [creditCardChecker check]
		raise: Error
		withMessageText: 'Credit Card Number is not valid'.! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 22:42:17'!
test02ExpiredCreditCardDoesNotPassCheck
	| aCreditCardNumber expiration anOwner anAmount|
	aCreditCardNumber := '5400000000000001'.
	expiration := 121998.
	anOwner := 'Pepe Sanchez'.
	anAmount := '12.13'.
	creditCardChecker := 
	 	CreditCardChecker 
			withCCNumber: aCreditCardNumber 
			expirationDate: expiration
			owner: anOwner
			andAmount: anAmount.
	self 
		should: [creditCardChecker check]
		raise: Error
		withMessageText: 'Credit Card is expired'.! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:02:28'!
test03CreditCardOwnerNameWithMoreThan30CharacterDoesNotPassCheck
	| aCreditCardNumber expiration anOwner anAmount|
	aCreditCardNumber := '5400000000000001'.
	expiration := 122024.
	anOwner := 'Adolph Blaine Charles David Earl Frederick Gerald Hubert Irvin John Kenneth Lloyd Martin Nero Oliver Paul Quincy 
				Randolph Sherman Thomas Uncas Victor William Xerxes Yancy Zeus Apollo 
				Wolfe­schlegelstein­hausenberger­dorffvoraltern­waren­gewissenhaft­schaferswessen­schafewaren­wohlgepflege­und­sorgfaltigkeit­beschutzen­von­angreifen­durch­ihrraubgierigfeinde­welche­voraltern­zwolftausend­jahres­vorandieerscheinen­wander­ersteer­dem­enschderraumschiff­gebrauchlicht­als­sein­ursprung­von­kraftgestart­sein­lange­fahrt­hinzwischen­sternartigraum­auf­der­suchenach­diestern­welche­gehabt­bewohnbar­planeten­kreise­drehen­sich­und­wohin­der­neurasse­von­verstandigmen­schlichkeit­konnte­fortplanzen­und­sicher­freuen­anlebens­langlich­freude­und­ruhe­mit­nicht­ein­furcht­vor­angreifen­von­anderer­intelligent­geschopfs­von­hinzwischen­sternartigraum'.
	anAmount := '12.13'.
	creditCardChecker := 
	 	CreditCardChecker 
			withCCNumber: aCreditCardNumber 
			expirationDate: expiration
			owner: anOwner
			andAmount: anAmount.
	self 
		should: [creditCardChecker check]
		raise: Error
		withMessageText: 'Owner name is longer than 30 characters'.! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:29:54'!
test04TransactionAmountLargerThan18CharacterDoesNotPassCheck
	| aCreditCardNumber expiration anOwner anAmount|
	aCreditCardNumber := '5400000000000001'.
	expiration := 122024.
	anOwner := 'Pepe Sanchez'.
	anAmount := '123456789123456789.13'.
	creditCardChecker := 
	 	CreditCardChecker 
			withCCNumber: aCreditCardNumber 
			expirationDate: expiration
			owner: anOwner
			andAmount: anAmount.
	self 
		should: [creditCardChecker check]
		raise: Error
		withMessageText: 'Transaction Amount must be at most 15 digits followed by a dot and 2 digits'.! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:35:27'!
test05TransactionAmountWithCharactersDoesNotPassCheck
	| aCreditCardNumber expiration anOwner anAmount|
	aCreditCardNumber := '5400000000000001'.
	expiration := 122024.
	anOwner := 'Pepe Sanchez'.
	anAmount := '123c123.1d'.
	creditCardChecker := 
	 	CreditCardChecker 
			withCCNumber: aCreditCardNumber 
			expirationDate: expiration
			owner: anOwner
			andAmount: anAmount.
	self 
		should: [creditCardChecker check]
		raise: Error
		withMessageText: 'Transaction Amount must be at most 15 digits followed by a dot and 2 digits'.! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:51:59'!
test06ValidCreditCardPassesCheck
	| aCreditCardNumber expiration anOwner anAmount|
	aCreditCardNumber := '5400000000000001'.
	expiration := 122024.
	anOwner := 'Pepe Sanchez'.
	anAmount := '123123.10'.
	creditCardChecker := 
	 	CreditCardChecker 
			withCCNumber: aCreditCardNumber 
			expirationDate: expiration
			owner: anOwner
			andAmount: anAmount.
	self assert: creditCardChecker check.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'cartId cartElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 22:09:47'!
addBook: isbn quantity: aNumber
	(aNumber < 1) ifTrue: [^self error: self class bookToAddHasQuantityBelowOneErrorDescription ].
	cartElements add: isbn->aNumber.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 22:10:04'!
hasBook: isbn times: aNumber
	^aNumber = (cartElements at: isbn).! !

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 22:08:36'!
initializeWithClientId: aClientId
	cartId := aClientId.
	cartElements := Dictionary new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 19:50:18'!
isEmpty
	^cartElements isEmpty.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 22:16:05'!
listCart
	| cartBooks |
	cartBooks := cartElements keys.
	^cartBooks inject: '' into: [ :cartList :cartBook | 
		cartList, cartBook, ' | ', (cartElements at: cartBook) asString, ' | ' ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: 'lastId carts'!

!Cart class methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:48:50'!
bookToAddHasQuantityBelowOneErrorDescription
	^'Book quantity must be 1 or more.'.! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:15:00'!
forClient: aClientId withPassword: aString
	^self new initializeWithClientId: aClientId.! !


!classDefinition: #CreditCardChecker category: 'TusLibros'!
Object subclass: #CreditCardChecker
	instanceVariableNames: 'creditCardNumber expirationDate owner amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardChecker methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:45:20'!
amountHasWrongFormat
	| dotIx integerPart decimalPart |
	
	dotIx := amount indexOf: $. startingAt: 1 ifAbsent: [^true].
	
	integerPart := amount copyFrom: 1 to: (dotIx-1).
	decimalPart := amount copyFrom: (dotIx+1) to: (amount size).
	
	^(integerPart size > 15) or: (decimalPart size > 2) 
	or: (integerPart anySatisfy: [ :i | i isDigit not ]) or: (decimalPart anySatisfy: [ :i | i isDigit not ]).
	! !

!CreditCardChecker methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:52:17'!
check
	(creditCardNumber isEmpty) ifTrue: [^self error: (self class errorMessageCreditCardNumberIsEmpty)].
	(self isExpired) ifTrue: [^self error: self class errorMessageCreditCardIsExpired].
	(owner size > 30) ifTrue: [^self error: self class errorMessageOwnerNameIsTooLong].
	(self amountHasWrongFormat) ifTrue: [^self error: self class errorMessageTransactionAmountWrongFormat].
	^true.! !

!CreditCardChecker methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 22:57:30'!
initializeWithCCNumber: aCreditCardNumber expiration: expiration owner: anOwner amount: anAmount.
	creditCardNumber := aCreditCardNumber.
	expirationDate  := expiration.
	owner := anOwner. 
	amount := anAmount.! !

!CreditCardChecker methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 22:56:12'!
isExpired
	| expirationDateAsFGD todayDate |

	expirationDateAsFGD := (FixedGregorianDate yearNumber: (expirationDate mod: 10000) 
										    monthNumber: (expirationDate // 10000) 
										    dayNumber: 1).
	todayDate := (FixedGregorianDate today).
	^expirationDateAsFGD < todayDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCardChecker class' category: 'TusLibros'!
CreditCardChecker class
	instanceVariableNames: ''!

!CreditCardChecker class methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 21:49:19'!
errorMessageCreditCardIsExpired
	^'Credit Card is expired'! !

!CreditCardChecker class methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 23:09:02'!
errorMessageCreditCardNumberIsEmpty
	^'Credit Card Number is not valid'! !

!CreditCardChecker class methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:04:22'!
errorMessageOwnerNameIsTooLong
	^'Owner name is longer than 30 characters'.! !

!CreditCardChecker class methodsFor: 'as yet unclassified' stamp: 'FK 11/1/2023 23:13:22'!
errorMessageTransactionAmountWrongFormat
	^'Transaction Amount must be at most 15 digits followed by a dot and 2 digits'! !

!CreditCardChecker class methodsFor: 'as yet unclassified' stamp: 'FK 10/31/2023 23:05:51'!
withCCNumber: aCreditCardNumber expirationDate: expiration owner: anOwner andAmount: anAmount
	^self new 
		initializeWithCCNumber: aCreditCardNumber
		expiration: expiration
		owner: anOwner 
		amount: anAmount.! !
