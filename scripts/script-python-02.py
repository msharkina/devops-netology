#!/usr/bin/env python3

from os import popen, getcwd, path
from sys import argv
from subprocess import run

def checkIsGitRepo(path):
    return run(f'cd {path} && git rev-parse --is-inside-work-tree >/dev/null 2>&1', shell=True).returncode == 0


def checkModified(path):
    fileStatus = popen(f'git status {path}').read().split('\n')
    for status in fileStatus:
        if status.find('modified') != -1:
            file = status.replace('\tmodified:   ', '')
            print(getcwd() + '/' + file)


if (len(argv) >= 2):
    dirPath = argv[1]
else:
    dirPath = getcwd()

if path.isdir(dirPath) and checkIsGitRepo(dirPath):
    checkModified(dirPath)
else:
    print(f"Can't check status. Provided path {dirPath} is not a valid git repo!")
