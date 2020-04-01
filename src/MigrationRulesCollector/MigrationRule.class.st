Class {
	#name : #MigrationRule,
	#superclass : #Object,
	#instVars : [
		'antecedent',
		'consequent',
		'method'
	],
	#category : #MigrationRulesCollector
}

{ #category : #comparing }
MigrationRule >> = anotherRule [
	(self species = anotherRule species)
		ifFalse: [ ^ false ].

	((self antecedent = anotherRule antecedent) and: (self consequent = anotherRule consequent))
		ifFalse: [ ^ false ].
		
	(self method = anotherRule method)
		ifFalse: [ ^ false ].
		
	^ true
]

{ #category : #accessing }
MigrationRule >> antecedent [
	^ antecedent
]

{ #category : #accessing }
MigrationRule >> antecedent: anObject [
	antecedent := anObject
]

{ #category : #accessing }
MigrationRule >> consequent [
	^ consequent
]

{ #category : #accessing }
MigrationRule >> consequent: anObject [
	consequent := anObject
]

{ #category : #accessing }
MigrationRule >> method [
	^ method
]

{ #category : #accessing }
MigrationRule >> method: anObject [
	method := anObject
]
