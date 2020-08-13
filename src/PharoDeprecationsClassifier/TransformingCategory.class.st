Class {
	#name : #TransformingCategory,
	#superclass : #DeprecationCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
TransformingCategory >> condition [
	^ [ :deprecation | deprecation isTransforming ]
]

{ #category : #accessing }
TransformingCategory >> name [
	^ 'Transforming deprecations'
]
