Class {
	#name : #MigrationRulesInvalidCategory,
	#superclass : #MigrationRulesCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
MigrationRulesInvalidCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
		
	^ (MigrationRulesValidCategory fits: aRule) not.
	
]
