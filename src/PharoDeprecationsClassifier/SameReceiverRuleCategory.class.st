Class {
	#name : #SameReceiverRuleCategory,
	#superclass : #OneToOneRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #testing }
SameReceiverRuleCategory >> condition [ 
	^ [ :deprecation | deprecation transformationRule antecedentTree receiver = deprecation transformationRule consequentTree receiver ]
]

{ #category : #testing }
SameReceiverRuleCategory >> name [ 
	^ 'Same receiver'
]
