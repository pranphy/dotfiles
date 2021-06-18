#!/usr/bin/env python3
# coding: utf-8

import numpy as np

class Maps:
    num = {
        '0': '०',
        '1': '१',
        '2': '२',
        '3': '३',
        '4': '४',
        '5': '५',
        '6': '६',
        '7': '७',
        '8': '८',
        '9': '९'
    }
    small_char = {
        'w': 'ध',
        'e': 'भ',
        'r': 'च',
        't': 'त',
        'y': 'थ',
        'u': 'ग',
        'i': 'ष',
        'o': 'य',
        'p': 'उ',
        'a': 'ब',
        's': 'क',
        'd': 'म',
        'f': 'ा',
        'g': 'न',
        'h': 'ज',
        'j': 'व',
        'k': 'प',
        'l': 'ि',
        'z': 'श',
        'x': 'ह',
        'c': 'अ',
        'v': 'ख',
        'b': 'द',
        'n': 'ल'
    }
    capital_char = {
        'E': 'ऐ',
        'U': 'ऊ',
        'O': 'इ',
        'P': 'ए',
        'A': 'आ',
        'F': 'ँ',
        'H': 'झ',
        'J': 'ो',
        'K': 'फ',
        'L': 'ी',
        'C': 'ऋ',
        'V': 'ॐ',
        'B': 'ौ',
        'M': 'ः'
    }
    symbols = {
        '@': 'ई',
        '#': 'घ',
        '%': 'छ',
        '^': 'ट',
        '&': 'ठ',
        '*': 'ड',
        '(': 'ढ',
        ')': 'ण',
        '_': 'ओ',
        '+': 'ं',
        '.': '।',
        '/': 'र',
        '=': 'औ',
        '[': 'ृ',
        "'": 'ु',
        ']': 'े',
        '}': 'ै',
        '<': 'ङ',
        ';': 'स'
    }
    multi_char = {
        'q':['त','्','र',],
        'Q':['त','्','त',],
        'W':['ध','्',],
        'R':['च','्',],
        'T':['त','्',],
        'Y':['थ','्',],
        'I':['क','्','ष',],
        'A':['क','्',],
        'D':['म','्',],
        'G':['न','्',],
        ':':['स','्',],
        'Z':['श','्',],
        'X':['ह','्',],
        'N':['ल','्',],
        '>':['श','्','र',],
        '!':['ज','्','ञ',],
        '$':['द','्','ध',],
    }


    complete = {**num,**small_char,**capital_char,**symbols,**multi_char}


def get_nepali(eng_chars,mapping=Maps.complete):
    return {key.strip(): mapping[key.strip()] for key in eng_chars}

def make_map(ne,en):
        return {ne[i]:en[i] for i in range(len(ne)) }

def vscode_map(combined_map):
    insert_keymaps = ''
    for key,value in combined_map.items():
        insert_keymaps += fr'{{"before":["{value}"],"after":["{key}"]}},'
    return insert_keymaps

def vim_map(keys=None,mapping=Maps.complete):
    if keys:
        for key in keys:
            vl = mapping[key]
            print(f"nnoremap {''.join(vl)} {key}")
    else:
        for (key,value) in mapping.items():
            print(f"nnoremap {''.join(value)} {key}")



MapName = Maps.complete
print('Complete map')

print(vscode_map(get_nepali('J K q'.split(' '))))
