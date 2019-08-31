import time

class benchmark(object):

    def __init__(self, name):
        self.name = name

    def __enter__(self):
        self.start = time.time()

    def __exit__(self,ty,val,tb):
        end = time.time()
        print("%s : %0.2f seconds" % (self.name, end-self.start))
        return False