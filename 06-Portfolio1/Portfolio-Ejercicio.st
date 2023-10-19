!classDefinition: #PortfolioTests category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: 'portfolio1 portfolio2 portfolio3 portfolio4 portfolio5 portfolio6 portfolio7 portfolio8 portfolio9 account1 account2 account3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:22'!
setUp
	portfolio1 := (Portfolio new).
	portfolio2 := (Portfolio new).
	portfolio3 := (Portfolio new).
	portfolio4 := (Portfolio new).
	portfolio5 := (Portfolio new).
	portfolio6 := (Portfolio new).
	portfolio7 := (Portfolio new).
	portfolio8 := (Portfolio new).
	portfolio9 := (Portfolio new).
	
	account1 := (ReceptiveAccount new).
	account2 := (ReceptiveAccount new).
	account3 := (ReceptiveAccount new).! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/15/2023 23:17:43'!
test01ANewPortfolioHas0Balance
	self assert: (Portfolio new balance) = 0.! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test02BalancePortfolioWith1Account

	account1 register: (Deposit for: 10).
	portfolio1 addAccount: account1.
	self assert: (portfolio1 balance) equals: 10.
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test03BalancePortfolioWith1Porfolio
	
	account1 register: (Deposit for: 10).
	portfolio2 addAccount: account1.
	portfolio1 addPortfolio: portfolio2.
	
	self assert: (portfolio1 balance) equals: 10.! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:22'!
test04BalancePortfolioWithMultiplePorfoliosAndAccounts
	
	account1 register: (Deposit for: 25).
	account2 register: (Deposit for: 30).
	account2 register: (Withdraw for: 15).

	portfolio2 addPortfolio: portfolio3.
	portfolio2 addAccount: account2.
	portfolio2 addAccount: account3.
	portfolio1 addPortfolio: portfolio2.
	portfolio1 addAccount: account1.
	self assert: (portfolio1 balance) equals: 40.! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/18/2023 23:50:15'!
test05OnlyAccountsCanBeRegisteredWithRegisterAccount
	self
	should:  [Portfolio new addAccount: 1] 
	raise: Error 
	withMessageText: [Portfolio notAnAccountOrPortfolioErrorDescription].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/18/2023 23:50:25'!
test06OnlyPortfoliosCanBeRegisteredWithRegisterPortfolio
	self
	should:  [Portfolio new addPortfolio: 1] 
	raise: Error 
	withMessageText: [Portfolio notAnAccountOrPortfolioErrorDescription].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/16/2023 22:43:34'!
test07HasRegisteredWith0Accounts
	self deny: (Portfolio new hasRegistered: (Deposit for: 1)).! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test08HasRegisteredWith1Account
	| transaction |
	transaction := Deposit for: 1.
	account1 register: transaction.
	portfolio1 addAccount: account1.
	self assert: (portfolio1 hasRegistered: transaction).! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test09HasRegisteredWith1PortfolioThatHas1Account
	| transaction |

	transaction := Deposit for: 1.
	account1 register: transaction.
	portfolio1 addAccount: account1.
	portfolio2 addPortfolio: portfolio1.
	self assert: (portfolio2 hasRegistered: transaction).! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:22'!
test10HasRegisteredInPortfolioWithMultiplePorfoliosAndAccounts
	| transaction |

	account1 register: (Deposit for: 25).
	account2 register: (Deposit for: 30).
	transaction := (Withdraw for: 15).
	account2 register: transaction.
	portfolio2 addPortfolio: portfolio3.
	portfolio2 addAccount: account2.
	portfolio2 addAccount: account3.
	portfolio1 addPortfolio: portfolio2.
	portfolio1 addAccount: account1.
	self assert: (portfolio1 hasRegistered: transaction).! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/16/2023 23:35:17'!
test11TransactionsEmptyPortfolio
	self assert: (Portfolio new) transactions isEmpty.! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test12OneTransactionInPortfolio
	| transaction |

	transaction := Deposit for: 50.
	account1 register: transaction.
	portfolio1 addAccount: account1.
	self assert: (portfolio1 transactions) equals: (OrderedCollection with: transaction ).! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:22'!
test13OneTransactionNestedInPortfolio
	| transaction1 transaction2 transaction3 expectedTransactions |

	transaction1 := (Deposit for: 25).
	transaction2 := (Deposit for: 30).
	transaction3 := (Withdraw for: 15).
	account1 register: transaction1.
	account2 register: transaction2.
	account2 register: transaction3.
	portfolio2 addPortfolio: portfolio3.
	portfolio2 addAccount: account2.
	portfolio2 addAccount: account3.
	portfolio1 addPortfolio: portfolio2.
	portfolio1 addAccount: account1.
	expectedTransactions := OrderedCollection new.
	expectedTransactions add: transaction1.
	expectedTransactions add: transaction2.
	expectedTransactions add: transaction3.
	self assert: (portfolio1 transactions) equals: expectedTransactions.! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test14AddingRegisteredAccountToPortfolioFails

	account1 register: (Deposit for: 1).
	portfolio1 addAccount: account1.
	self   should: [portfolio1 addAccount: account1]
		raise: Error 
		withMessageText: [Portfolio errorMessageAccountIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test15AddingAccountThatIsAlreadyOnANestedPortfolioFails

	account1  register: (Deposit for: 1).
	portfolio2 addAccount: account1.
	portfolio1 addPortfolio: portfolio2.
	self   should: [portfolio1 addAccount: account1]
		raise: Error 
		withMessageText: [Portfolio errorMessageAccountIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test16AddingAccountToPortfolioWhichItsParentAlreadyHasFails

	account1 register: (Deposit for: 1).
	portfolio1 addAccount: account1.
	portfolio1 addPortfolio: portfolio2.
	self   should: [portfolio2 addAccount: account1]
		raise: Error 
		withMessageText: [Portfolio errorMessageAccountIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test17AddingAccountToPortfolioWhichItsNestedParentAlreadyHasFails

	account1 register: (Deposit for: 1).
	portfolio1 addAccount: account1.
	portfolio1 addPortfolio: portfolio2.
	portfolio2 addPortfolio: portfolio3.
	self   should: [portfolio3 addAccount: account1]
		raise: Error 
		withMessageText: [Portfolio errorMessageAccountIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:00'!
test18AddingAnAlreadyKnownPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	self   should: [portfolio1 addPortfolio: portfolio2 ]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:09'!
test19AddingAnAlreadyKnownNestedPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	portfolio2 addPortfolio: portfolio3.
	self   should: [portfolio1 addPortfolio: portfolio3]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:17'!
test20AddingAnAlreadyKnownDoublyNestedPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	portfolio2 addPortfolio: portfolio3.
	portfolio3 addPortfolio: portfolio4.
	self   should: [portfolio1 addPortfolio: portfolio4]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:00'!
test21AddingAnAlreadyKnownParentPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	self   should: [portfolio2 addPortfolio: portfolio1]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:09'!
test22AddingAnAlreadyKnownUpperParentPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	portfolio2 addPortfolio: portfolio3.
	
	self   should: [portfolio3 addPortfolio: portfolio1]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:02'!
test23AddingAPortfolioWithAlreadyKnownAccountFails

	account1 register: (Deposit for: 10).
	portfolio1 addAccount: account1.
	portfolio2 addAccount: account1.
	
	self   should: [portfolio1 addPortfolio: portfolio2]
		raise: Error 
		withMessageText: [Portfolio errorMessageAccountIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:14'!
test24AddingAPortfolioWithAlreadyKnownAccountsFails

	account1 register: (Deposit for: 10).
	account2 register: (Withdraw for: 5).
	portfolio1 addAccount: account1.
	portfolio1 addAccount: account2.
	portfolio2 addAccount: account1.
	portfolio2 addAccount: account2.
	
	self   should: [portfolio1 addPortfolio: portfolio2]
		raise: Error 
		withMessageText: [Portfolio errorMessageAccountIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:09'!
test25AddingAPortfolioWithAlreadyKnownPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	portfolio3 addPortfolio: portfolio2.
	
	self   should: [portfolio1 addPortfolio: portfolio3]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:17'!
test26AddingAPortfolioWithAlreadyKnownPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	portfolio2 addPortfolio: portfolio4.
	portfolio3 addPortfolio: portfolio4.
	
	self   should: [portfolio2 addPortfolio: portfolio3]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:06:25'!
test27AddingAPortfolioWithAlreadyKnownNestedPortfolioFails

	portfolio1 addPortfolio: portfolio2.
	portfolio2 addPortfolio: portfolio3.
	portfolio5 addPortfolio: portfolio4.
	portfolio4 addPortfolio: portfolio3.
	
	self   should: [portfolio1 addPortfolio: portfolio5]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:22'!
test28MultiplePortfolios

	account1 register: (Deposit for: 50).
	account2 register: (Withdraw for: 20).
	portfolio1 addAccount: account1.
	portfolio1 addPortfolio: portfolio2.
	portfolio2 addAccount: account2.
	portfolio2 addPortfolio: portfolio3.
	
	account3 register: (Deposit for: 35).
	portfolio4 addPortfolio: portfolio5.
	portfolio4 addPortfolio: portfolio6.
	portfolio5 addAccount: account3.
	portfolio5 addPortfolio: portfolio7.
	portfolio6 addPortfolio: portfolio8.
	portfolio8 addPortfolio: portfolio9.
	portfolio9 addAccount: account2.
	
	self   should: [portfolio1 addPortfolio: portfolio4]
		raise: Error 
		withMessageText: [Portfolio errorMessageAccountIsAlreadyRegistered ].! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'FK 10/19/2023 01:07:22'!
test29MultiplePortfolios

	account1 register: (Deposit for: 50).
	account2 register: (Withdraw for: 20).
	portfolio1 addAccount: account1.
	portfolio1 addPortfolio: portfolio2.
	portfolio2 addAccount: account2.
	portfolio2 addPortfolio: portfolio3.
	portfolio3 addPortfolio: portfolio9.
	
	account3 register: (Deposit for: 35).
	portfolio4 addPortfolio: portfolio5.
	portfolio4 addPortfolio: portfolio6.
	portfolio5 addAccount: account3.
	portfolio5 addPortfolio: portfolio7.
	portfolio6 addPortfolio: portfolio8.
	portfolio8 addPortfolio: portfolio9.
	
	self   should: [portfolio1 addPortfolio: portfolio4]
		raise: Error 
		withMessageText: [Portfolio errorMessagePortfolioIsAlreadyRegistered ].! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'testing' stamp: 'FK 10/16/2023 23:30:28'!
= anotherTransaction
	^((anotherTransaction class) = (self class)) and: [anotherTransaction value = self value].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'FK 10/19/2023 00:05:16'!
value
	^value.! !


!Deposit methodsFor: 'balance' stamp: 'FK 10/15/2023 23:07:35'!
addToBalance: aBalance
	^aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'FK 10/15/2023 23:09:06'!
addToBalance: aBalance
	^aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'portfolio management' stamp: 'FK 10/18/2023 22:08:06'!
addAccount: anAccount
	self checkIsAccount: anAccount.	
	self checkAccountIsNotAlreadyRegistered: anAccount.
	
	accounts add: anAccount.
! !

!Portfolio methodsFor: 'portfolio management' stamp: 'FK 10/19/2023 00:26:20'!
addPortfolio: aPortfolio
	self checkIsPortfolio: aPortfolio.	
	self checkPortfolioIsNotAlreadyRegistered: aPortfolio.
	
	aPortfolio verifyAllPortfoliosAndAccountsCanBeAddedTo: self.
	
	aPortfolio addToAPortfolio: self.
	portfolios add: aPortfolio.! !

!Portfolio methodsFor: 'portfolio management' stamp: 'FK 10/18/2023 22:36:28'!
balance
	^self balanceInAccounts + self balanceInPortfolios.! !

!Portfolio methodsFor: 'portfolio management' stamp: 'FK 10/18/2023 22:28:31'!
hasRegistered: aTransaction
	^(self isTransactionInAccounts: aTransaction) or: [self isTransactionInPortfolios: aTransaction].! !

!Portfolio methodsFor: 'portfolio management' stamp: 'FK 10/17/2023 22:05:27'!
transactions
	^(self transactionsInAccounts) addAll: (self transactionsInPortfolios); yourself.! !


!Portfolio methodsFor: 'initialization' stamp: 'FK 10/17/2023 23:21:13'!
initialize
	parent := nil.
	portfolios := OrderedCollection new.
	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'private - assertion' stamp: 'FK 10/18/2023 22:07:50'!
checkAccountIsNotAlreadyRegistered: anAccount
	(self accountIsInAnyPortfolio: anAccount) 
		ifTrue: [^self error: self class errorMessageAccountIsAlreadyRegistered].! !

!Portfolio methodsFor: 'private - assertion' stamp: 'FK 10/18/2023 22:07:00'!
checkIsAccount: maybeAnAccount
	(maybeAnAccount isKindOf: ReceptiveAccount)
		 ifFalse: [^self error: self class notAnAccountOrPortfolioErrorDescription].! !

!Portfolio methodsFor: 'private - assertion' stamp: 'FK 10/18/2023 21:11:45'!
checkIsPortfolio: maybeAPortfolio
	(maybeAPortfolio isKindOf: self class)
		 ifFalse: [^self error: self class notAnAccountOrPortfolioErrorDescription].! !

!Portfolio methodsFor: 'private - assertion' stamp: 'FK 10/18/2023 21:28:49'!
checkPortfolioIsNotAlreadyRegistered: aPortfolio
	(self isPortfolioAlreadyRegistered: aPortfolio)
		ifTrue: [^self error: (self class errorMessagePortfolioIsAlreadyRegistered)].! !


!Portfolio methodsFor: 'private' stamp: 'FK 10/17/2023 23:26:26'!
addToAPortfolio: anotherPortfolio
	parent := anotherPortfolio.! !

!Portfolio methodsFor: 'private' stamp: 'FK 10/17/2023 22:16:33'!
addToBalance: aBalance
	^self balance + aBalance.! !

!Portfolio methodsFor: 'private' stamp: 'FK 10/17/2023 21:56:00'!
addTransactionsTo: aTransactionCollection
	aTransactionCollection addAll: (self transactions)! !

!Portfolio methodsFor: 'private' stamp: 'FK 10/18/2023 22:35:20'!
balanceInAccounts
	^accounts inject: 0 into: [:balance :account | account addToBalance: balance].! !

!Portfolio methodsFor: 'private' stamp: 'FK 10/18/2023 22:35:58'!
balanceInPortfolios
	^portfolios inject: 0 into: [:balance :portfolio | portfolio addToBalance: balance].! !

!Portfolio methodsFor: 'private' stamp: 'FK 10/17/2023 22:02:44'!
transactionsInAccounts
	^accounts
		inject: OrderedCollection new 
		into: [ :transactions :account | account addTransactionsTo: transactions. transactions]! !

!Portfolio methodsFor: 'private' stamp: 'FK 10/17/2023 22:08:09'!
transactionsInPortfolios
	^portfolios 
		inject: OrderedCollection new
		into: [ :transactions :portfolio | portfolio addTransactionsTo: transactions. transactions].! !


!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/18/2023 22:16:52'!
accountIsInAnyPortfolio: anAccount
	 (self isTopMostPortfolio)
		 ifTrue: [^self isAccountInAnyPortfolioFromCurrentPortfolio: anAccount]
		 ifFalse: [^parent accountIsInAnyPortfolio: anAccount]! !

!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/18/2023 22:16:52'!
isAccountInAnyPortfolioFromCurrentPortfolio: anAccount
	^(accounts includes: anAccount)
		 or: [portfolios anySatisfy: [:portfolio | portfolio isAccountInAnyPortfolioFromCurrentPortfolio: anAccount]]! !

!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/18/2023 22:15:53'!
isAnyPortfolioFromCurrentPortfolio: aPortfolio
	^(self = aPortfolio) 
		or: [portfolios anySatisfy: [:portfolio | portfolio isAnyPortfolioFromCurrentPortfolio: aPortfolio]].! !

!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/18/2023 22:15:53'!
isPortfolioAlreadyRegistered: aPortfolio
	(self isTopMostPortfolio) 
		ifTrue: [^self  isAnyPortfolioFromCurrentPortfolio: aPortfolio]
		ifFalse: [^parent isPortfolioAlreadyRegistered: aPortfolio]! !

!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/18/2023 22:03:23'!
isTopMostPortfolio
	^(parent = nil).! !

!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/18/2023 22:32:48'!
isTransactionInAccounts: aTransaction
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/18/2023 22:33:22'!
isTransactionInPortfolios: aTransaction
	^portfolios anySatisfy: [ :portfolio | portfolio hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'private - testing' stamp: 'FK 10/19/2023 00:26:20'!
verifyAllPortfoliosAndAccountsCanBeAddedTo: aPortfolio
	accounts do: [ :anAccount | aPortfolio checkAccountIsNotAlreadyRegistered: anAccount ].
	portfolios do: [ :anotherPortfolio | aPortfolio checkPortfolioIsNotAlreadyRegistered: anotherPortfolio ].
	portfolios do: [ :anotherPortfolio | anotherPortfolio verifyAllPortfoliosAndAccountsCanBeAddedTo: aPortfolio ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: 'portfolios accounts'!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FK 10/17/2023 22:35:16'!
errorMessageAccountIsAlreadyRegistered
	^'This account is already registered on this portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FK 10/18/2023 01:04:28'!
errorMessagePortfolioIsAlreadyRegistered
	^'This portfolio is already registered'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FK 10/16/2023 22:26:14'!
notAnAccountOrPortfolioErrorDescription
	^'Only accounts or portfolios can be registered'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'FK 10/17/2023 22:03:27'!
addTransactionsTo: aTransactionCollection
	aTransactionCollection addAll: transactions.! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'FK 10/17/2023 22:16:07'!
addToBalance: aBalance
	^self balance + aBalance.! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'FK 10/15/2023 23:10:21'!
balance

	^transactions inject: 0 into: [ :balance :aTransaction | aTransaction addToBalance: balance].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
