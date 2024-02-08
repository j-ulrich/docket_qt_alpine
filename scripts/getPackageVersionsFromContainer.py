#!/usr/bin/env python3

import subprocess
from pathlib import Path


subprocess.run( [ "docker", "run",
				 "--rm",
				 "-v", str( Path.cwd().joinpath( "scripts" ) )+":/opt/scripts",
				 "julrich/docker_qt_alpine",
				 "python3", "/opt/scripts/getPackageVersions.py" ], check=True )
