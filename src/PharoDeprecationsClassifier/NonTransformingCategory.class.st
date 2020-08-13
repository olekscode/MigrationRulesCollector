Class {
	#name : #NonTransformingCategory,
	#superclass : #DeprecationCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
NonTransformingCategory >> condition [
	^ TransformingCategory new condition not
]

{ #category : #accessing }
NonTransformingCategory >> name [
	^ 'Non-transforming deprecations'
]
