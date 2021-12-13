Class {
	#name : #MiPackageBlueprintBrowserTest,
	#superclass : #MiAbstractBrowserTest,
	#instVars : [
		'model',
		'class1',
		'class2',
		'inh',
		'method1',
		'var2',
		'access',
		'method2',
		'method3',
		'inv1',
		'inv2',
		'package1',
		'inv3',
		'package2',
		'var1',
		'acc1',
		'namespace',
		'ref1',
		'methodExt',
		'isolatedPackage',
		'isolatedClass',
		'isolatedMethod',
		'localVariable',
		'anchor'
	],
	#category : #'Perso-Visualization-Tests'
}

{ #category : #running }
MiPackageBlueprintBrowserTest >> browserClass [

	^ MiPackageBlueprintBrowser 
]

{ #category : #running }
MiPackageBlueprintBrowserTest >> setUp [

	super setUp.

	model := FamixJavaModel new.
	package1 := (FamixJavaPackage named: 'package1') mooseModel: model.
	package2 := (FamixJavaPackage named: 'package2') mooseModel: model.
	isolatedPackage := (FamixJavaPackage named: 'isolatedPackage') 
		                   mooseModel: model.
	anchor := FamixJavaSourceTextAnchor new mooseModel: model.
	class1 := (FamixJavaClass named: 'class1')
		          parentPackage: package1;
		          sourceAnchor: anchor;
		          mooseModel: model.

	class2 := (FamixJavaClass named: 'class2')
		          parentPackage: package2;
		          mooseModel: model.
	isolatedClass := (FamixJavaClass named: 'isolatedClass')
		                 parentPackage: isolatedPackage;
		                 mooseModel: model.
	inh := FamixJavaInheritance new
		       subclass: class1;
		       superclass: class2;
		       mooseModel: model.
	method1 := (FamixJavaMethod named: 'method1')
		           parentType: class1;
		           mooseModel: model.
	method2 := (FamixJavaMethod named: 'method2')
		           parentType: class2;
		           mooseModel: model.
	method3 := (FamixJavaMethod named: 'method3')
		           parentType: class2;
		           mooseModel: model.
	isolatedMethod := (FamixJavaMethod named: 'isolatedMethod')
		                  parentType: isolatedClass;
		                  mooseModel: model.
	var1 := (FamixJavaAttribute named: 'var1')
		        parentType: class2;
		        declaredType: class1;
		        mooseModel: model.
	var2 := (FamixJavaAttribute named: 'var2')
		        parentType: class2;
		        mooseModel: model.
	localVariable := (FamixJavaLocalVariable named: 'var3')
		                 parentBehaviouralEntity: method2;
		                 declaredType: class1;
		                 mooseModel: model.
	access := FamixJavaAccess new
		          accessor: method1;
		          variable: var2;
		          mooseModel: model.
	acc1 := FamixJavaAccess new
		        accessor: method2;
		        variable: var1;
		        mooseModel: model.
	inv1 := FamixJavaInvocation new
		        sender: method1;
		        addCandidate: method2;
		        receiver: var2;
		        mooseModel: model.
	inv2 := FamixJavaInvocation new
		        sender: method2;
		        addCandidate: method2;
		        receiver: var2;
		        mooseModel: model.
	inv3 := FamixJavaInvocation new
		        sender: method3;
		        addCandidate: method2;
		        receiver: var2;
		        mooseModel: model.
	ref1 := FamixJavaReference
		        source: method1
		        target: class2
		        model: model
]
