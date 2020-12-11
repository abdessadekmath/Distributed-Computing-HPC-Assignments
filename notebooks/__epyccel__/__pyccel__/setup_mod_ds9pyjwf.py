from setuptools import Extension, setup
import numpy

extension_mod = Extension("mod_ds9pyjwf",
		[ r'mod_ds9pyjwf_wrapper.c' ],
		extra_objects = [r'/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__/bind_c_mod_ds9pyjwf.o',
				r'/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__/mod_ds9pyjwf.o'],
		include_dirs = [r'/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__', numpy.get_include()],
		libraries = [r'gfortran'],
		library_dirs = [r'/usr/lib/gcc/x86_64-linux-gnu/9'],
		extra_link_args = [r'-O3',
				r'-fPIC',
				r'-I"/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__"'])

setup(name = "mod_ds9pyjwf", ext_modules=[extension_mod])