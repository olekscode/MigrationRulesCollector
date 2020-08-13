Class {
	#name : #DeprecationRule,
	#superclass : #Object,
	#instVars : [
		'method',
		'explanation',
		'date',
		'version'
	],
	#category : #PharoDeprecationsCollector
}

{ #category : #comparing }
DeprecationRule >> = anotherRule [
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
DeprecationRule >> date [
	^ date
]

{ #category : #accessing }
DeprecationRule >> date: anObject [
	date := anObject
]

{ #category : #accessing }
DeprecationRule >> explanation [
	^ explanation
]

{ #category : #accessing }
DeprecationRule >> explanation: anObject [
	explanation := anObject
]

{ #category : #testing }
DeprecationRule >> isRewriterRule [
	^ false
]

{ #category : #accessing }
DeprecationRule >> method [
	^ method
]

{ #category : #accessing }
DeprecationRule >> method: anObject [
	method := anObject
]

{ #category : #printing }
DeprecationRule >> printOn: aStream [
	aStream 
		nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: explanation;
		nextPut: $).
]

{ #category : #accessing }
DeprecationRule >> version [
	^ version
]

{ #category : #accessing }
DeprecationRule >> version: anObject [
	version := anObject
]