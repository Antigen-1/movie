from moviepy.video.io.VideoFileClip import VideoFileClip
from moviepy.video.compositing.concatenate import concatenate_videoclips

def read_videoclip(p):
    return VideoFileClip(p)

def get_height(c):
    return c.h

def get_width(c):
    return c.w

def get_frames_num(c):
    return c.n_frames

def resize_videoclip(c, s):
    return c.resize(new_size=s)

def rotate_videoclip(c, a):
    # anticlockwise
    return c.rotate(a)

def extract_subregion(c, x, y):
    return c.crop(x[0],y[0],x[1],y[1])

def append_videoclips(l):
    return concatenate_videoclips(l)

def mirror_x(c):
    c.mirror_x()
    return c

def mirror_y(c):
    c.mirror_y()
    return c

def map_frames(c, func):
    return c.fl_image(func)

def save_frame(c, p, t):
    c.save_frame(p, t=t)

def write_videoclip(c, p):
    c.write_videofile(p)

def write_videoclip_to_gif(c, p):
    c.write_gif(p)

def write_videoclip_to_images(c, f):
    c.write_images_sequence(f)
