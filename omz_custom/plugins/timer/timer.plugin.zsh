function preexec() {
	timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
	if [ $timer ]; then
		now=$(($(date +%s%0N)/1000000))
		elapsed=$(($now-$timer))

		export TIMER="${elapsed}ms"
	fi
}
