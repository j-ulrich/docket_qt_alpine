# Dockerfile: Alpine Qt 6.5

Docker image for building and automated testing of Qt 6 applications.

Image configuration:
- Alpine 3.18
- Python 3.11.8
- Qt 6.5.2
	- qmake6
	- qt6-base-dev
	- qt6-base-dev-tools
	- qt6-documentation-tools
	- qt6-declarative-dev
	- qt6-declarative-dev-tools
	- qt6-image-formats-plugins
	- qt6-l10n-tools
	- qt6-translations-l10n
- GCC/G++ 12.2.1
- CMake 3.26.5
- Qbs 2.0.1 (default profile: qt-6)
- Doxygen 1.9.6
- coverxygen 1.8.1
- gcovr 6.0
- Tags files for Qt 6.5 (to link in Doxygen documentation)
- OpenJDK 17 JRE
- SonarQube Scanner 5.0.1.3006 (located at `/opt/sonar-scanner`)