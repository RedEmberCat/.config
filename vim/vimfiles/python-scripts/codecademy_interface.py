import pyautogui as pag
import sys

from codecademy_locations import Locations

type = 'splitscreen'

def main():
    if sys.argv[1] not in ('to', 'from'):
        raise KeyError('script argument must be \'to\' or \'from\'')
    locs = Locations(pag.size(), type)
    pag.hotkey('alt', 'tab')
    pag.click(locs.code)
    pag.hotkey('ctrl', 'a')
    if sys.argv[1] == 'to':
        pag.hotkey('ctrl', 'v')
        pag.hotkey('ctrl', 'enter')
        pag.click(locs.lesson)
    elif sys.argv[1] == 'from':
        pag.hotkey('ctrl', 'c')
        pag.click(locs.code)
        pag.click(locs.lesson)
        pag.hotkey('alt', 'tab')
        pag.typewrite('P')

main()

