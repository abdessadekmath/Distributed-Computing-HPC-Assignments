#define PY_SSIZE_T_CLEAN
#define NPY_NO_DEPRECATED_API NPY_1_19_API_VERSION
#include <stdio.h>
#include <stdlib.h>
#include <Python.h>
#include <numpy/arrayobject.h>

long solve_2d_nonlinearconv_pyccel(int n0_u, int n1_u, double *u, int n0_un, int n1_un, double *un, int n0_v, int n1_v, double *v, int n0_vn, int n1_vn, double *vn, long nt, long nx, long ny, double dt, double dx, double dy, double c);

/*........................................*/



/*........................................*/

/*........................................*/
PyObject *solve_2d_nonlinearconv_pyccel_wrapper(PyObject *self, PyObject *args, PyObject *kwargs)
{

    PyArrayObject *u;
    PyArrayObject *un;
    PyArrayObject *v;
    PyArrayObject *vn;
    long nt;
    long nx;
    long ny;
    double dt;
    double dx;
    double dy;
    double c;
    long Out_0001;
    PyObject *result;
    static char *kwlist[] = {
        "u",
        "un",
        "v",
        "vn",
        "nt",
        "nx",
        "ny",
        "dt",
        "dx",
        "dy",
        "c",
        NULL
    };

    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!O!O!O!llldddd", kwlist, &PyArray_Type, &u, &PyArray_Type, &un, &PyArray_Type, &v, &PyArray_Type, &vn, &nt, &nx, &ny, &dt, &dx, &dy, &c))
    {
        return NULL;
    }
    if (PyArray_NDIM(u) != 2)
    {
        PyErr_SetString(PyExc_TypeError, "u must have rank 2");
        return NULL;
    }
    if (PyArray_TYPE(u) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(u), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "u must be double");
        return NULL;
    }
    if (!PyArray_CHKFLAGS(u, NPY_ARRAY_C_CONTIGUOUS))
    {
        PyErr_SetString(PyExc_NotImplementedError, "Argument does not have the expected ordering (C)");
        return NULL;
    }
    if (PyArray_NDIM(un) != 2)
    {
        PyErr_SetString(PyExc_TypeError, "un must have rank 2");
        return NULL;
    }
    if (PyArray_TYPE(un) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(un), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "un must be double");
        return NULL;
    }
    if (!PyArray_CHKFLAGS(un, NPY_ARRAY_C_CONTIGUOUS))
    {
        PyErr_SetString(PyExc_NotImplementedError, "Argument does not have the expected ordering (C)");
        return NULL;
    }
    if (PyArray_NDIM(v) != 2)
    {
        PyErr_SetString(PyExc_TypeError, "v must have rank 2");
        return NULL;
    }
    if (PyArray_TYPE(v) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(v), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "v must be double");
        return NULL;
    }
    if (!PyArray_CHKFLAGS(v, NPY_ARRAY_C_CONTIGUOUS))
    {
        PyErr_SetString(PyExc_NotImplementedError, "Argument does not have the expected ordering (C)");
        return NULL;
    }
    if (PyArray_NDIM(vn) != 2)
    {
        PyErr_SetString(PyExc_TypeError, "vn must have rank 2");
        return NULL;
    }
    if (PyArray_TYPE(vn) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(vn), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "vn must be double");
        return NULL;
    }
    if (!PyArray_CHKFLAGS(vn, NPY_ARRAY_C_CONTIGUOUS))
    {
        PyErr_SetString(PyExc_NotImplementedError, "Argument does not have the expected ordering (C)");
        return NULL;
    }
    Out_0001 = solve_2d_nonlinearconv_pyccel(PyArray_DIM(u, 0), PyArray_DIM(u, 1), PyArray_DATA(u), PyArray_DIM(un, 0), PyArray_DIM(un, 1), PyArray_DATA(un), PyArray_DIM(v, 0), PyArray_DIM(v, 1), PyArray_DATA(v), PyArray_DIM(vn, 0), PyArray_DIM(vn, 1), PyArray_DATA(vn), nt, nx, ny, dt, dx, dy, c);
    result = Py_BuildValue("l", Out_0001);
    return result;
}
/*........................................*/

static PyMethodDef mod_c7xbjq2a_methods[] = {
    {
        "solve_2d_nonlinearconv_pyccel",
        (PyCFunction)solve_2d_nonlinearconv_pyccel_wrapper,
        METH_VARARGS | METH_KEYWORDS,
        ""
    },
    { NULL, NULL, 0, NULL}
};

/*........................................*/

static struct PyModuleDef mod_c7xbjq2a_module = {
    PyModuleDef_HEAD_INIT,
    /* name of module */
    "mod_c7xbjq2a",
    /* module documentation, may be NULL */
    NULL,
    /* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. */
    -1,
    mod_c7xbjq2a_methods
};

/*........................................*/

PyMODINIT_FUNC PyInit_mod_c7xbjq2a(void)
{
    PyObject *m;

    import_array();

    m = PyModule_Create(&mod_c7xbjq2a_module);
    if (m == NULL) return NULL;

    return m;
}
