Class {
	#name : #RewriterRulesOneToOneCategory,
	#superclass : #RewriterRulesValidCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesOneToOneCategory class >> fits: aRule [
	"Consequent must be a message node"
	aRule consequentTree isMessage
		ifFalse: [ ^ false ].
		
	"Its receiver can not be a message node"
	aRule consequentTree receiver isMessage
		ifTrue: [ ^ false ].
		
	"All arguments of consequent must be primitive (Rewriter variables)"
	(aRule consequentTree arguments allSatisfy: [ :each |
		each class = RBPatternVariableNode ])
		ifFalse: [ ^ false ].
		
	^ true
]
