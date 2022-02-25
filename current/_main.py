import itertools
import sys
import time

def main():
    filein, fileout = get_filenames()
    lines = read_lines(filein)
    write_lines(fileout, lines)
    #time.sleep(2)
    #clear_file(fileout)

def get_filenames():
    try:
        filein = sys.argv[1]
        fileout = filein + 'test'
    except IndexError:
        filein = '07-01.math'
        fileout = 'testout.math'
    return filein, fileout

def read_lines(filein):
    lines = []
    with open(filein, 'r') as file:
        lines_to_format = []
        for line in file:
            # Collect math block. '    ' or '\t' indicates the beginning of math
            # This allows python to look at the entire math block to align to
            # equal signs.
            if line.startswith('    ') or line.startswith('\t'):
                lines_to_format.append(line)
            # If there are collected lines and the current line is a new line,
            # then the end of a math block as been found. Format the math block.
            elif lines_to_format and line.startswith('\n'):
                formatted_lines = format_lines(lines_to_format)
                lines_to_format = []
                formatted_lines.append(line)
                lines.extend(formatted_lines)
            else:
                lines.append(line)
        # If the end of the file is reached while in a math block, format the math block. hello
        else:
            if lines_to_format:
                formatted_lines = format_lines(lines_to_format)
                lines.extend(formatted_lines)
    return lines

def format_lines(lines):
    # split along equals
    # 'aaa = bbb' -> ['aaa', 'bbb']
    # 'ccc = ddd' -> ['ccc', 'ddd']
    split_lines = [line.split(' = ') for line in lines]
    inspect('split_lines', split_lines) # DEBUG
    # zip vertically
    # 'aaa = bbb'    ['aaa', 'ccc']
    # 'ccc = ddd' -> ['bbb', 'ddd']
    zipped_lines = list(itertools.zip_longest(*split_lines, fillvalue=''))
    #section_lengths = [[len(section) for section in line] for line in split_lines]
    # You need to do another pass each time you modify the lines.
    # This means there will need to be len(split_lines[0]) - 1 passes:
    #   If a line is 'aaa = bbb     ccc = ddd'
    #   Then its split will be length 3.
    #   And it'll need two passes: for section 0 and section 1.
    #for _ in range(len(split_lines[0]) - 1):
    for section_number, sections in enumerate(zipped_lines):
        max_len = max(len(section) for section in sections)
        for line_number, section in enumerate(sections):
            section_len = len(section)
            if section_len < max_len and section:
                formatted_section = section + ' ' * (max_len - section_len)
                if '\n' in section:
                    formatted_section = formatted_section.replace('\n', '') + '\n'
                split_lines[line_number][section_number] = formatted_section
    inspect('split_lines', split_lines) # DEBUG
    #inspect('zipped_lines', zipped_lines) # DEBUG
    print()
    return [' = '.join(line) for line in split_lines]

def inspect(name, obj):
    print(name)
    for i, x in enumerate(obj):
        print(f'\t{i:>2} {repr(x)}')

def write_lines(fileout, lines):
    with open(fileout, 'w') as file:
        for line in lines:
            file.write(line)

def clear_file(fileout):
    with open(fileout, 'w') as file:
        pass

main()

