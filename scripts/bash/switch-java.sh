if [ $# -ne 1 ] || [[ "$1" == "7" ]]; then
	printf "Switching to Java 7...\n"
	JDK_VERSION="7"

	export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

elif [[ "$1" == "8" ]]; then
	printf "Switching to Java 8...\n"
	JDK_VERSION="8"

	export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

fi

if [[ -z "$JDK_VERSION" ]]; then
	printf "Java version must be 7 or 8, was '$1':\n"
else
	unset JDK_VERSION
fi
