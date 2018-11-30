require 'xcodeproj'

input_array = ARGV
src_root = input_array[0].to_s
if src_root.length <= 0
	puts "no src root path"
	exit()
end
plist_path = src_root+'/Info.plist'
puts "plist path: "+plist_path
plist = Xcodeproj::Plist.read_from_path(plist_path)
newBuildVersion = Time.new().strftime("%Y%m%d")
plist["CFBundleVersion"] = newBuildVersion
Xcodeproj::Plist.write_to_path(plist, plist_path)

puts "Build number bumped to " + newBuildVersion
