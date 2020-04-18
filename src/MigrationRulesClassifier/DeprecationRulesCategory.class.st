Class {
	#name : #DeprecationRulesCategory,
	#superclass : #MigrationRulesCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
DeprecationRulesCategory class >> fits: aRule [
	^ aRule isRewriterRule not
]
