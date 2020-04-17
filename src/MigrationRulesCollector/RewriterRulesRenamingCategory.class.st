Class {
	#name : #RewriterRulesRenamingCategory,
	#superclass : #RewriterRulesOneToOneCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
RewriterRulesRenamingCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
		
	"Antecedent and consequent must have the same receiver"
	(aRule antecedentTree receiver = aRule consequentTree receiver)
		ifFalse: [ ^ false ].
		
	"They must have same list of arguments (and in the same order)"
	(aRule antecedentTree arguments = aRule consequentTree arguments)
		ifFalse: [ ^ false ].
		
	^ true
]
