Class {
	#name : #RewriterRulesCategory,
	#superclass : #MigrationRulesCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesCategory class >> fits: aRule [
	^ aRule isRewriterRule
]
