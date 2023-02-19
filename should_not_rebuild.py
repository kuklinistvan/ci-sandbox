#!/usr/bin/env python3

import os
from subprocess import check_output
from argparse import ArgumentParser

def main():
    parser = ArgumentParser()
    parser.add_argument('target')
    args = parser.parse_args()

    if (should_rebuild(args.target)):
        exit(1)
    else:
        exit(0)

def should_rebuild(target: str) -> bool:
    my_dir = os.path.dirname(os.path.realpath(__file__))

    commit_id_file_path = os.path.join(my_dir, 'rebuild_commit_ids/' + target) + '__prev_commit_hash_if_build_needed'

    if not on_main_branch(my_dir):
        return True

    try:
        with open(commit_id_file_path) as f:
            content = f.read().strip()

    except FileNotFoundError:
        return False

    return content == previous_commit_id(my_dir)

def on_main_branch(git_dir: str) -> bool:  
    output = check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD']).decode('utf-8').strip()
    return output == 'main'

def previous_commit_id(my_dir) -> bool:
    return check_output(['git', 'rev-parse', 'HEAD~']).decode('utf-8').strip()

if __name__ == '__main__':
    main()