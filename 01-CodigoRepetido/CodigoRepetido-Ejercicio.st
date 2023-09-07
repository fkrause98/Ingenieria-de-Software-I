!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/6/2023 22:11:57'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	customerBook := CustomerBook new. 
	self test: [customerBook addCustomerNamed: 'John Lennon'.] withTimeLimitInMilliseconds: 50.

	 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/6/2023 22:38:04'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |

	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: paulMcCartney.
	
	self test: [	customerBook removeCustomerNamed: paulMcCartney.] withTimeLimitInMilliseconds: 100.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/7/2023 02:42:59'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	self invalidMessage: [customerBook addCustomerNamed: '']  
	shouldThen: [ :anError | 
			self expectError: anError toHaveMessage: CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/7/2023 02:37:50'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: johnLennon.
	self invalidMessage: [ customerBook removeCustomerNamed: 'Paul McCartney' ]
	 shouldThen: [ :anError | 
		self expectError: anError toHaveMessage: CustomerBook customerNotFound.
		self assertThat: johnLennon isTheOnlyCustomerIn: customerBook]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/7/2023 01:33:15'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: paulMcCartney .
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertThatNumberOfActivesIs: 0 andNumberOfSuspendedIs: 1 in: customerBook.
	
	self assertThat: paulMcCartney isTheOnlyCustomerIn: customerBook.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/7/2023 02:55:43'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: paulMcCartney .
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThatNumberOfActivesIs: 0 andNumberOfSuspendedIs: 0 in: customerBook.
	
	self assert: customerBook numberOfCustomers = 0.
	self deny: (customerBook isCustomer: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/7/2023 02:29:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: johnLennon.
	
	
	self invalidMessage:   [ customerBook suspendCustomerNamed: 'George Harrison'.] 
		shouldThen: [ :anError | self assertThat: johnLennon isTheOnlyCustomerIn: customerBook].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VB 9/7/2023 02:37:01'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
 	self invalidMessage: [ customerBook suspendCustomerNamed: johnLennon ]  
	shouldThen: [ :anError | 
			self expectError: anError toHaveMessage: CustomerBook cantSuspendCustomerErrorMesage .
			self assertThat: johnLennon isTheOnlyCustomerIn: customerBook].
! !


!CustomerBookTest methodsFor: 'utilities' stamp: 'VB 9/6/2023 23:36:41'!
assertThat: aName isTheOnlyCustomerIn: customerBook
	
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: aName)! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'VB 9/7/2023 01:19:38'!
assertThatNumberOfActivesIs: aNumber andNumberOfSuspendedIs: anotherNumber in: customerBook

	self assert: customerBook numberOfActiveCustomers = aNumber.
	self assert: customerBook numberOfSuspendedCustomers = anotherNumber.! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'VB 9/7/2023 02:54:36'!
expectError: error toHaveMessage: errorMessage
	self assert: error messageText  = errorMessage value.! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'VB 9/7/2023 02:29:46'!
invalidMessage: invalidMessageClosure shouldThen: shouldThenClosure
	[invalidMessageClosure value. self fail]
	on: Error
	do: shouldThenClosure .! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'VB 9/6/2023 22:00:33'!
test: aClosure withTimeLimitInMilliseconds: aTime

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aTime * millisecond).! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspendedCustomers activeCustomers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'FK 9/6/2023 00:27:36'!
includesCustomerNamed: aName

	^(self isActiveCustomer: aName) or: [ self isSuspendedCustomer: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'FK 9/6/2023 00:14:47'!
isEmpty
	
	^activeCustomers isEmpty and: [ suspendedCustomers isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'VB 9/6/2023 20:48:49'!
initialize

	activeCustomers := OrderedCollection new.
	suspendedCustomers := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 00:15:43'!
addCustomerNamed: aName

	self checkNameIsNotEmpty: aName.
	self checkNotAlreadyACustomer: aName.
	
	activeCustomers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 00:13:31'!
checkNameIsNotEmpty: aName
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 00:17:02'!
checkNotAlreadyACustomer: aName

	(self isCustomer: aName) ifTrue: [ self signalCustomerAlreadyExists ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'FK 9/6/2023 00:25:08'!
isActiveCustomer: aName

	^ activeCustomers includes: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'FK 9/6/2023 00:27:36'!
isCustomer: aName
	^(self isActiveCustomer: aName) or: [self isSuspendedCustomer: aName].! !

!CustomerBook methodsFor: 'customer management' stamp: 'FK 9/6/2023 00:27:36'!
isSuspendedCustomer: aName

	^ suspendedCustomers includes: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'FK 9/6/2023 00:14:33'!
numberOfActiveCustomers
	
	^activeCustomers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FK 9/5/2023 23:59:40'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FK 9/6/2023 00:14:47'!
numberOfSuspendedCustomers
	
	^suspendedCustomers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 00:25:13'!
remove: anElement from: aCollection ifRemoved: aClosure
	1 to: aCollection size do: 
	[ :index |
		 anElement = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				aClosure value
			] 
	].
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 02:02:08'!
removeCustomerNamed: aName 
	self remove: aName from: activeCustomers ifRemoved: [^aName].
	self remove: aName from: suspendedCustomers ifRemoved: [^aName].
	self signalCustomerNotFound .
! !

!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 02:29:02'!
signalCantSuspend 

	self error: self class cantSuspendCustomerErrorMesage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 01:54:57'!
signalCustomerNotFound

	self error: self class customerNotFound! !

!CustomerBook methodsFor: 'customer management' stamp: 'VB 9/7/2023 02:27:03'!
suspendCustomerNamed: aName 
	
	self remove: aName from: activeCustomers ifRemoved: [^suspendedCustomers add: aName].
	
	self signalCantSuspend .

	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'VB 9/7/2023 02:29:02'!
cantSuspendCustomerErrorMesage
	^'This costumer cant be suspended'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:48'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:52'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'VB 9/7/2023 01:55:48'!
customerNotFound

	^'This costumer is unknown!!'! !
