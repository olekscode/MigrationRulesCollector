Class {
	#name : #RewriterRulesCategory,
	#superclass : #MigrationRulesCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
RewriterRulesCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
		
	^ aRule isRewriterRule
]
