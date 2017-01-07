import subprocess

from os import listdir


def run_formatter(filename):
    formatter = filename.split('.')[0]
    cmd = 'nvim -u vimrc -c "set verbose=1 | Neoformat {formatter} | wq " --headless ./before/{filename}'.format(
        filename=filename, formatter=formatter)
    output = subprocess.check_output(cmd, shell=True)
    print(output.decode('utf-8'))


def compare_files(filename):
    with open('./before/' + filename) as f_before:
        with open('./after/' + filename) as f_after:
            before = f_before.readlines()
            after = f_after.readlines()

            assert before == after

def formatter_test(filename):
    run_formatter(filename)
    compare_files(filename)

def test_yapf():
    filename = 'yapf.py'
    formatter_test(filename)

def test_prettydiff():
    filename = 'prettydiff.css'
    formatter_test(filename)

def test_csscomb():
    filename = 'csscomb.css'
    formatter_test(filename)

def test_cssbeautify():
    filename = 'cssbeautify.css'
    formatter_test(filename)
