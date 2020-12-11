#define PY_SSIZE_T_CLEAN
#define NPY_NO_DEPRECATED_API NPY_1_19_API_VERSION
#include <stdio.h>
#include <stdlib.h>
#include <Python.h>
#include <numpy/arrayobject.h>

long solve_2d_poisson_pyccel(int n0_p, int n1_p, double *p, int n0_pd, int n1_pd, double *pd, int n0_b, int n1_b, double *b, long nx, long ny, long nt, double dx, double dy);

/*........................................*/



/*........................................*/

/*........................................*/
PyObject *solve_2d_poisson_pyccel_wrapper(PyObject *self, PyObject *args, PyObject *kwargs)
{

    PyArrayObject *p;
    PyArrayObject *pd;
    PyArrayObject *b;
    long nx;
    long ny;
    long nt;
    double dx;
    double dy;
    long Out_0001;
    PyObject *result;
    static char *kwlist[] = {
        "p",
        "pd",
        "b",
        "nx",
        "ny",
        "nt",
        "dx",
        "dy",
        NULL
    };

    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!O!O!llldd", kwlist, &PyArray_Type, &p, &PyArray_Type, &pd, &PyArray_Type, &b, &nx, &ny, &nt, &dx, &dy))
    {
        return NULL;
    }
    if (PyArray_NDIM(p) != 2)
    {
        PyErr_SetString(PyExc_TypeError, "p must have rank 2");
        return NULL;
    }
    if (PyArray_TYPE(p) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(p), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "p must be double");
        return NULL;
    }
    if (!PyArray_CHKFLAGS(p, NPY_ARRAY_C_CONTIGUOUS))
    {
        PyErr_SetString(PyExc_NotImplementedError, "Argument does not have the expected ordering (C)");
        return NULL;
    }
    if (PyArray_NDIM(pd) != 2)
    {
        PyErr_SetString(PyExc_TypeError, "pd must have rank 2");
        return NULL;
    }
    if (PyArray_TYPE(pd) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(pd), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "pd must be double");
        return NULL;
    }
    if (!PyArray_CHKFLAGS(pd, NPY_ARRAY_C_CONTIGUOUS))
    {
        PyErr_SetString(PyExc_NotImplementedError, "Argument does not have the expected ordering (C)");
        return NULL;
    }
    if (PyArray_NDIM(b) != 2)
    {
        PyErr_SetString(PyExc_TypeError, "b must have rank 2");
        return NULL;
    }
    if (PyArray_TYPE(b) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(b), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "b must be double");
        return NULL;
    }
    if (!PyArray_CHKFLAGS(b, NPY_ARRAY_C_CONTIGUOUS))
    {
        PyErr_SetString(PyExc_NotImplementedError, "Argument does not have the expected ordering (C)");
        return NULL;
    }
    Out_0001 = solve_2d_poisson_pyccel(PyArray_DIM(p, 0), PyArray_DIM(p, 1), PyArray_DATA(p), PyArray_DIM(pd, 0), PyArray_DIM(pd, 1), PyArray_DATA(pd), PyArray_DIM(b, 0), PyArray_DIM(b, 1), PyArray_DATA(b), nx, ny, nt, dx, dy);
    result = Py_BuildValue("l", Out_0001);
    return result;
}
/*........................................*/

static PyMethodDef mod_6ouwt36r_methods[] = {
    {
        "solve_2d_poisson_pyccel",
        (PyCFunction)solve_2d_poisson_pyccel_wrapper,
        METH_VARARGS | METH_KEYWORDS,
        ""
    },
    { NULL, NULL, 0, NULL}
};

/*........................................*/

static struct PyModuleDef mod_6ouwt36r_module = {
    PyModuleDef_HEAD_INIT,
    /* name of module */
    "mod_6ouwt36r",
    /* module documentation, may be NULL */
    NULL,
    /* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. */
    -1,
    mod_6ouwt36r_methods
};

/*........................................*/

PyMODINIT_FUNC PyInit_mod_6ouwt36r(void)
{
    PyObject *m;

    import_array();

    m = PyModule_Create(&mod_6ouwt36r_module);
    if (m == NULL) return NULL;

    return m;
}
