Class {
	#name : #ValidRuleCategory,
	#superclass : #RewriterRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #testing }
ValidRuleCategory >> areAllArgumentsRewriterVariables: aNode [
	^ (aNode arguments allSatisfy: [ :each |
		self isRewriterVariable: each ])
]

{ #category : #testing }
ValidRuleCategory >> condition [
	^ [ :rule |
		rule antecedentTree isMessage and: [
		rule antecedentTree selector = rule method selector and: [
		(self isRewriterVariable: rule antecedentTree receiver) and: [
		(self areAllArgumentsRewriterVariables: rule antecedentTree) and: [
		rule consequent isNotEmpty and: [ 
		rule antecedentTree ~= rule consequentTree ] ] ] ] ] ]
]

{ #category : #testing }
ValidRuleCategory >> isAntecedentsReceiverARewriterVariable: aRule [
	^ self isRewriterVariable: aRule antecedentTree receiver
]

{ #category : #testing }
ValidRuleCategory >> isRewriterVariable: aNode [
	^ aNode class = RBPatternVariableNode
]

{ #category : #accessing }
ValidRuleCategory >> name [
	^ 'Valid'
]
