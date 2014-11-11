# A script that builds all the ebuilds in the specified category

import os
import subprocess
import sys

if len(sys.argv) == 1 or sys.argv[1] == '.':
    print("You must supply a valid category")
    sys.exit(1)

category = sys.argv[1]
ebuilds = list()

print("Building all ebuilds in " + category)

for dirname, dirnames, filenames in os.walk(category):
    for filename in filenames:
        if (filename.split('.')[-1] == 'ebuild'):
            ebuilds.append(filename)

for ebuild in ebuilds:
    pkg = ebuild.split('-')[0]
    print('Building ' + pkg)
    cmds = [
        ' '.join(['ebuild', '/'.join([category, pkg, ebuild]), 'clean']),
        ' '.join(['ebuild', '/'.join([category, pkg, ebuild]), 'install'])
    ]

    for cmd in cmds:
        print("Running '" + cmd + "'")
        ret = subprocess.call(cmd, shell=True)
        if ret != 0:
            sys.exit(ret)
