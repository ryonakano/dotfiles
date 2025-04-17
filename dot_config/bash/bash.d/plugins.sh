which sheldon > /dev/null
if [ $? -eq 0 ]; then
	eval "$(sheldon source)"
fi

BLE_SH="$HOME/.local/share/blesh/ble.sh"
if [ -f "$BLE_SH" ]; then
	source "$BLE_SH"
fi
unset BLE_SH
