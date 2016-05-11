#! /usr/bin/env python2
from subprocess import check_output

def get_pass():
    return check_output("pass me/email/emily@emilyshepherd.me", shell=True).splitlines()[0]
