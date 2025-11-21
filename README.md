# Election-CI

Getting started
- Prerequisites: Java 21, Git, and internet access for Maven dependencies.

Build and run with Maven Wrapper
- On Windows PowerShell or Command Prompt, use the provided wrapper scripts at the project root.

Windows (PowerShell or CMD)
- To build the project:
  - PowerShell: .\mvnw.cmd clean verify
  - CMD: mvnw.cmd clean verify

macOS/Linux (bash/zsh)
- ./mvnw clean verify

Avoiding the “Unknown lifecycle phase .9.9” error on Windows
- If you generate or update the Maven Wrapper with the wrapper plugin, ensure the property switches are placed before the goal, or use the mvnw.cmd script directly.
  - Correct examples:
    - mvn -N -DmavenVersion=3.9.11 org.apache.maven.plugins:maven-wrapper-plugin:3.3.2:wrapper
    - mvn -N -Dmaven=3.9.11 -Dtype=only-script wrapper:wrapper
  - Incorrect example that can fail on PowerShell (causes “.9.9” to be parsed as a lifecycle phase):
    - mvn -N org.apache.maven.plugins:maven-wrapper-plugin:3.3.2:wrapper -DmavenVersion=3.9.11

Notes
- This repository already ships with a configured Maven Wrapper targeting Maven 3.9.11 (see .mvn/wrapper/maven-wrapper.properties). You usually do not need to re-run the wrapper goal.
- If you must change the Maven version, prefer editing .mvn/wrapper/maven-wrapper.properties (distributionUrl) or re-running one of the “Correct examples” above.
