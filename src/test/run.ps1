$env:JAVA_HOME = "D:\Program Files\Java\jdk-11.0.5\"
$env:GRADLE_OPTS = ""
$daemonOpt = ""
#$env:GRADLE_OPTS = "-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005"
$env:GRADLE_OPTS += " -javaagent:D:\z_my\xrebel\xrebel.jar "
$daemonOpt = "-Dorg.gradle.jvmargs="
#$daemonOpt += "'-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5006' "
$daemonOpt += "-javaagent:D:\z_my\xrebel\xrebel.jar "
$env:GRADLE_OPTS += $daemonOpt
#D:\z_wd\gradle\usr\local\gradle-source-build\bin\gradle.bat  userguide  -x userguideSinglePage --stacktrace --no-build-cache
D:\z_wd\gradle\usr\local\gradle-source-build\bin\gradle.bat  --stacktrace help
#-Dorg.gradle.jvmargs='-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005' -Dorg.gralde.debug=true -Dorg.gradle.daemon.debug=true


#"D:\Program Files\Java\jdk1.8.0_211/bin/java.exe"  "-Xmx64m" "-Xms64m"   "-Dorg.gradle.appname=gradle" -classpath "D:\z_wd\gradle\usr\local\gradle-source-build\bin\..\lib\gradle-launcher-6.2.jar" org.gradle.launcher.GradleMain userguide -x userguideSinglePage --stacktrace --no-build-cache

# "D:\Program Files\Java\jdk1.8.0_211\bin\java.exe" -XX:MaxMetaspaceSize=512m -XX:+HeapDumpOnOutOfMemoryError -Xmx2500m -Dfile.encoding=UTF-8 -Duser.country=US -Duser.language=en -Duser.variant -cp D:\z_wd\gradle\usr\local\gradle-source-build\lib\gradle-launcher-6.2.jar org.gradle.launcher.daemon.bootstrap.GradleDaemon 6.2-20191227082433+0000
