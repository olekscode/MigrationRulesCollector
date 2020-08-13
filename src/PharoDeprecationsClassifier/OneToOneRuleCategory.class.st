Class {
	#name : #OneToOneRuleCategory,
	#superclass : #ValidRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #testing }
OneToOneRuleCategory >> condition [
	^ [ :rule |
			rule consequentTree isMessage and: [
			rule consequentTree receiver isMessage not and: [
			self areAllArgumentsRewriterVariables: rule consequentTree ] ] ]
]

{ #category : #accessing }
OneToOneRuleCategory >> name [ 
	^ 'One to one'
]
