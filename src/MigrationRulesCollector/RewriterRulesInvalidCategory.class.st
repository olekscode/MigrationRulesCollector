Class {
	#name : #RewriterRulesInvalidCategory,
	#superclass : #RewriterRulesCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
RewriterRulesInvalidCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
		
	^ (RewriterRulesValidCategory fits: aRule) not.
	
]
