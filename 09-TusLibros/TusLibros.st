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


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'cartId cartElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:51:32'!
addBook: isbn quantity: aNumber
	(aNumber < 1) ifTrue: [^self error: self class bookToAddHasQuantityBelowOneErrorDescription ].
	aNumber timesRepeat: [cartElements add: isbn].! !

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:39:26'!
hasBook: isbn times: aNumber
	^aNumber = (cartElements occurrencesOf: isbn).! !

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 20:15:33'!
initializeWithClientId: aClientId
	cartId := aClientId.
	cartElements := OrderedCollection new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'FK 10/30/2023 19:50:18'!
isEmpty
	^cartElements isEmpty.! !

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
