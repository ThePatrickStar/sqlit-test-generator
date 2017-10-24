import os
import shutil
from os import listdir
from os.path import isfile, join


def main():

    tests_dir = 'tests/'
    test_files = [f for f in listdir(tests_dir) if isfile(join(tests_dir, f))]
    total_no = len(test_files)

    # clear and create a new output folder
    output_dir = 'generated/'
    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir)

    for (i, test_file) in enumerate(test_files):
        output_file = join(output_dir, test_file.replace('.test', '.sql'))
        commands = []
        # bracket_counter = 0
        # iter_name = ''

        with open(join(tests_dir, test_file)) as raw_file:
            lines = raw_file.readlines()
            for (line_no, line) in enumerate(lines):
                stripped = line.strip()
                if len(stripped) > 0:
                    # handle the for loop case
                    # if stripped.startswith('for {set'):
                    #     bracket_counter = 1
                    #     iter_name = stripped.split()[2]
                    #     iter_start = int(stripped.split()[3].replace('}', ''))
                    if stripped[0].isupper():
                        stripped = stripped.replace('$ii', '16')
                        stripped = stripped.replace('$i', '1')
                        stripped = stripped.replace('$j', '1')
                        stripped = stripped.replace('$jj', '75')
                        stripped = stripped.replace('$nEntry', '5')
                        stripped = stripped.replace('$x', '1')
                        stripped = stripped.replace('$x', '2')
                        stripped = stripped.replace('$y', '1')
                        stripped = stripped.replace('$::N', '50')
                        stripped = stripped.replace('$::ii', '5')
                        stripped = stripped.replace('$n', '1')
                        stripped = stripped.replace('$param1', '4')
                        stripped = stripped.replace('$param2', '8')
                        if stripped[-1] != ';':
                            # if next line is not a command
                            if line_no + 1 < len(lines):
                                next_line = lines[line_no + 1].lstrip()
                                if len(next_line) > 0:
                                    if not next_line[0].isupper():
                                        stripped += ';'
                        stripped += '\n'
                        commands.append(stripped)

        # create a file only if we found something
        if len(commands) > 0:
            with open(output_file, 'w') as output:
                for command in commands:
                    output.write(command)

        print('[+]\t processed %d of %d files' % (i+1, total_no))


if __name__ == '__main__':
    main()