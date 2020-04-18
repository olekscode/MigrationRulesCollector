Class {
	#name : #RewriterRulesArgumentsRemovedCategory,
	#superclass : #RewriterRulesSameReceiverCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesArgumentsRemovedCategory class >> fits: aRule [
	^ (aRule antecedentTree arguments asSet difference: aRule consequentTree arguments) isNotEmpty and: [
		(aRule consequentTree arguments asSet difference: aRule antecedentTree arguments) isEmpty  ]
]
