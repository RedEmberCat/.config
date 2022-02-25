import random
import string

import words_to_practice_words as w2pw

#w2pw.letters = 'qazxpeci' # letters to practice
#w2pw.letters = 'acp' # letters to practice
w2pw.letters = 'cpzqb' # letters to practice
words_per_line = 5
reps = 5
punctuation = (         # punctuation to practice
    ('', ''),                # 0 none
    ',.?\'"-_',         # 1 common
    string.punctuation, # 2 all
)[0]

practice_words_file = r'practice_words.txt'

def main():
    words = w2pw.translate_file()
    random.shuffle(words)
    line = []
    for i, word in enumerate(words):
        line.append(word.strip())
        if i and not (i+1) % words_per_line:
            line_s = ' '.join(line) + random.choice(punctuation)
            line = []
            print(f'{(i+1) // words_per_line:>3}  {line_s}')
            for j in range(reps):
                input(f'{j+1:>3}  ')
            print()

def get_words(words_file):
    with open(words_file) as f:
        return list(f)

main()
