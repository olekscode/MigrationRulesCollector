Class {
	#name : #MigrationRulesCategory,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
MigrationRulesCategory class >> fits: aRule [
	^ true
]

{ #category : #'as yet unclassified' }
MigrationRulesCategory >> addIfFits: aRule [
	(self class fits: aRule)
		ifTrue: [ rules add: aRule ].
]

{ #category : #initialization }
MigrationRulesCategory >> initialize [ 
	super initialize.
	rules := OrderedCollection new.
]

{ #category : #accessing }
MigrationRulesCategory >> rules [ 
	^ rules
]
