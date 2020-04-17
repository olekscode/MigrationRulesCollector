Class {
	#name : #MigrationRulesRenamingCategory,
	#superclass : #MigrationRulesValidCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
MigrationRulesRenamingCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
	
	"Consequent must be a message node"
	(aRule consequentTree isMessage)
		ifFalse: [ ^ false ].
		
	"Antecedent and consequent must have the same receiver"
	(aRule antecedentTree receiver = aRule consequentTree receiver)
		ifFalse: [ ^ false ].
		
	"They must have same list of arguments (and in the same order)"
	(aRule antecedentTree arguments = aRule consequentTree arguments)
		ifFalse: [ ^ false ].
		
	^ true
]
