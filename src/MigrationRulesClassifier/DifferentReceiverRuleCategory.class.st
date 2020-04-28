Class {
	#name : #DifferentReceiverRuleCategory,
	#superclass : #OneToOneRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
DifferentReceiverRuleCategory >> condition [
	^ SameReceiverRuleCategory new condition not
]

{ #category : #accessing }
DifferentReceiverRuleCategory >> name [
	^ 'Different receiver'
]
