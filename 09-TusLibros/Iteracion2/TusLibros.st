!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HAW 11/2/2023 17:12:35'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: self itemSellByTheStore withOcurrences: 0  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HAW 11/2/2023 17:12:46'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add:  self itemNotSellByTheStore withOcurrences: 2  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HAW 11/2/2023 17:12:59'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore withOcurrences: 2.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'validCreditCard expiredCreditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:31:09'!
setUp
	validCreditCard := CreditCard number: '5400112233445566' 
						   expirationDate: (May ofYear: 2024) 
						   owner: 'Eepy Sanchez'.
	expiredCreditCard := CreditCard number: '5400112233445566' 
								   expirationDate: (May ofYear: 2022) 
								   owner: 'Eepy Sanchez'.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:31:09'!
test01CheckOutIsNotPossibleIfEmptyCart
	| cart cashier |
	cart := CartTest new createCart.
	cashier := Cashier new.
	self should: [ cashier checkOutFor: cart withCreditCard: validCreditCard ]
		raise: Error
		withMessageText: 'Cart can not be empty to do check out'.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 21:04:09'!
test02CheckOutIsPossibleWithCartWithOneBook
	| cart cashier dict |
	cart := CartTest new createCart.
	cart add: 'validBook'.
	dict := Dictionary new.
	dict add: 'validBook' -> 100.
	cashier := Cashier withPricesList: dict.
	self assert: (cashier checkOutFor: cart withCreditCard: validCreditCard) = 'transaction_id'.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'FK 11/2/2023 19:15:39'!
test03CalculateProperDebitForCart
	| cart cashier dict |
	cart := CartTest new createCart.
	cart add: 'validBook'.
	cart add: 'validBook'.
	dict := Dictionary new.
	dict add: 'validBook' -> 100.
	cashier := Cashier withPricesList: dict.
	self assert: (cashier calculateDebitFor: cart) = 200.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:30:32'!
test04CheckOutIsNotPossibleWithExpiredCreditCard
	| cart cashier dict |
	cart := CartTest new createCart.
	cart add: 'validBook'.
	cart add: 'validBook'.
	dict := Dictionary new.
	dict add: 'validBook' -> 100.
	cashier := Cashier withPricesList: dict.
	self should: [cashier checkOutFor: cart withCreditCard: expiredCreditCard ]
		raise: Error
		withMessageText: 'Credit Card is expired'.! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 18:54:01'!
test01ExpiredCreditCardAnswersCorrectly
	| card |
	card := CreditCard number: '5400112233445566' expirationDate: (May ofYear: 2022) owner: 'Eepy Sánchez'.
	self assert: card isExpired.! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:03:37'!
test02CreditCardNumberWithLessThan16CharactersShouldNotBeValid

	self should: [CreditCard number: '54001122334455' expirationDate: (May ofYear: 2024) owner: 'Eepy Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardMustHave16DigitsErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:03:54'!
test03CreditCardNumberWithMoreThan16CharactersShouldNotBeValid

	self should: [CreditCard number: '540011223344556677' expirationDate: (May ofYear: 2024) owner: 'Eepy Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardMustHave16DigitsErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:04:02'!
test04CreditCardNumberWithCharactersThatIsNotADigitShouldNotBeValid

	self should: [CreditCard number: '5400112233AA5566' expirationDate: (May ofYear: 2024) owner: 'Eepy Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardMustHave16DigitsErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:07:04'!
test05CreditCardOwnerNameWithMoreThan30CharactersShouldNotBeValid

	self should: [CreditCard number: '5400112233445566' 
						expirationDate: (May ofYear: 2024) 
						owner: 'Eepy Tomás Benjamín Juan José Javier Sergio Sánchez'.]
		raise: Error
		withMessageText: (CreditCard creditCardOwnerNameMustHaveAtMost30CharactersErrorDescription).! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 19:12:27'!
test06NotExpiredCreditCardAnswersCorrectly
	| card |
	card := CreditCard number: '5400112233445566' expirationDate: (May ofYear: 2099) owner: 'Eepy Sánchez'.
	self deny: card isExpired.! !


!classDefinition: #FakeMerchantProcessorTest category: 'TusLibros'!
TestCase subclass: #FakeMerchantProcessorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:16:42'!
test01CanNotDebitANonPositiveAmount
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445566' expirationDate: (May ofYear: 2025) owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self should: [ merchantProcessor debit: 0 from: creditCard ]
		raise: Error
		withMessageText: FakeMerchantProcessor canNotDebitANonPositiveAmountErrorDescription.! !

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:42:45'!
test02CanNotDebitFromAStolenCard
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445569' expirationDate: (May ofYear: 2025) owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self should: [ merchantProcessor debit: 100 from: creditCard ]
		raise: Error
		withMessageText: FakeMerchantProcessor stolenCreditCardErrorDescription.! !

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:50:27'!
test03CanNotDebitFromACardWithoutCredit
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445599' expirationDate: (May ofYear: 2025) owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self should: [ merchantProcessor debit: 100 from: creditCard ]
		raise: Error
		withMessageText: FakeMerchantProcessor creditCardWithoutCreditErrorDescription.! !

!FakeMerchantProcessorTest methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:58:09'!
test04ValidCreditCardCanBuy
	| creditCard merchantProcessor |
	creditCard := CreditCard number: '5400112233445566' expirationDate: (May ofYear: 2025) owner: 'Eepy Sánchez'.
	merchantProcessor := FakeMerchantProcessor new.
	self assert: ((merchantProcessor debit: 100 from: creditCard) = 'transaction_id').! !


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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

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

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HAW 11/2/2023 17:13:30'!
add: anItem

	^ self add: anItem withOcurrences: 1 ! !

!Cart methodsFor: 'adding' stamp: 'HAW 11/2/2023 17:13:19'!
add: anItem withOcurrences: aQuantity

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

!Cashier methodsFor: 'as yet unclassified' stamp: 'FK 11/2/2023 19:24:13'!
calculateDebitFor: aCart
	^aCart calculateTotalPriceWith: self.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 21:03:31'!
checkOutFor: aCart withCreditCard: aCreditCard
	
	(aCart isEmpty) ifTrue: [^self error: self class emptyCartErrorDescription].
	(aCreditCard isExpired) ifTrue: [ ^self error: self class creditCardIsExpiredErrorDescription ].
	^merchantProcessor debit: (self calculateDebitFor: aCart) from: aCreditCard.
! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 21:02:39'!
initializeWith: aDictionary
	priceList := aDictionary.
	merchantProcessor := FakeMerchantProcessor new.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'FK 11/2/2023 19:19:52'!
priceForBook: anISBN
	^priceList at: anISBN.! !

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


!classDefinition: #FakeMerchantProcessor category: 'TusLibros'!
Object subclass: #FakeMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FakeMerchantProcessor methodsFor: 'as yet unclassified' stamp: 'VB 11/5/2023 20:54:53'!
debit: anAmount from: aCreditCard
	(anAmount strictlyPositive) ifFalse: [self error: self class canNotDebitANonPositiveAmountErrorDescription].
	(aCreditCard cardNumber = '5400112233445569') 
					ifTrue: [self error: self class stolenCreditCardErrorDescription].
	(aCreditCard cardNumber = '5400112233445599') 
					ifTrue: [self error: self class creditCardWithoutCreditErrorDescription].
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
