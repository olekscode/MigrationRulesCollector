Class {
	#name : #DeprecationRulesCategory,
	#superclass : #MigrationRulesCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
DeprecationRulesCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
		
	^ aRule isRewriterRule not
]
