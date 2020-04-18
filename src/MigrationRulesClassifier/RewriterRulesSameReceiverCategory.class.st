Class {
	#name : #RewriterRulesSameReceiverCategory,
	#superclass : #RewriterRulesOneToOneCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesSameReceiverCategory class >> fits: aRule [
	^ aRule antecedentTree receiver = aRule consequentTree receiver
]
