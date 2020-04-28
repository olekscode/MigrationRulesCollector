Class {
	#name : #SameReceiverRuleCategory,
	#superclass : #OneToOneRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #testing }
SameReceiverRuleCategory >> condition [ 
	^ [ :rule | rule antecedentTree receiver = rule consequentTree receiver ]
]

{ #category : #testing }
SameReceiverRuleCategory >> name [ 
	^ 'Same receiver'
]
