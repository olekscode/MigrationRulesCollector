Class {
	#name : #AddedUnaryMessageRuleCategory,
	#superclass : #OneToManyRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> condition [ 
	^ [ :rule |
		rule consequentTree isMessage and: [
		rule consequentTree receiver isMessage and: [ 
			(self isUnaryMessageAddedBefore: rule) or: [ 
				self isUnaryMessageAddedAfter: rule ] ] ] ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> isUnaryMessageAddedAfter: aRule [
	^ aRule consequentTree arguments isEmpty and: [
		aRule consequentTree receiver arguments = aRule antecedentTree arguments ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> isUnaryMessageAddedBefore: aRule [
	^ aRule consequentTree receiver arguments isEmpty and: [
		aRule consequentTree arguments = aRule antecedentTree arguments ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> name [ 
	^ 'Added unary message'
]
