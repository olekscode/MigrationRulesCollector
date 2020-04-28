Class {
	#name : #RewriterRuleCategory,
	#superclass : #RuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
RewriterRuleCategory >> condition [
	^ [ :rule | rule isRewriterRule ]
]

{ #category : #accessing }
RewriterRuleCategory >> name [
	^ 'Rewriter rules'
]
