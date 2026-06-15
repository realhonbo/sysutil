#!/usr/bin/lua

local sysutil = require 'sysutil'

local files, err = sysutil.inotify(0x2, 30000, "/tmp/test-file.txt", "/tmp/hello-file.txt")
if not files then
	if type(err) ~= "number" then err = -1 end
	io.stderr:write(string.format("inotify has failed: %d\n", err))
	io.stderr:flush()
	os.exit(1)
end

for file, mask in pairs(files) do
	io.stdout:write(string.format("inotify: %s => 0x%x\n", file, mask))
	io.stdout:flush()
end
os.exit(0)
