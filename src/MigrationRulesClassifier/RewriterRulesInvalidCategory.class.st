Class {
	#name : #RewriterRulesInvalidCategory,
	#superclass : #RewriterRulesCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesInvalidCategory class >> fits: aRule [
	^ (RewriterRulesValidCategory fits: aRule) not.
	
]
