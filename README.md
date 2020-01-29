# sonar-canner-ci

Quick sonar scanner docker image. 
Contribute to ValleJulien/docker-sonar-scanner development by creating an account on GitHub.
Feel free to create PR and MR.

### Use Case with gitlab ci
```yaml
sonarqube:
  image:
    name: ${CI_REGISTRY}/sonarqube-scanner:latest
    entrypoint: [""]
  allow_failure: true
  dependencies:
    - build
  only:
    - master
  except:
    variables:
      - $SKIP_SONARQUBE
  script:
    - git fetch --unshallow
    - sonar-scanner
      -D"sonar.log.level=${SONARQUBE_LOG_LEVEL:-INFO}"
      -D"sonar.verbose=${SONARQUBE_VERBOSE:-false}"
      -D"sonar.projectKey=${CI_PROJECT_PATH_SLUG}"
      -D"sonar.login=${SONARQUBE_TOKEN}"
      -D"sonar.projectVersion=${CI_COMMIT_SHORT_SHA}"
      -D"sonar.projectBaseDir=${CI_PROJECT_DIR}"
```
