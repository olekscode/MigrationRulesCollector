Class {
	#name : #DeprecationRulesUseInsteadCategory,
	#superclass : #DeprecationRulesUseCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
DeprecationRulesUseInsteadCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
		
	^ aRule explanation asLowercase includesSubstring: 'instead'
]
