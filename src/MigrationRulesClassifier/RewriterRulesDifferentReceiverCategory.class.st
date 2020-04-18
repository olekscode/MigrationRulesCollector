Class {
	#name : #RewriterRulesDifferentReceiverCategory,
	#superclass : #RewriterRulesOneToOneCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesDifferentReceiverCategory class >> fits: aRule [
	^ (RewriterRulesSameReceiverCategory fits: aRule) not
]
