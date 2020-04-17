Class {
	#name : #RewriterRulesValidCategory,
	#superclass : #RewriterRulesCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
RewriterRulesValidCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
	
	aRule antecedentTree isMessage 
		ifFalse: [ ^ false ].
		
	aRule antecedentTree selector = aRule method selector
		ifFalse: [ ^ false ].
		
	aRule antecedentTree receiver class = RBPatternVariableNode
		ifFalse: [ ^ false ].
		
	(aRule antecedentTree arguments allSatisfy: [ :each |
		each class = RBPatternVariableNode ])
		ifFalse: [ ^ false ].
		
	aRule consequent isEmpty
		ifTrue: [ ^ false ].
		
	aRule antecedentTree = aRule consequentTree
		ifTrue: [ ^ false ].
		
	^ true
]
