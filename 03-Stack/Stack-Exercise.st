!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/18/2023 00:48:57'!
test01SimpleFind
	| prefix finder stack found expected|
	prefix := 'Sme'.
	stack := (OOStack new) push: 'Smeagol'.
	finder := (SentenceFinderByPrefix withPrefix: prefix andStack: stack).
	found := finder find.
	expected := OrderedCollection new.
	expected  add: 'Smeagol'.
	self assert: expected = found.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/17/2023 22:23:55'!
test02MultipleFind
	| prefix stack found expected finder|
	prefix := 'Small'.
	stack := (OOStack new).
	stack push: 'Small'.
	stack push: 'Smalltalk'.
	stack push: 'Smeagol'.
	stack push: '  Smalltalk'.
	finder := 	(SentenceFinderByPrefix withPrefix: prefix andStack: stack).
	found := finder find.
	expected := OrderedCollection new.
	expected  add: 'Small'.
	expected add: 'Smalltalk'.
	self assert: expected = found.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/17/2023 22:25:01'!
test03StackPreservesOriginalOrderAndElementsAfterFinding
	| prefix stack finder|
	prefix := 'a'.
	stack := (OOStack new).
	stack push: 'a'.
	stack push: 'ab'.
	stack push: 'abc'.
	stack push: 'abcd'.
	finder := (SentenceFinderByPrefix withPrefix: prefix andStack: stack).
	finder find.
	self assert: (stack pop) = 'abcd'.
	self assert: (stack pop) = 'abc'.
	self assert: (stack pop) = 'ab'.
	self assert: (stack pop) = 'a'.
	self assert: stack isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/17/2023 22:25:47'!
test04FindIsCaseSensitive
	| prefix stack found finder expected|
	prefix := 'Small'.
	stack := (OOStack new).
	stack push: 'small'.
	stack push: 'smalltalk'.
	stack push: 'sMaLtaLk'.
	stack push: 'Smalltalk'.
	finder := (SentenceFinderByPrefix withPrefix: prefix andStack: stack).
	found := finder find.
	expected := OrderedCollection new.
	expected add: 'Smalltalk'.
	self assert: expected = found.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/17/2023 22:27:34'!
test05EmptyPrefixRaisesAnError
	self
		should: [	SentenceFinderByPrefix withPrefix: '' andStack: OOStack new ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/18/2023 00:57:49'!
test06PrefixWithSpacesRaisesAnError

	|prefixWithSpaces|
	prefixWithSpaces := 'Prefix with spaces'.
	self
		should: [SentenceFinderByPrefix withPrefix: prefixWithSpaces andStack: OOStack new]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpacesErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/18/2023 00:51:16'!
test07FinderFindsRepeatedOccurrences
	| prefix stack found expected finder|
	prefix := 'Small'.
	stack := (OOStack new).
	expected := OrderedCollection new.
	10 timesRepeat: [expected  add: 'Smalltalk'. stack push: 'Smalltalk'].
	finder := 	(SentenceFinderByPrefix withPrefix: prefix andStack: stack).
	found := finder find.
	self assert: expected = found.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/18/2023 00:59:01'!
test08NonMatchingPrefixReturnsEmptyCollection
	| prefix stack found expected finder|
	prefix := 'Ingalls'.
	stack := (OOStack new).
	stack push: 'Dan'.
	stack push: 'Dijkstra'.
	expected := OrderedCollection new.
	finder := 	(SentenceFinderByPrefix withPrefix: prefix andStack: stack).
	found := finder find.
	self assert: expected = found.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FK 9/18/2023 01:00:28'!
test09EmptyStackReturnsEmptyCollection
	| prefix stack found expected finder|
	prefix := 'Messi'.
	stack := (OOStack new).
	expected := OrderedCollection new.
	finder := 	(SentenceFinderByPrefix withPrefix: prefix andStack: stack).
	found := finder find.
	self assert: expected = found.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackTop size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'FK 9/17/2023 19:13:26'!
isEmpty
	^size = 0.! !

!OOStack methodsFor: 'accessing' stamp: 'FK 9/17/2023 19:14:34'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'FK 9/17/2023 19:10:13'!
top
	^stackTop stored.! !


!OOStack methodsFor: 'initialization' stamp: 'FK 9/17/2023 19:12:59'!
initialize
	stackTop := StackBase new.
	size := 0.
	^self.
	! !


!OOStack methodsFor: 'modification' stamp: 'FK 9/17/2023 19:12:24'!
pop
	| elementAtTop |
	elementAtTop := stackTop stored.
	stackTop := stackTop previous.
	size := size - 1.
	^elementAtTop.! !

!OOStack methodsFor: 'modification' stamp: 'FK 9/17/2023 19:12:34'!
push: anElement
	stackTop := (StackContainer new) store: anElement withPrevious: stackTop.
	size := size + 1.
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentencesStack stringPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'FK 9/17/2023 22:13:18'!
initializeFinderWithPrefix: aStringPrefix andStack: anOOStack
	stringPrefix := aStringPrefix. 
	sentencesStack := anOOStack.
	^self.! !


!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'FK 9/18/2023 00:39:18'!
find
	| matches |
	matches := OrderedCollection new.
	self with: sentencesStack do: [ :string | self add: string to: matches if: [self hasPrefix: string] ].
	^matches.! !

!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'FK 9/18/2023 01:10:39'!
hasPrefix: aString
	^aString is: stringPrefix substringAt: 1! !


!SentenceFinderByPrefix methodsFor: 'modification' stamp: 'FK 9/18/2023 00:36:19'!
add: anObject to: aCollection if: aClosure
	(aClosure value) ifTrue: [aCollection add: anObject].! !

!SentenceFinderByPrefix methodsFor: 'modification' stamp: 'FK 9/17/2023 22:17:47'!
reverse: anOOStack into: aNewStack
	[anOOStack isEmpty] whileFalse: [ aNewStack push: (anOOStack pop)].
! !

!SentenceFinderByPrefix methodsFor: 'modification' stamp: 'FK 9/18/2023 00:28:45'!
with: aStack do: aClosure
	| reversedStack |
	reversedStack := OOStack new.
	self reverse: aStack into: reversedStack.
	[ reversedStack isEmpty ] whileFalse: [
		| stackTop |
		stackTop := (reversedStack pop).
		aClosure value: stackTop.
		aStack push: stackTop.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'FK 9/17/2023 21:33:46'!
emptyPrefixErrorDescription
	^'The search prefix cannot be empty!!'! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'FK 9/17/2023 21:39:51'!
prefixWithSpacesErrorDescription
	^'The search prefix cannot have spaces'! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'FK 9/17/2023 22:08:50'!
stackExpectedErrorDescription
	^'Expected a stack'! !


!SentenceFinderByPrefix class methodsFor: 'initialization' stamp: 'FK 9/17/2023 22:12:46'!
withPrefix: aStringPrefix andStack: anOOstack
	aStringPrefix isEmpty ifTrue: [self error: self emptyPrefixErrorDescription].
	(aStringPrefix includesSubString: ' ') ifTrue: [self error: self prefixWithSpacesErrorDescription].
	(anOOstack isKindOf: OOStack) ifFalse: [self error: self stackExpectedErrorDescription].
	^(SentenceFinderByPrefix new) initializeFinderWithPrefix: aStringPrefix andStack: anOOstack.
	! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'accessing' stamp: 'FK 9/17/2023 18:38:12'!
previous
	^self subclassResponsibility .! !

!StackElement methodsFor: 'accessing' stamp: 'FK 9/17/2023 18:38:18'!
stored
	^self subclassResponsibility .! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
StackElement subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'accessing' stamp: 'FK 9/17/2023 18:39:11'!
previous
	^self error: OOStack stackEmptyErrorDescription .! !

!StackBase methodsFor: 'accessing' stamp: 'FK 9/17/2023 18:39:06'!
stored
	^self error: OOStack stackEmptyErrorDescription .! !


!classDefinition: #StackContainer category: 'Stack-Exercise'!
StackElement subclass: #StackContainer
	instanceVariableNames: 'previous stored'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackContainer methodsFor: 'initialization' stamp: 'FK 9/17/2023 18:58:59'!
store: anElementToStore withPrevious: aStackContainer
	stored := anElementToStore. 
	previous  := aStackContainer.
	^self. ! !


!StackContainer methodsFor: 'accessing' stamp: 'FK 9/17/2023 18:39:30'!
previous
	^previous.! !

!StackContainer methodsFor: 'accessing' stamp: 'FK 9/17/2023 18:39:41'!
stored
	^stored.! !
