Class {
	#name : #CascadeMessageRuleCategory,
	#superclass : #OneToManyRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
CascadeMessageRuleCategory >> condition [ 
	^ [ :rule | rule consequentTree isCascade ]
]

{ #category : #accessing }
CascadeMessageRuleCategory >> name [ 
	^ 'Cascade message'
]
