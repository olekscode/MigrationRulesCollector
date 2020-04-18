Class {
	#name : #DeprecationRulesUseInsteadCategory,
	#superclass : #DeprecationRulesUseCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
DeprecationRulesUseInsteadCategory class >> fits: aRule [
	^ aRule explanation asLowercase includesSubstring: 'instead'
]
