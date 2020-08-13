Class {
	#name : #PDTransformationRule,
	#superclass : #Object,
	#instVars : [
		'antecedent',
		'consequent',
		'deprecation'
	],
	#category : #PharoDeprecationsCollector
}

{ #category : #comparing }
PDTransformationRule >> = anotherRule [
	super = anotherRule
		ifFalse: [ ^ false ].
	
	((self antecedent = anotherRule antecedent) and: (self consequent = anotherRule consequent))
		ifFalse: [ ^ false ].
		
	(self condition asString = anotherRule condition asString)
		ifFalse: [ ^ false ].
		
	^ true
]

{ #category : #accessing }
PDTransformationRule >> antecedent [
	^ antecedent
]

{ #category : #accessing }
PDTransformationRule >> antecedent: anObject [
	antecedent := anObject
]

{ #category : #accessing }
PDTransformationRule >> antecedentTree [
	^ RBParser parseRewriteExpression: antecedent
]

{ #category : #accessing }
PDTransformationRule >> consequent [
	^ consequent
]

{ #category : #accessing }
PDTransformationRule >> consequent: anObject [
	consequent := anObject
]

{ #category : #accessing }
PDTransformationRule >> consequentTree [
	^ RBParser parseRewriteExpression: consequent
]

{ #category : #accessing }
PDTransformationRule >> deprecation [
	^ deprecation
]

{ #category : #accessing }
PDTransformationRule >> deprecation: anObject [
	deprecation := anObject
]

{ #category : #testing }
PDTransformationRule >> isValid [
	^ PDTransformationRuleValidator new isValid: self
]

{ #category : #printing }
PDTransformationRule >> printOn: aStream [
	aStream 
		nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: antecedent;
		nextPutAll: ' => ';
		nextPutAll: consequent;
		nextPut: $).
]
