which sheldon > /dev/null
if [ $? -eq 0 ]; then
	eval "$(sheldon source)"
fi
