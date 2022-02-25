def print_columns(items, screen_width, col_width):
    cols = screen_width // col_width
    for i, item in enumerate(items):
        if i and not i % cols:
            print()
        print(f'{item:<{col_width}}', end='')
    print()

bis = dir(__builtins__)
print_columns(bis, 80, max(len(bi) for bi in bis))
print(len(bis))

print(dir(__builtins__))
