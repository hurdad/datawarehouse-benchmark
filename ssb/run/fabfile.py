# Import Fabric's API module
from fabric.api import *

env.hosts = [
    'ziox1',
    'ziox2',
    'ziox3',
    'ziox4'
]
# Set the username
env.user   = "user"

# Set the password [NOT RECOMMENDED]
env.password = "dev"

def drop_caches():
    sudo(" sh -c 'echo 3 > /proc/sys/vm/drop_caches'")

