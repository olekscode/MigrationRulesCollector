Class {
	#name : #RewriterRulesCascadeMessagesCategory,
	#superclass : #RewriterRulesOneToManyCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesCascadeMessagesCategory class >> fits: aRule [
	^ aRule consequentTree isCascade
]
