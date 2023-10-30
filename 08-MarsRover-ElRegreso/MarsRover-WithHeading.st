!classDefinition: #MarsRoverLoggerTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:33:46'!
test01LogIsEmptyString
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForPosition.
	
	self assert: logger log equals: ''.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:34:18'!
test02LogWithPositionHasOneLineMovingNorth
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForPosition.
	marsRover process: 'f'.
	
	self assert: logger log equals: '1@2', Character newLineCharacter asString.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:34:39'!
test03LogWithPositionHasOneLineMovingSouth
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForPosition.
	marsRover process: 'b'.
	
	self assert: logger log equals: '1@0', (Character newLineCharacter asString).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:34:52'!
test04LogWithPositionHasOneLineMovingWest
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForPosition.
	marsRover process: 'lf'.
	
	self assert: logger log equals: '0@1', (Character newLineCharacter asString).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:35:06'!
test05LogWithPositionHasOneLineMovingEast
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForPosition.
	marsRover process: 'lb'.
	
	self assert: logger log equals: '2@1', (Character newLineCharacter asString).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:35:27'!
test06LogWithPositionHasTwoLinesMovingFF
	| marsRover expectedLog logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForPosition.
	marsRover process: 'ff'.
	
	expectedLog := '1@2', (Character newLineCharacter asString),
				  '1@3', (Character newLineCharacter asString).
	
	self assert: logger log equals: expectedLog.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:35:55'!
test07LogWithHeadingsHasOneLineRotatingWest
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForHeading.
	marsRover process: 'l'.
	
	self assert: logger log equals: 'West', Character newLineCharacter asString.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:36:07'!
test08LogWithHeadingsHasOneLineRotatingEast
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForHeading.
	marsRover process: 'r'.
	
	self assert: logger log equals: 'East', Character newLineCharacter asString.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:36:21'!
test09LogWithHeadingsHasOneLineRotatingNorth
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingWest.
	logger := marsRover initLoggerForHeading.
	marsRover process: 'r'.
	
	self assert: logger log equals: 'North', Character newLineCharacter asString.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:36:38'!
test10LogWithHeadingsHasOneLineRotatingSouth
	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingWest.
	logger := marsRover initLoggerForHeading.
	marsRover process: 'l'.
	
	self assert: logger log equals: 'South', Character newLineCharacter asString.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:36:54'!
test11LogWithHeadingsHasTwoLinesRotatingRL
	| marsRover expectedText logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForHeading.
	marsRover process: 'rl'.
	
	expectedText := 'East', Character newLineCharacter asString,
				   'North', Character newLineCharacter asString.
	
	self assert: logger log equals: expectedText.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:18:55'!
test12InitializeLoggerForPositionOnly
	| marsRover positionLogger expectedText |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	positionLogger := marsRover initLoggerForPosition.
	
	marsRover process: 'ff'.
	
	expectedText := '1@2', Character newLineCharacter asString,
				   '1@3', Character newLineCharacter asString.
	
	self assert: positionLogger log equals: expectedText.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:21:09'!
test13InitializeLoggerForHeadingOnly
	| marsRover headingLogger expectedText |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	headingLogger := marsRover initLoggerForHeading.
	
	marsRover process: 'rl'.
	
	expectedText := 'East', Character newLineCharacter asString,
				   'North', Character newLineCharacter asString.
	
	self assert: headingLogger log equals: expectedText.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:24:39'!
test14InitializeLoggerForPositionAndHeading
	| marsRover logger expectedText |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := marsRover initLoggerForPositionAndHeading.
	
	marsRover process: 'fr'.
	
	expectedText := '1@2', Character newLineCharacter asString,
				   'East', Character newLineCharacter asString.
	
	self assert: logger log equals: expectedText.! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRoverWindowTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:50:35'!
test01WindowForPositionOnly
	| marsRover window |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := marsRover initWindowForPosition.
	
	self assert: window text equals: 'Posición: 1@1'.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:56:16'!
test02WindowForPositionOnlyMoveFF
	| marsRover window |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := marsRover initWindowForPosition.
	marsRover process: 'ff'.
	
	self assert: window text equals: 'Posición: 1@3'.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:32:11'!
test03WindowForHeadingOnly
	| marsRover window |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := marsRover initWindowForHeading.
	
	self assert: window text equals: 'Dirección: Apuntando al Norte'.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:32:28'!
test04WindowForHeadingOnlyRotateRR
	| marsRover window |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := marsRover initWindowForHeading.
	marsRover process: 'rr'.
	
	self assert: window text equals: 'Dirección: Apuntando al Sur'.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:40:08'!
test05WindowForPositionAndHeading
	| marsRover window expectedText |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := marsRover initWindowForPositionAndHeading.
	
	expectedText := 'Posición: 1@1', Character newLineCharacter asString,
				   'Dirección: Apuntando al Norte'.
	
	self assert: window text equals: expectedText .! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:44:05'!
test06WindowForPositionAndHeadingAfterRF
	| marsRover window expectedText |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := marsRover initWindowForPositionAndHeading.
	marsRover process: 'rf'.
	
	expectedText := 'Posición: 2@1', Character newLineCharacter asString,
				   'Dirección: Apuntando al Este'.
	
	self assert: window text equals: expectedText .! !


!classDefinition: #Logger category: 'MarsRover-WithHeading'!
Object subclass: #Logger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Logger methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 17:26:51'!
initialize
	log := ''.! !

!Logger methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 19:19:41'!
log
	^log copy.! !

!Logger methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:21:19'!
notifyUpdate: aValue
	log := log, aValue asString, Character newLineCharacter asString.! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'FK 10/29/2023 19:30:25'!
initializeAt: aPosition heading: aHeadingType

	position := MarsRoverObservableVariable with: aPosition.
	head := MarsRoverObservableVariable with: (aHeadingType for: self).! !


!MarsRover methodsFor: 'heading' stamp: 'FK 10/29/2023 18:34:15'!
headEast
	
	head update: (MarsRoverHeadingEast for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'FK 10/29/2023 18:34:37'!
headNorth
	
	head update: (MarsRoverHeadingNorth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'FK 10/29/2023 18:34:52'!
headSouth
	
	head update: (MarsRoverHeadingSouth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'FK 10/29/2023 18:35:05'!
headWest
	
	head update: (MarsRoverHeadingWest for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'FK 10/29/2023 18:35:18'!
rotateLeft
	
	head value rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'FK 10/29/2023 18:35:23'!
rotateRight
	
	head value rotateRight! !


!MarsRover methodsFor: 'testing' stamp: 'FK 10/29/2023 18:36:18'!
isAt: aPosition heading: aHeadingType

	^(position value = aPosition) and: [ head value isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'FK 10/29/2023 18:36:31'!
moveBackward
	
	head value moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'FK 10/29/2023 18:38:50'!
moveEast
	
	position update: position value + (1@0).! !

!MarsRover methodsFor: 'moving' stamp: 'FK 10/29/2023 18:36:57'!
moveForward
	
	head value moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'FK 10/29/2023 18:38:57'!
moveNorth
	
	position update: position value + (0@1).! !

!MarsRover methodsFor: 'moving' stamp: 'FK 10/29/2023 18:39:03'!
moveSouth
	
	position update: position value + (0@-1).! !

!MarsRover methodsFor: 'moving' stamp: 'FK 10/29/2023 18:39:09'!
moveWest
	
	position update: position value + (-1@0).! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:12:10'!
initLoggerForHeading
	| headingLog |
	headingLog := Logger new.
	head addObserver: headingLog.
	^headingLog.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:12:10'!
initLoggerForPosition
	| positionLog |
	positionLog := Logger new.
	position addObserver: positionLog.
	^positionLog.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:12:10'!
initLoggerForPositionAndHeading
	| positionAndHeadingLog |
	positionAndHeadingLog := Logger new.
	position addObserver: positionAndHeadingLog.
	head addObserver: positionAndHeadingLog.
	^positionAndHeadingLog.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:27:33'!
initWindowForHeading
	| headingWindow |
	headingWindow := WindowForHeading with: head value.
	head addObserver: headingWindow .
	^headingWindow.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:22:56'!
initWindowForPosition
	| positionWindow |
	positionWindow := WindowForPosition with: position value.
	position addObserver: positionWindow .
	^positionWindow.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:34:12'!
initWindowForPositionAndHeading
	| window |
	window := WindowForPositionAndHeading withPosition: position value andHeading: head value.
	position addObserver: window.
	head addObserver: window.
	^window.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !


!MarsRoverHeading methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 18:47:39'!
asString

	^self subclassResponsibility.! !

!MarsRoverHeading methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:08:39'!
stringForWindow

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 18:46:20'!
asString
	^'East'.! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:07:16'!
stringForWindow
	^'Este'.! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 18:46:43'!
asString
	^'North'.! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:07:35'!
stringForWindow
	^'Norte'.! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 18:46:59'!
asString
	^'South'.! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:07:49'!
stringForWindow
	^'Sur'.! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 18:47:13'!
asString
	^'West'.! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:08:24'!
stringForWindow
	^'Oeste'.! !


!classDefinition: #MarsRoverObservableVariable category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverObservableVariable
	instanceVariableNames: 'value observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObservableVariable methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:12:50'!
addObserver: anObserver
	observers add: anObserver.! !

!MarsRoverObservableVariable methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:12:49'!
initializeWith: aValue
	value := aValue.
	observers := OrderedCollection new.! !

!MarsRoverObservableVariable methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:20:48'!
update: aNewValue
	value := aNewValue.
	observers do: [ :anObserver | anObserver notifyUpdate: aNewValue].! !

!MarsRoverObservableVariable methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 18:09:07'!
value
	^value copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverObservableVariable class' category: 'MarsRover-WithHeading'!
MarsRoverObservableVariable class
	instanceVariableNames: ''!

!MarsRoverObservableVariable class methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 18:18:42'!
with: aValue
	^self new initializeWith: aValue.! !


!classDefinition: #Window category: 'MarsRover-WithHeading'!
Object subclass: #Window
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Window methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:23:44'!
initializeWith: aValue
	value := aValue.! !

!Window methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:23:44'!
notifyUpdate: aNewValue
	value := aNewValue.! !

!Window methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:25:31'!
text
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Window class' category: 'MarsRover-WithHeading'!
Window class
	instanceVariableNames: ''!

!Window class methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 20:45:37'!
with: aValue
	^self new initializeWith: aValue.! !

!Window class methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:41:08'!
withPosition: aPosition andHeading: aHeading
	^WindowForPositionAndHeading new initializeWith: aPosition and: aHeading.! !


!classDefinition: #WindowForHeading category: 'MarsRover-WithHeading'!
Window subclass: #WindowForHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!WindowForHeading methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:32:52'!
text
	^'Dirección: Apuntando al ', value stringForWindow.
! !


!classDefinition: #WindowForPosition category: 'MarsRover-WithHeading'!
Window subclass: #WindowForPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!WindowForPosition methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:24:51'!
text
	^'Posición: ', value asString.! !


!classDefinition: #WindowForPositionAndHeading category: 'MarsRover-WithHeading'!
Window subclass: #WindowForPositionAndHeading
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!WindowForPositionAndHeading methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:37:18'!
initializeWith: aPosition and: aHeading
	position := aPosition.
	heading := aHeading.! !

!WindowForPositionAndHeading methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:46:40'!
notifyUpdate: aNewValue
	(aNewValue isKindOf: Point) 
		ifTrue: [position := aNewValue]
		ifFalse: [heading := aNewValue].! !

!WindowForPositionAndHeading methodsFor: 'as yet unclassified' stamp: 'FK 10/29/2023 21:40:00'!
text
	| windowText |
	windowText := 'Posición: ', position asString, Character newLineCharacter asString.
	windowText := windowText, 'Dirección: Apuntando al ', heading stringForWindow.
	^windowText.! !
