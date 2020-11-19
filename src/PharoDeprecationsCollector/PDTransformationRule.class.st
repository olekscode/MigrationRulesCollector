Class {
	#name : #PDTransformationRule,
	#superclass : #TransformationRule,
	#instVars : [
		'antecedentTree',
		'consequentTree'
	],
	#category : #PharoDeprecationsCollector
}

{ #category : #accessing }
PDTransformationRule >> antecedent: aString [
	super antecedent: aString.
	antecedentTree := self parseAntecedentTree.
]

{ #category : #accessing }
PDTransformationRule >> antecedentTree [
	^ antecedentTree
]

{ #category : #accessing }
PDTransformationRule >> consequent: aString [
	super consequent: aString.
	consequentTree := self parseConsequentTree.
]

{ #category : #accessing }
PDTransformationRule >> consequentTree [
	^ consequentTree
]
