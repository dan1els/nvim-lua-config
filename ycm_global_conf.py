def Settings( **kwargs ):
  if kwargs[ 'language' ] == 'java':
    return {
      'ls': {
        'java.format.onType.enabled': True,
        'java.import.gradle.wrapper.enabled': True,
        'java.import.gradle.enabled': True,
        'java.maven.downloadSources': True
      }
    }
