#!/usr/bin/env python3.6

import subprocess

import os
from shutil import copyfile


def run_vim_cmd(cmd, filename=''):
    cmd = f'vim -u vimrc -c "set verbose=1 | {cmd} | wq "  {filename}'
    return run_cmd(cmd)


def run_cmd(cmd):
    return subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True).wait()


def readlines(filename):
    with open(filename) as f:
        return f.readlines()


def test_formatters():
    '''
    run formatters on entire buffer
    '''

    files = os.listdir('before')

    ignored = set(['.mypy_cache'])

    filtered_files = (f for f in files if f not in ignored)

    for filename in filtered_files:
        assert filename != '.mypy_cache'
        output_file = '/tmp/neoformat_' + filename
        formatter = filename.split('.')[0]
        cmd = f'vim -u vimrc -c "set verbose=1 | Neoformat {formatter} | w! {output_file} | q! "  ./before/{filename}'
        run_cmd(cmd)
        before = readlines(output_file)
        after = readlines('./after/' + filename)
        assert before == after


def test_visual_selection_multi_filetype():
    '''
    Format different filetypes in one file
    '''
    filename_before = 'visual_selection_before.txt'
    output_file = '/tmp/neoformat_' + filename_before
    copyfile(filename_before, output_file)

    for test in [('python', 4, 7), ('css', 9, 9), ('css', 14, 15)]:
        (filetype, start_line, end_line) = test
        print(start_line)
        vim_cmd = f'{start_line},{end_line}Neoformat! {filetype}'
        cmd = f'vim -u vimrc -c "set verbose=1 | {vim_cmd} | wq "  {output_file}'
        run_cmd(cmd)

    before = readlines(output_file)
    after = readlines('visual_selection_after.txt')
    assert before == after


def test_visual_selection_with_filetype_and_formatter():
    '''
    Test that passing filetype and formatter to Neoformat! works
    '''
    dir_before = 'visual_before/'
    dir_after = 'visual_after/'
    for filename in os.listdir(dir_before):
        (filetype, formatter, start_line, end_line) = filename.split('_')
        output_file = '/tmp/neoformat_' + filename
        cmd = f'vim -u vimrc -c "set verbose=1 | {start_line},{end_line}Neoformat! {filetype} {formatter} | w! {output_file} | q! "  {dir_before + filename}'
        run_cmd(cmd)
        before = readlines(output_file)
        after = readlines(dir_after + filename)
        assert before == after


def test_formatprg_with_neoformat():
    '''
    Test that formatprg is processed by neoformat
    '''

    dir_before = 'before/'
    filename = 'cssbeautify.css'
    output_file = '/tmp/neoformat_fmt_prg_' + filename
    viml = '''
    let &formatprg = 'css-beautify -s 6 -n'
    let g:neoformat_try_formatprg = 1
    '''
    cmd = f'vim -u vimrc -c "set verbose=1 | {viml} | Neoformat | w! {output_file} | q! "  {dir_before + filename}'
    run_cmd(cmd)
    before = readlines(output_file)
    after = readlines('./after/cssbeautify-indent-6.css')
    assert before == after


def test_formatprg_without_enable():
    '''
    Test that formatprg isn't use when not enabled
    '''

    dir_before = 'before/'
    filename = 'cssbeautify.css'
    output_file = '/tmp/neoformat_fmtprg_not_enabled' + filename
    viml = '''
    let &formatprg = 'css-beautify -s 6 -n'
    '''
    cmd = f'vim -u vimrc -c "set verbose=1 | {viml} | Neoformat | w! {output_file} | q! "  {dir_before + filename}'
    run_cmd(cmd)
    before = readlines(output_file)
    after = readlines('./after/cssbeautify.css')
    assert before == after


def test_vader():
    '''
    run *.vader tests
    '''
    cmd = f'vim -u vimrc -c "Vader! *.vader" '
    exit_code = run_cmd(cmd)
    assert exit_code == 0


def test_autocompletion():
    '''
    run the vim autocompletion tests
    '''
    cmd = f'vim -u vimrc -c "source autocomplete_test.vim" '
    exit_code = run_cmd(cmd)
    assert exit_code == 0


def test_viml_syntax():
    '''
    run vint to check vim syntax
    '''
    exit_code = run_cmd('vint ../')
    assert exit_code == 0


if __name__ == '__main__':
    # run all functions with names in the form of 'test_...'
    [func() for func in (val for key, val in vars().items()
        if key.startswith('test_'))]
