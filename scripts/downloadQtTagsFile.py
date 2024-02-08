#!/usr/bin/env python3


from argparse import ArgumentParser
from dataclasses import dataclass
from pathlib import Path
from typing import List, Optional
import requests
from tqdm import tqdm


def main( argv: Optional[List[str]] = None ):
	args = parseCliArguments( argv )

	for module in tqdm( modulesToDownload ):
		tqdm.write( f'Downloading tags file for {module}...' )
		downloadQtTagsFile( module, args )

@dataclass
class CliArgs:
	qtVersion: str
	outputDir: Path

def parseCliArguments( argv: Optional[List[str]] ) -> CliArgs:
	argParser = ArgumentParser( description='Downloads the Qt documentation tags files to a given target directory.' )

	argParser.add_argument( 'qtVersion', help='The Qt version for which the tags file should be downloaded. Example: 6.6', metavar='QT_VERSION' )
	argParser.add_argument( 'outputDir', type=Path, help='The directory where the tags files should be downloaded to.', metavar='OUTPUT_DIR' )

	return CliArgs( **argParser.parse_args( argv ).__dict__ )


modulesToDownload = [
	'qdoc',
	'qmake',
	'qt3d',
	'qtconcurrent',
	'qtcore',
	'qtdbus',
	'qtgrpc',
	'qtgui',
	'qtlabsplatform',
	'qtlocation',
	'qtnetwork',
	'qtnetworkauth',
	'qtnfc',
	'qtopcua',
	'qtopengl',
	'qtopengl',
	'qtpositioning',
	'qtprintsupport',
	'qtprotobuf',
	'qtqml',
	'qtqmlmodels',
	'qtqmltest',
	'qtquick',
	'qtquick3d',
	'qtquick3dphysics',
	'qtquickcontrols',
	'qtquickdialogs',
	'qtquicktimeline',
	'qtremoteobjects',
	'qtscxml',
	'qtsensors',
	'qtserialbus',
	'qtshadertools',
	'qtsql',
	'qtstatemachine',
	'qtsvg',
	'qttestlib',
	'qtwebchannel',
	'qtwebengine',
	'qtwebsockets',
	'qtwidgets',
	'qtxml',
]

def downloadQtTagsFile( module: str, args: CliArgs ):
	tagsFile = module + '.tags'
	url = f'https://doc.qt.io/qt-{args.qtVersion}/{tagsFile}'

	response = requests.get( url )
	if not response.ok:
		tqdm.write( f'❌ Failed to download tags file for module {module}. Response was: {response.status_code} {response.reason}' )
		return

	with args.outputDir.joinpath( tagsFile ).open( 'wb' ) as targetFile:
		targetFile.write( response.content )

if __name__ == '__main__':
	main()