Class {
	#name : #PDDeprecation,
	#superclass : #Object,
	#instVars : [
		'method',
		'explanation',
		'date',
		'version',
		'transformationRule',
		'transformationCondition'
	],
	#category : #PharoDeprecationsCollector
}

{ #category : #comparing }
PDDeprecation >> = anotherRule [
	(self species = anotherRule species)
		ifFalse: [ ^ false ].
		
	(self method = anotherRule method)
		ifFalse: [ ^ false ].
		
	(self date = anotherRule date)
		ifFalse: [ ^ false ].
		
	(self version = anotherRule version)
		ifFalse: [ ^ false ].
		
	(self explanation = anotherRule explanation)
		ifFalse: [ ^ false ].
		
	^ true
]

{ #category : #accessing }
PDDeprecation >> date [
	^ date
]

{ #category : #accessing }
PDDeprecation >> date: anObject [
	date := anObject
]

{ #category : #accessing }
PDDeprecation >> explanation [
	^ explanation
]

{ #category : #accessing }
PDDeprecation >> explanation: anObject [
	explanation := anObject
]

{ #category : #testing }
PDDeprecation >> isTransforming [
	^ transformationRule isNotNil
]

{ #category : #accessing }
PDDeprecation >> method [
	^ method
]

{ #category : #accessing }
PDDeprecation >> method: anObject [
	method := anObject
]

{ #category : #printing }
PDDeprecation >> printOn: aStream [
	aStream 
		nextPutAll: self class name;
		nextPutAll: ' (';
		print: method;
		nextPut: $).
]

{ #category : #'ston persistence' }
PDDeprecation >> stonOn: stonWriter [
	stonWriter writeObject: (self copy
		explanation: explanation asString;
		yourself)
]

{ #category : #accessing }
PDDeprecation >> transformationCondition [
	^ transformationCondition
]

{ #category : #accessing }
PDDeprecation >> transformationCondition: anObject [
	transformationCondition := anObject
]

{ #category : #accessing }
PDDeprecation >> transformationRule [
	^ transformationRule
]

{ #category : #accessing }
PDDeprecation >> transformationRule: aRule [
	transformationRule := aRule.
]

{ #category : #accessing }
PDDeprecation >> version [
	^ version
]

{ #category : #accessing }
PDDeprecation >> version: anObject [
	version := anObject
]
