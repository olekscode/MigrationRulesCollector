Class {
	#name : #OneToManyRuleCategory,
	#superclass : #ValidRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
OneToManyRuleCategory >> condition [ 
	^ OneToOneRuleCategory new condition not
]

{ #category : #accessing }
OneToManyRuleCategory >> name [ 	
	^ 'One to many'
]
