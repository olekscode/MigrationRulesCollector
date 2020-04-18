Class {
	#name : #RewriterRulesAddedUnaryMessageCallCategory,
	#superclass : #RewriterRulesOneToManyCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
RewriterRulesAddedUnaryMessageCallCategory class >> fits: aRule [
	aRule consequentTree isMessage
		ifFalse: [ ^ false ].
		
	aRule consequentTree receiver isMessage
		ifFalse: [ ^ false ].
		
	((aRule consequentTree arguments isEmpty and: [
		aRule consequentTree receiver arguments = aRule antecedentTree arguments ]) or: [ 
		(aRule consequentTree receiver arguments isEmpty and: [
			aRule consequentTree arguments = aRule antecedentTree arguments ]) ])
		ifFalse: [ ^ false ].
		
	^ true
]
