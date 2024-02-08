#!/usr/bin/env python3

import subprocess
from typing import List

installedPackagesList: List[str] = subprocess.run(['apk', 'list', '--installed'], capture_output=True, check=True, encoding='utf-8').stdout.split('\n')[ : -1]

interestedPackages = {
	'cmake': 'CMake',
	'gcovr': 'gcovr',
	'g++': 'GCC/G++',
	'doxygen': 'Doxygen',
	'qt6-qtbase': 'Qt',
	'python3': 'Python',
	'qbs': 'Qbs',
	'openjdk17-jre-headless': 'OpenJDK JRE',
}

for installedPackage in installedPackagesList:
	packageInfo = installedPackage.split( ' ' )
	packageNameAndVersionSegments = packageInfo[0].split( '-' )
	packageName = '-'.join( packageNameAndVersionSegments[ : -2 ] )
	version, revision = packageNameAndVersionSegments[ -2 : ]

	if packageName in interestedPackages:
		print( f'{interestedPackages[packageName]} {version}' )