Class {
	#name : #ArgumentsRemovedRuleCategory,
	#superclass : #SameReceiverRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #testing }
ArgumentsRemovedRuleCategory >> condition [ 
	^ [ :rule |
		(rule antecedentTree arguments asSet difference: rule consequentTree arguments) isNotEmpty and: [
		(rule consequentTree arguments asSet difference: rule antecedentTree arguments) isEmpty  ] ]
]

{ #category : #testing }
ArgumentsRemovedRuleCategory >> name [
	^ 'Arguments removed'
]
