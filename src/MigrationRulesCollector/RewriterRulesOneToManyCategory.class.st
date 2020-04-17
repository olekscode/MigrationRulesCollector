Class {
	#name : #RewriterRulesOneToManyCategory,
	#superclass : #RewriterRulesValidCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
RewriterRulesOneToManyCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
	
	^ (RewriterRulesOneToOneCategory fits: aRule) not
]
