!classDefinition: #I category: 'Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Peano'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 20:53:05'!
* aNaturalNumber
	^aNaturalNumber! !

!I class methodsFor: 'as yet unclassified' stamp: 'FK 8/24/2023 21:04:08'!
+ aNaturalNumber
	^aNaturalNumber next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:54:51'!
/ aNaturalNumber
	^I! !

!I class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 21:23:40'!
< aNaturalNumber
	^(aNaturalNumber = I) not! !

!I class methodsFor: 'as yet unclassified' stamp: 'FK 8/24/2023 21:00:31'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	^next
	 ! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !


!classDefinition: #II category: 'Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 21:38:22'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!II class methodsFor: 'as yet unclassified' stamp: 'FK 8/24/2023 21:26:30'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'FK 8/24/2023 21:49:17'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!II class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 21:54:50'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!II class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 21:38:35'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'FK 8/24/2023 21:19:45'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!II class methodsFor: 'as yet unclassified' stamp: 'FK 8/24/2023 21:21:08'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'FK 8/24/2023 21:24:15'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Peano'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!III class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Peano'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIII class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Peano'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Peano'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
previous
	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: 'Peano'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'Peano'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:13:59'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous
	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: 'Peano'!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: 'Peano'!
IIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous
	^previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: 'Peano'!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: 'Peano'!
IIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous
	^previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	previous := IIIIIII.! !


!classDefinition: #IIIIIIIII category: 'Peano'!
DenotativeObject subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: 'Peano'!
IIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous
	^previous! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIII.
	previous := IIIIIIII.! !


!classDefinition: #IIIIIIIIII category: 'Peano'!
DenotativeObject subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIII class' category: 'Peano'!
IIIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
* aNaturalNumber
	aNaturalNumber = I ifTrue: [^self].
	^self + (self *(aNaturalNumber previous)).! !

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
- aNaturalNumber
	aNaturalNumber = I ifTrue: [^self previous.].
	^self previous - aNaturalNumber previous.
! !

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
/ aNaturalNumber
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous
	^previous! !

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FKA 8/26/2023 22:14:00'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!IIIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FKA 8/26/2023 23:07:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIIIII.! !


!classDefinition: #Tests category: 'Peano'!
DenotativeObject subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tests class' category: 'Peano'!
Tests class
	instanceVariableNames: ''!

!Tests class methodsFor: 'Tests de Next y Previous' stamp: 'FKA 8/26/2023 23:03:10'!
test14NextDeUno
	Assert that: I next isEqualTo: II! !

!Tests class methodsFor: 'Tests de Next y Previous' stamp: 'FKA 8/26/2023 23:03:29'!
test15NextDeCinco
	Assert that: IIIII next isEqualTo: IIIIII! !

!Tests class methodsFor: 'Tests de Next y Previous' stamp: 'FKA 8/26/2023 23:03:53'!
test16PreviousDeDos
	Assert that: II previous isEqualTo: I! !

!Tests class methodsFor: 'Tests de Next y Previous' stamp: 'FKA 8/26/2023 23:04:38'!
test17PreviousDeCuatro
	Assert that: IIII previous isEqualTo: III! !


!Tests class methodsFor: 'Tests de Suma' stamp: 'FKA 8/26/2023 22:11:15'!
test01SumaSimple
	Assert that: II isEqualTo: I+I ! !

!Tests class methodsFor: 'Tests de Suma' stamp: 'FKA 8/26/2023 22:14:59'!
test02SumaCompuesta
	Assert that: IIIII isEqualTo: III+II! !


!Tests class methodsFor: 'Tests de Resta' stamp: 'FKA 8/26/2023 22:15:50'!
test03RestaSimple
	Assert that: IIII isEqualTo: IIIII-I! !

!Tests class methodsFor: 'Tests de Resta' stamp: 'FKA 8/26/2023 22:47:58'!
test04RestaCompuesta
	Assert that: I isEqualTo: III-II! !


!Tests class methodsFor: 'Tests de Multiplicacion' stamp: 'FKA 8/26/2023 22:49:20'!
test05MultiplicacionPorUno
	Assert that: IIII * I isEqualTo: IIII! !

!Tests class methodsFor: 'Tests de Multiplicacion' stamp: 'FKA 8/26/2023 22:49:51'!
test06MultiplicacionSimple
	Assert that: III * II isEqualTo: IIIIII! !


!Tests class methodsFor: 'Tests de Division' stamp: 'FKA 8/26/2023 22:50:16'!
test07DivisionPorUno
	Assert that: III / I isEqualTo: III! !

!Tests class methodsFor: 'Tests de Division' stamp: 'FKA 8/26/2023 22:57:39'!
test08DivisionConRestoUno
	Assert that: IIIIII / IIIII isEqualTo: I! !

!Tests class methodsFor: 'Tests de Division' stamp: 'FKA 8/26/2023 23:01:14'!
test09DivisionSinResto
	Assert that: IIIIIIII / IIII isEqualTo: II! !

!Tests class methodsFor: 'Tests de Division' stamp: 'FKA 8/26/2023 23:01:27'!
test10DivisionConResto
	Assert that: IIIIIIIII / IIII isEqualTo: II! !


!Tests class methodsFor: 'Tests de Desigualdad' stamp: 'FKA 8/26/2023 23:00:56'!
test11ComparacionFalsa
	Assert that: IIIIIII < IIII isEqualTo: false! !

!Tests class methodsFor: 'Tests de Desigualdad' stamp: 'FKA 8/26/2023 23:00:36'!
test12ComparacionConIgualdad
	Assert that: IIII < IIII isEqualTo: false! !

!Tests class methodsFor: 'Tests de Desigualdad' stamp: 'FKA 8/26/2023 23:00:10'!
test13ComparacionVerdadera
	Assert that: II < IIII isEqualTo: true! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!
IIIIIIIIII initializeAfterFileIn!