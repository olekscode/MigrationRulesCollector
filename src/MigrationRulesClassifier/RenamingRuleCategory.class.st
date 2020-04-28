Class {
	#name : #RenamingRuleCategory,
	#superclass : #SameReceiverRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #testing }
RenamingRuleCategory >> condition [ 
	^ [ :rule | rule antecedentTree arguments = rule consequentTree arguments ]
]

{ #category : #testing }
RenamingRuleCategory >> name [ 
	^ 'Renaming'
]
