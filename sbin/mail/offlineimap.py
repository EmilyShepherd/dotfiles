#! /usr/bin/env python2
from subprocess import check_output

def get_pass():
    return check_output("cat ~/Private/conf/email", shell=True).splitlines()[0]
