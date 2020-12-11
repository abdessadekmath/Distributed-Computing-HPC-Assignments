from setuptools import Extension, setup
import numpy

extension_mod = Extension("mod_4yzrb8cz",
		[ r'mod_4yzrb8cz_wrapper.c' ],
		extra_objects = [r'/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__/bind_c_mod_4yzrb8cz.o',
				r'/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__/mod_4yzrb8cz.o'],
		include_dirs = [r'/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__', numpy.get_include()],
		libraries = [r'gfortran'],
		library_dirs = [r'/usr/lib/gcc/x86_64-linux-gnu/9'],
		extra_link_args = [r'-O3',
				r'-fPIC',
				r'-I"/home/um6p/github/Distributed-Computing-HPC-Assignments/notebooks/__epyccel__/__pyccel__"'])

setup(name = "mod_4yzrb8cz", ext_modules=[extension_mod])