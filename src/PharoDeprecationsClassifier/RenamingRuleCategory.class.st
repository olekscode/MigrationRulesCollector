Class {
	#name : #RenamingRuleCategory,
	#superclass : #SameReceiverRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #testing }
RenamingRuleCategory >> condition [ 
	^ [ :rule | rule antecedentTree arguments = rule consequentTree arguments ]
]

{ #category : #testing }
RenamingRuleCategory >> name [ 
	^ 'Renaming'
]
