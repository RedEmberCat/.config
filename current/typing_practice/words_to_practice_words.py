"""From lsv of english words, make words file to practice particular letters."""

words_file = r'C:\home\user\tmp\words.txt'
practice_words_file = r'practice_words.txt'
letters = 'qazxpeci' # letters to practice
word_length = 7 # includes newline at end of word

def translate_file(write=False):
    words = []
    total_words = 0
    with open(words_file) as f:
        for total_words, line in enumerate(f):
            if len(line) < word_length:
                if any(len(line.split(letter)) > 2 for letter in letters):
                    words.append(line.strip())
    if write:
        with open(practice_words_file, 'w') as g:
            g.write('\n'.join(words))
    print(f'words collected {len(words):>6}')
    print(f'total words     {total_words:>6}')
    print()
    return words

if __name__ == '__main__':
    translate_file(write=True)
