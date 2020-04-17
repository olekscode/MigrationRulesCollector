Class {
	#name : #RewriterRulesOneToOneCategory,
	#superclass : #RewriterRulesValidCategory,
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
RewriterRulesOneToOneCategory class >> fits: aRule [
	(super fits: aRule)
		ifFalse: [ ^ false ].
	
	"Consequent must be a message node"
	(aRule consequentTree isMessage)
		ifFalse: [ ^ false ].
		
	"All arguments of consequent must be primitive (Rewriter variables)"
	(aRule consequentTree arguments allSatisfy: [ :each |
		each class = RBPatternVariableNode ])
		ifFalse: [ ^ false ].
		
	^ true
]
