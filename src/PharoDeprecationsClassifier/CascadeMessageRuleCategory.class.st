Class {
	#name : #CascadeMessageRuleCategory,
	#superclass : #OneToManyRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
CascadeMessageRuleCategory >> condition [ 
	^ [ :deprecation | deprecation transformationRule consequentTree isCascade ]
]

{ #category : #accessing }
CascadeMessageRuleCategory >> name [ 
	^ 'Cascade message'
]
