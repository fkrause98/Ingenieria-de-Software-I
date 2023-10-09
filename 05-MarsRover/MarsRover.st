!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:15:28'!
test01EmptyCommandDoesNothing
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := North new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: ''.
	self assert: (marsRover  isAt: startPosition  facing: startOrientation ).! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:15:57'!
test02SingleForwardCommand
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := North new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'f'.
	self assert: (marsRover isAt: 1@2  facing: startOrientation ).! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:16:11'!
test03SingleBackwardsCommand
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := North new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'b'.
	self assert: (marsRover isAt: 1@0  facing: startOrientation ).! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:16:23'!
test04SingleRotateLeftCommand
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := North new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'l'.
	self assert: (marsRover isAt: startPosition facing: West new ).! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:16:35'!
test05MultipleRotateLeftCommand
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := West new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'l'.
	self assert: (marsRover isAt: startPosition facing: South new).
	marsRover processCommands: 'l'.
	self assert: (marsRover isAt: startPosition facing: East new).
	marsRover processCommands: 'l'.
	self assert: (marsRover isAt: startPosition facing: North new).
! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:16:44'!
test06MultipleRotateRightCommand
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := West new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'r'.
	self assert: (marsRover isAt: startPosition facing: North new).
	marsRover processCommands: 'r'.
	self assert: (marsRover isAt: startPosition facing: East new).
	marsRover processCommands: 'r'.
	self assert: (marsRover isAt: startPosition facing: South new).
! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:16:51'!
test07MultipleForwardCommand
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := North new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'ff'.
	self assert: (marsRover isAt: (1@3) facing: North new).
! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:17:13'!
test08RotateAndThenForward
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := North new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'rf'.
	self assert: (marsRover isAt: (2@1) facing: East new).
! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:17:29'!
test09CommandsAfterNonValidCommandAreIgnored
	| startPosition marsRover startOrientation |
	startPosition := 1@1.
	startOrientation := North new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'rflbgflflfl'.
	self assert: (marsRover isAt: (2@0) facing: North new).
! !

!MarsRoverTests methodsFor: 'RoverTests' stamp: 'FK 10/9/2023 00:17:44'!
test10ComplexMultipleCommandSequence
	| startPosition marsRover startOrientation |
	startPosition := 0@0.
	startOrientation := East new.
	marsRover := MarsRover at: startPosition facing: startOrientation.
	marsRover processCommands: 'ffflfflfrffrfffrffbblfflf'.
	self assert: (marsRover isAt: (7@5) facing: North new).
! !


!classDefinition: #CardinalPoint category: 'MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:12:42'!
ninetyDegreesLeft
	^self subclassResponsibility.! !

!CardinalPoint methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:13:58'!
ninetyDegreesRight
	^self subclassResponsibility.! !


!CardinalPoint methodsFor: 'testing' stamp: 'FK 10/7/2023 21:08:48'!
= anotherCardinalPoint
	^(self class) = (anotherCardinalPoint class).! !


!CardinalPoint methodsFor: 'direction' stamp: 'FK 10/7/2023 22:15:08'!
cardinalDirection
	^self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'direction' stamp: 'FK 10/7/2023 22:15:08'!
cardinalDirection
	^(1@0).! !


!East methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:12:42'!
ninetyDegreesLeft
	^North new.! !

!East methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:14:10'!
ninetyDegreesRight
	^South new.! !


!classDefinition: #North category: 'MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:12:42'!
ninetyDegreesLeft
	^West new.! !

!North methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:14:46'!
ninetyDegreesRight
	^East new.! !


!North methodsFor: 'direction' stamp: 'FK 10/7/2023 22:15:08'!
cardinalDirection
	^(0@1).! !


!classDefinition: #South category: 'MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:12:42'!
ninetyDegreesLeft
	^East new.! !

!South methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:14:32'!
ninetyDegreesRight
	^West new.! !


!South methodsFor: 'direction' stamp: 'FK 10/7/2023 22:15:08'!
cardinalDirection
	^(0@-1).! !


!classDefinition: #West category: 'MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'direction' stamp: 'FK 10/7/2023 22:15:08'!
cardinalDirection
	^(-1@0).! !


!West methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:12:42'!
ninetyDegreesLeft
	^South new.! !

!West methodsFor: 'relative cardinal calculation' stamp: 'FK 10/7/2023 21:14:55'!
ninetyDegreesRight
	^North new.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'testing' stamp: 'FK 10/8/2023 23:44:09'!
isAt: aPosition facing: anOrientation
	^marsRoverState = (MarsRoverState with: aPosition and: anOrientation).! !


!MarsRover methodsFor: 'initialization' stamp: 'FK 10/8/2023 00:24:38'!
initializeAt: aPosition facing: anOrientation
	marsRoverState := MarsRoverState with: aPosition and: anOrientation.! !


!MarsRover methodsFor: 'private' stamp: 'FK 10/8/2023 23:47:55'!
executeCommands: aMarsRoverCommandCollection
	aMarsRoverCommandCollection do: [ :aCommand | 
		marsRoverState := aCommand execute: marsRoverState ifNotValid: [^self].
	].
! !

!MarsRover methodsFor: 'private' stamp: 'FK 10/8/2023 02:40:32'!
interpretCommands: aStringCommand
	^aStringCommand collect: [:aCharCommand | MarsRoverCommand fromCharCommand: aCharCommand].
! !


!MarsRover methodsFor: 'command processing' stamp: 'FK 10/8/2023 02:45:56'!
processCommands: aStringCommand
	| interpretedCommands |
	interpretedCommands  := self interpretCommands: aStringCommand.
	self executeCommands: interpretedCommands .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!


!MarsRover class methodsFor: 'as yet unclassified' stamp: 'FK 10/8/2023 00:20:55'!
at: aPosition facing: anOrientation 
	^self new initializeAt: aPosition facing: anOrientation.! !


!classDefinition: #MarsRoverCommand category: 'MarsRover'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCommand methodsFor: 'initialization' stamp: 'FK 10/8/2023 01:24:31'!
initializeWith: aCharCommand
	aCharCommand = $l ifTrue: [^RotateCounterClockwise new].
	aCharCommand = $r ifTrue: [^RotateClockwise new].
	aCharCommand = $b ifTrue: [^MoveBackwards new].
	aCharCommand = $f ifTrue: [	^MoveForward new].
	^InvalidCommand new.! !


!MarsRoverCommand methodsFor: 'execution' stamp: 'FK 10/8/2023 01:01:57'!
execute: aMarsRoverState
	^self subclassResponsibility.! !

!MarsRoverCommand methodsFor: 'execution' stamp: 'FK 10/8/2023 02:33:35'!
execute: aMarsRoverState ifNotValid: aClosure
	^self execute: aMarsRoverState .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'MarsRover'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'FK 10/8/2023 00:41:16'!
fromCharCommand: aCharCommand
	^self new initializeWith: aCharCommand.! !


!classDefinition: #InvalidCommand category: 'MarsRover'!
MarsRoverCommand subclass: #InvalidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!InvalidCommand methodsFor: 'execution' stamp: 'FK 10/8/2023 01:25:01'!
execute: aMarsRoverState! !

!InvalidCommand methodsFor: 'execution' stamp: 'FK 10/8/2023 02:33:53'!
execute: aMarsRoverState ifNotValid: aClosure
	aClosure value.! !


!classDefinition: #MoveBackwards category: 'MarsRover'!
MarsRoverCommand subclass: #MoveBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveBackwards methodsFor: 'execution' stamp: 'FK 10/8/2023 01:01:57'!
execute: aMarsRoverState
	| newState newPosition |
	newPosition := aMarsRoverState position - (aMarsRoverState orientation cardinalDirection).
	newState := MarsRoverState with: newPosition and: aMarsRoverState orientation.
	^newState.! !


!classDefinition: #MoveForward category: 'MarsRover'!
MarsRoverCommand subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveForward methodsFor: 'execution' stamp: 'FK 10/8/2023 01:01:57'!
execute: aMarsRoverState
	| newState newPosition |
	newPosition := aMarsRoverState position + (aMarsRoverState orientation cardinalDirection).
	newState := MarsRoverState with: newPosition and: aMarsRoverState orientation.
	^newState.! !


!classDefinition: #RotateClockwise category: 'MarsRover'!
MarsRoverCommand subclass: #RotateClockwise
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RotateClockwise methodsFor: 'execution' stamp: 'FK 10/8/2023 01:01:57'!
execute: aMarsRoverState
	| newState newOrientation |
	newOrientation := aMarsRoverState orientation ninetyDegreesRight.
	newState := MarsRoverState with: aMarsRoverState position and: newOrientation.
	^newState.! !


!classDefinition: #RotateCounterClockwise category: 'MarsRover'!
MarsRoverCommand subclass: #RotateCounterClockwise
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RotateCounterClockwise methodsFor: 'execution' stamp: 'FK 10/8/2023 01:01:57'!
execute: aMarsRoverState
	| newState newOrientation |
	newOrientation := aMarsRoverState orientation ninetyDegreesLeft.
	newState := MarsRoverState with: aMarsRoverState position and: newOrientation.
	^newState.! !


!classDefinition: #MarsRoverState category: 'MarsRover'!
Object subclass: #MarsRoverState
	instanceVariableNames: 'marsRoverPosition marsRoverOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverState methodsFor: 'accessing' stamp: 'FK 10/8/2023 00:53:52'!
orientation
	^marsRoverOrientation.! !

!MarsRoverState methodsFor: 'accessing' stamp: 'FK 10/8/2023 00:54:12'!
position
	^marsRoverPosition.! !


!MarsRoverState methodsFor: 'testing' stamp: 'FK 10/8/2023 23:43:52'!
= anotherMarsRoverState
	| samePosition sameOrientation |
	samePosition := marsRoverPosition = (anotherMarsRoverState position).
	sameOrientation := marsRoverOrientation = (anotherMarsRoverState orientation).	
	^ samePosition and: sameOrientation.! !


!MarsRoverState methodsFor: 'initialization' stamp: 'FK 10/8/2023 01:08:29'!
initializeWithPosition: aPosition andOrientation: anOrientation
	marsRoverPosition := aPosition.
	marsRoverOrientation := anOrientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverState class' category: 'MarsRover'!
MarsRoverState class
	instanceVariableNames: ''!

!MarsRoverState class methodsFor: 'as yet unclassified' stamp: 'FK 10/8/2023 01:08:29'!
with: aPosition and: anOrientation
	^ self new initializeWithPosition: aPosition andOrientation: anOrientation.! !
