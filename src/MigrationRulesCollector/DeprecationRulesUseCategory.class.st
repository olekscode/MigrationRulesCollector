Class {
	#name : #DeprecationRulesUseCategory,
	#superclass : #DeprecationRulesCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
DeprecationRulesUseCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
		
	^ aRule explanation asLowercase includesSubstring: 'use'
]
