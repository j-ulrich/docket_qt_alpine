# Dockerfile: Alpine Qt 6.6

Dockerfile for creating images for building and automated testing of Qt 6 applications.

Image configuration:
- Alpine 3.19
- Python 3.11.6
- Qt 6.6.1
	- qmake6
	- qt6-base-dev
	- qt6-base-dev-tools
	- qt6-documentation-tools
	- qt6-declarative-dev
	- qt6-declarative-dev-tools
	- qt6-image-formats-plugins
	- qt6-l10n-tools
	- qt6-translations-l10n
- GCC/G++ 13.2.1
- CMake 3.27.8
- Qbs 2.1.2 (default profile: qt-6)
- Doxygen 1.9.8
- coverxygen 1.8.1
- gcovr 6.0
- Tags files for Qt 6.6 (to link in Doxygen documentation)
- OpenJDK 17 JRE
- SonarQube Scanner 5.0.1.3006 (located at `/opt/sonar-scanner`)


### Other Versions ###
See the [Version Table](https://github.com/j-ulrich/docker_qt/wiki/Version-Table) in the project
wiki for an overview of the provided Alpine versions along with the corresponding Qt version.