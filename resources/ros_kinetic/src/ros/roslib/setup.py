#!/usr/bin/env python3

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

d = generate_distutils_setup(
    packages=['ros', 'roslib'],
    package_dir={'': 'src'},
    requires=['rospkg']
)

setup(**d)
