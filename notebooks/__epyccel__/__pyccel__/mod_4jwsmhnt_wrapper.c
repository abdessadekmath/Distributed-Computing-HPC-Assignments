#define PY_SSIZE_T_CLEAN
#define NPY_NO_DEPRECATED_API NPY_1_19_API_VERSION
#include <stdlib.h>
#include <stdio.h>
#include <Python.h>
#include <numpy/arrayobject.h>

long solve_2d_nonlinearconv_pyccel(int n0_u, int n1_u, double *u, int n0_v, int n1_v, double *v, long nt, long nx, long ny, double dt, double dx, double dy, double c);

/*........................................*/



/*........................................*/

/*........................................*/
PyObject *solve_2d_nonlinearconv_pyccel_wrapper(PyObject *self, PyObject *args, PyObject *kwargs)
{

    PyArrayObject *u;
    PyArrayObject *v;
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
        "v",
        "nt",
        "nx",
        "ny",
        "dt",
        "dx",
        "dy",
        "c",
        NULL
    };

    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!O!llldddd", kwlist, &PyArray_Type, &u, &PyArray_Type, &v, &nt, &nx, &ny, &dt, &dx, &dy, &c))
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
    Out_0001 = solve_2d_nonlinearconv_pyccel(PyArray_DIM(u, 0), PyArray_DIM(u, 1), PyArray_DATA(u), PyArray_DIM(v, 0), PyArray_DIM(v, 1), PyArray_DATA(v), nt, nx, ny, dt, dx, dy, c);
    result = Py_BuildValue("l", Out_0001);
    return result;
}
/*........................................*/

static PyMethodDef mod_4jwsmhnt_methods[] = {
    {
        "solve_2d_nonlinearconv_pyccel",
        (PyCFunction)solve_2d_nonlinearconv_pyccel_wrapper,
        METH_VARARGS | METH_KEYWORDS,
        ""
    },
    { NULL, NULL, 0, NULL}
};

/*........................................*/

static struct PyModuleDef mod_4jwsmhnt_module = {
    PyModuleDef_HEAD_INIT,
    /* name of module */
    "mod_4jwsmhnt",
    /* module documentation, may be NULL */
    NULL,
    /* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. */
    -1,
    mod_4jwsmhnt_methods
};

/*........................................*/

PyMODINIT_FUNC PyInit_mod_4jwsmhnt(void)
{
    PyObject *m;

    import_array();

    m = PyModule_Create(&mod_4jwsmhnt_module);
    if (m == NULL) return NULL;

    return m;
}
