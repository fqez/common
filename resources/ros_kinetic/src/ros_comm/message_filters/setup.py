#!/usr/bin/env python3

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

d = generate_distutils_setup(
    packages=['message_filters'],
    package_dir={'': 'src'},
    requires=['genmsg', 'genpy', 'roslib', 'rospkg']
)

setup(**d)
