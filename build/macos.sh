#!/bin/bash
running=$(ps aux | grep 'lstna.app' | grep -v 'grep'  | wc -l)

if [ $running -gt 0 ]; then
	# lstna is already running
	pid=$(ps aux | grep 'lstna.app' | grep -v 'grep' | awk '{print $2}')
	kill -9 $pid
fi

cd www
npm run build
cd ..
go run gen.go

APP="lstna.app"
mkdir -p dist/$APP/Contents/{MacOS,Resources}
go build -o dist/$APP/Contents/MacOS/lstna
cat > dist/$APP/Contents/Info.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleExecutable</key>
	<string>lstna</string>
	<key>CFBundleIconFile</key>
	<string>icon.icns</string>
	<key>CFBundleIdentifier</key>
	<string>tech.alexzissis.lstna</string>
</dict>
</plist>
EOF
cp icons/icon.icns dist/$APP/Contents/Resources/icon.icns
find dist/$APP
open dist/lstna.app