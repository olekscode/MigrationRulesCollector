Class {
	#name : #DeprecationRulesUseCategory,
	#superclass : #DeprecationRulesCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
DeprecationRulesUseCategory class >> fits: aRule [		
	^ aRule explanation asLowercase includesSubstring: 'use'
]
