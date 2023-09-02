!classDefinition: #I category: 'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Naturales'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'Errores' stamp: 'FK 9/2/2023 15:52:43'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'Errores' stamp: 'FK 9/2/2023 16:00:58'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Numeros negativos no soportados'! !


!I class methodsFor: 'Aritmética' stamp: 'FKA 8/26/2023 20:53:05'!
* aNaturalNumber
	^aNaturalNumber! !

!I class methodsFor: 'Aritmética' stamp: 'FK 8/24/2023 21:04:08'!
+ aNaturalNumber
	^aNaturalNumber next.! !

!I class methodsFor: 'Aritmética' stamp: 'FK 9/2/2023 15:59:45'!
- aNaturalNumber
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'Aritmética' stamp: 'FK 9/2/2023 15:57:25'!
/ aNaturalNumber
	(aNaturalNumber = I) ifFalse: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^I! !

!I class methodsFor: 'Aritmética' stamp: 'FK 9/2/2023 15:39:22'!
restateA: aNaturalNumber
	^aNaturalNumber previous! !


!I class methodsFor: 'Comparación' stamp: 'FKA 8/26/2023 21:23:40'!
< aNaturalNumber
	^(aNaturalNumber = I) not! !


!I class methodsFor: 'Contiguos' stamp: 'FK 8/24/2023 21:00:31'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	^next
	 ! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !


!classDefinition: #II category: 'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'Errores' stamp: 'FK 9/2/2023 15:47:40'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'Errores' stamp: 'FK 9/2/2023 15:50:48'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Numeros negativos no soportados'! !


!II class methodsFor: 'Comparación' stamp: 'FKA 8/26/2023 21:38:35'!
< aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^self previous < aNaturalNumber previous.
	! !


!II class methodsFor: 'Aritmética' stamp: 'FKA 8/28/2023 21:41:06'!
* aNaturalNumber
	^aNaturalNumber + (aNaturalNumber * self previous).! !

!II class methodsFor: 'Aritmética' stamp: 'FK 8/24/2023 21:26:30'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!II class methodsFor: 'Aritmética' stamp: 'FK 9/2/2023 15:31:59'!
- aNaturalNumber
	^aNaturalNumber restateA: self 
! !

!II class methodsFor: 'Aritmética' stamp: 'FK 9/2/2023 15:45:40'!
/ aNaturalNumber
	(self < aNaturalNumber) ifTrue: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	self = aNaturalNumber ifTrue: [^I].
        (self - aNaturalNumber) < aNaturalNumber ifTrue: [^I].
	^I+((self - aNaturalNumber) / aNaturalNumber).! !

!II class methodsFor: 'Aritmética' stamp: 'FK 9/2/2023 15:50:05'!
restateA: aNaturalNumber
	(aNaturalNumber < self) ifTrue: [^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados].
	^aNaturalNumber previous - self previous.! !


!II class methodsFor: 'Contiguos' stamp: 'FKA 8/28/2023 21:19:16'!
next
	next ifNotNil: [^next].
	next := II createChildNamed: self name, 'I'.
	next previous: self.
	^next
	 ! !

!II class methodsFor: 'Contiguos' stamp: 'FK 8/24/2023 21:21:08'!
previous
	^previous! !

!II class methodsFor: 'Contiguos' stamp: 'FK 8/24/2023 21:24:15'!
previous: aNaturalNumber
	previous := aNaturalNumber.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Numeros Naturales'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Numeros Naturales'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Numeros Naturales'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: 'Numeros Naturales'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'Numeros Naturales'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: 'Numeros Naturales'!
II subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: 'Numeros Naturales'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: 'Numeros Naturales'!
II subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: 'Numeros Naturales'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	previous := IIIIIII.! !


!classDefinition: #IIIIIIIII category: 'Numeros Naturales'!
II subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: 'Numeros Naturales'!
IIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'FK 9/2/2023 16:12:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIIII.! !


!classDefinition: #Tests category: 'Numeros Naturales'!
DenotativeObject subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tests class' category: 'Numeros Naturales'!
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