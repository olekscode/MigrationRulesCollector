Class {
	#name : #OneToOneRuleCategory,
	#superclass : #ValidRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #testing }
OneToOneRuleCategory >> condition [
	^ [ :deprecation |
		| rule |
		rule := deprecation transformationRule.
		
		rule consequentTree isMessage and: [
			rule consequentTree receiver isMessage not and: [
			(rule consequentTree arguments allSatisfy: [ :each |
				each class = RBPatternVariableNode ]) ] ] ]
]

{ #category : #accessing }
OneToOneRuleCategory >> name [ 
	^ 'One to one'
]
