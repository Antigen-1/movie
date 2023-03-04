from ctypes import py_object, c_double, CFUNCTYPE

def close_clip(c):
    c.close()

def copy_clip(c):
    return c.copy()

def cut_clip(c, s, e):
    return c.cutout(s, e)

def subclip(c, s, e):
    return c.subclip(s, e)

def set_fps(c, f):
    return c.with_fps(f, True)
