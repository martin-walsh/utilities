# Sets up JAVA_HOME & JDK_HOME environment variables
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

if [[ "$JAVA_HOME" == "/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home" ]]; then
	printf "Using Java 7...\n"

elif [[ "$JAVA_HOME" == "/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home" ]]; then
	printf "Using Java 8...\n"
else
	printf "Unknown Java version. $JAVA_HOME"
fi

unset CURRENT_JAVA
