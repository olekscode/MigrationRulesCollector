Class {
	#name : #PDDeprecationsCollector,
	#superclass : #Object,
	#category : #PharoDeprecationsCollector
}

{ #category : #'as yet unclassified' }
PDDeprecationsCollector >> collectDeprecationsFromImage [
	| selectors senders |
	
	selectors := { 
		#deprecated: .
		#deprecated:on:in: .
		#deprecated:on:in:transformWith: .
		#deprecated:on:in:transformWith:when: .
		#deprecated:transformWith: .
		#deprecated:transformWith:when: }.
		
	senders := (selectors inject: Set new into: [ :union :selector |
		union union: selector senders ]) asOrderedCollection.
	
	^ senders flatCollect: [ :sender |
		self collectDeprecationsFromMethod: sender ].
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollector >> collectDeprecationsFromImageExcludingPackages: aCollectionOfPackages [
	^ self collectDeprecationsFromImage reject: [ :deprecation |
		aCollectionOfPackages anySatisfy: [ :package |
			package methods includes: deprecation method ] ].
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollector >> collectDeprecationsFromMethod: aMethod [
	| visitor |
	visitor := PDDeprecationsCollectingVisitor new.
	aMethod ast acceptVisitor: visitor.
	
	^ visitor deprecations collect: [ :each |
		each method: aMethod compiledMethod ].
]
