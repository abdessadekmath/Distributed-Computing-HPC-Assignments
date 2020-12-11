#define PY_SSIZE_T_CLEAN
#define NPY_NO_DEPRECATED_API NPY_1_19_API_VERSION
#include <stdio.h>
#include <stdlib.h>
#include <Python.h>
#include <numpy/arrayobject.h>

long solve_1d_nonlinearconv_pyccel(int n0_u, double *u, long nt, long nx, double dt, double dx);

/*........................................*/



/*........................................*/

/*........................................*/
PyObject *solve_1d_nonlinearconv_pyccel_wrapper(PyObject *self, PyObject *args, PyObject *kwargs)
{

    PyArrayObject *u;
    long nt;
    long nx;
    double dt;
    double dx;
    long Out_0001;
    PyObject *result;
    static char *kwlist[] = {
        "u",
        "nt",
        "nx",
        "dt",
        "dx",
        NULL
    };

    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!lldd", kwlist, &PyArray_Type, &u, &nt, &nx, &dt, &dx))
    {
        return NULL;
    }
    if (PyArray_NDIM(u) != 1)
    {
        PyErr_SetString(PyExc_TypeError, "u must have rank 1");
        return NULL;
    }
    if (PyArray_TYPE(u) != NPY_DOUBLE)
    {
        printf("%d %d\n", PyArray_TYPE(u), NPY_DOUBLE);
        PyErr_SetString(PyExc_TypeError, "u must be double");
        return NULL;
    }
    Out_0001 = solve_1d_nonlinearconv_pyccel(PyArray_DIM(u, 0), PyArray_DATA(u), nt, nx, dt, dx);
    result = Py_BuildValue("l", Out_0001);
    return result;
}
/*........................................*/

static PyMethodDef mod_tx3sqx4y_methods[] = {
    {
        "solve_1d_nonlinearconv_pyccel",
        (PyCFunction)solve_1d_nonlinearconv_pyccel_wrapper,
        METH_VARARGS | METH_KEYWORDS,
        ""
    },
    { NULL, NULL, 0, NULL}
};

/*........................................*/

static struct PyModuleDef mod_tx3sqx4y_module = {
    PyModuleDef_HEAD_INIT,
    /* name of module */
    "mod_tx3sqx4y",
    /* module documentation, may be NULL */
    NULL,
    /* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. */
    -1,
    mod_tx3sqx4y_methods
};

/*........................................*/

PyMODINIT_FUNC PyInit_mod_tx3sqx4y(void)
{
    PyObject *m;

    import_array();

    m = PyModule_Create(&mod_tx3sqx4y_module);
    if (m == NULL) return NULL;

    return m;
}
