Class {
	#name : #RewriterRulesOneToManyCategory,
	#superclass : #RewriterRulesValidCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesOneToManyCategory class >> fits: aRule [
	^ (RewriterRulesOneToOneCategory fits: aRule) not
]
