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


def test_formatters():
    for f in listdir('before'):
        run_formatter(f)
        compare_files(f)


if __name__ == '__main__':
    test_formatters()
