import subprocess

from os import listdir


def run_formatter(filename):
    formatter = filename.split('.')[0]
    cmd = f'nvim -u vimrc -c "set verbose=1 | Neoformat {formatter} | wq " --headless ./before/{filename}'
    print(subprocess.check_output(cmd, shell=True).decode('utf-8'))


def run_formatter_with_visual(filename, filetype, start_line, end_line):
    cmd = f'nvim -u vimrc -c "set verbose=1 | {start_line},{end_line}Neoformat! {filetype} | wq " --headless {filename}'
    print(subprocess.check_output(cmd, shell=True).decode('utf-8'))


def readlines(filename):
    with open(filename) as f:
        return f.readlines()


def test_formatters():
    for f in listdir('before'):
        run_formatter(f)
        before = readlines('./before/' + f)
        after = readlines('./after/' + f)
        assert before == after


def test_visualselection():
    filename_before = 'visual_selection_before.txt'
    for test in [('python', 4, 7), ('css', 9, 9), ('css', 14, 15)]:
        run_formatter_with_visual(filename_before, *test)

    before = readlines(filename_before)
    after = readlines('visual_selection_after.txt')
    assert before == after

if __name__ == '__main__':
    test_formatters()
