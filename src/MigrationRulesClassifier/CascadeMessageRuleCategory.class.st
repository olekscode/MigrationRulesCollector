Class {
	#name : #CascadeMessageRuleCategory,
	#superclass : #OneToManyRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
CascadeMessageRuleCategory >> condition [ 
	^ [ :rule | rule consequentTree isCascade ]
]

{ #category : #accessing }
CascadeMessageRuleCategory >> name [ 
	^ 'Cascade message'
]
