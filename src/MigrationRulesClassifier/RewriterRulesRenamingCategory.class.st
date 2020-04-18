Class {
	#name : #RewriterRulesRenamingCategory,
	#superclass : #RewriterRulesSameReceiverCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesRenamingCategory class >> fits: aRule [
	^ aRule antecedentTree arguments = aRule consequentTree arguments
]
