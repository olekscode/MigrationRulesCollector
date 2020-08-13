Class {
	#name : #RenamingRuleCategory,
	#superclass : #SameReceiverRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #testing }
RenamingRuleCategory >> condition [ 
	^ [ :deprecation | deprecation transformationRule antecedentTree arguments = deprecation transformationRule consequentTree arguments ]
]

{ #category : #testing }
RenamingRuleCategory >> name [ 
	^ 'Renaming'
]
