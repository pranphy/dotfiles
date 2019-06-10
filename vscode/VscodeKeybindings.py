#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np


# In[10]:


def make_map(ne,en):
        return {ne[i]:en[i] for i in range(len(ne)) }
    
def vscode_map(combined_map):
    insert_keymaps = ''
    for key in combined_map:
        insert_keymaps += fr'{{"before":["{key}"],"after":["{combined_map[key]}"]}},'
    return insert_keymaps


# In[2]:


numbers_ne = '० १ २ ३ ४ ५ ६ ७ ८ ९'.split(' ')
numbers_en = '0 1 2 3 4 5 6 7 8 9'.split(' ')
number_map = {numbers_ne[i]:numbers_en[i] for i in range(len(numbers_ne)) }


# In[3]:


one_char_ne = r'''ध भ च त थ ग ष य उ ृ े ब क म ा न ज व प ि स ु श ह अ ख द ल । र औ'''.split(' ')
one_char_en = r'''w e r t y u i o p [ ] a s d f g h j k l ; ' z x c v b n . / ='''.split(' ')
one_char_map = {one_char_ne[i]:one_char_en[i] for i in range(len(one_char_ne)) }
print(one_char_map)


# In[15]:


essential_ne = r'''ज व प ि ा उ ग म ह'''.split(' ')
essential_en = r'''h j k l f p u d x'''.split(' ')

print(vscode_map(make_map(essential_ne,essential_en)))


# In[4]:


sh_one_char_ne = r'''ऐ ऊ इ ए ै आ ँ झ ो फ ी ऋ ॐ ौ ः ङ ई घ छ ट ठ ड ढ ण ओ ं'''.split(' ')
sh_one_char_en = r'''E U O P } A F H J K L C V B M < @ # % ^ & * ( ) _ +'''.split(' ')
print(sh_one_char_ne)
print(sh_one_char_en)
print(len(sh_one_char_ne),len(sh_one_char_en))
sh_one_char_map = {sh_one_char_ne[i]:sh_one_char_en[i] for i in range(len(sh_one_char_ne)) }
#sh_one_char_map = {'ऐ': 'E', 'ऊ': 'U', 'इ': 'O', 'ए': 'P', 'ै': '}', 'आ': 'A', 'ँ': 'F', 'झ': 'H', 'ो': 'J', 'फ': 'K', 'ी': 'L', 'ू': '"', 'ऋ': 'C', 'ॐ': 'V', 'ौ': 'B', 'ः': 'M', 'ङ': '<', '?': '?', 'ई': '@', 'घ': '#', 'छ': '%', 'ट': '^', 'ठ': '&', 'ड': '*', 'ढ': '(', 'ण': ')', 'ओ': '_', 'ं': '+'}
print(sh_one_char_map)


# In[5]:


multi_char_ne = r"""त्त ध् च् त् थ् क्ष क् म् न् स् श् ह् ल् श्र ज्ञ द्ध""".split(' ')
multi_char_en = r"""Q W R T Y I A D G : Z X N > ! $""".split(' ')

multi_map = ''
for i in range(len(multi_char_ne)):
    ne = multi_char_ne[i]
    multi_map += r'''{"before":['''
    for char in ne:
        multi_map += f'"{char}",'
    multi_map += fr'''],"after":["{multi_char_en[i]}"]}},'''
        
print(multi_map)


# In[13]:


combined_map = {**number_map ,** sh_one_char_map , ** one_char_map}
#print(combined_map)
print(vscode_map(combined_map))


# In[7]:


final_map = insert_keymaps + multi_map
print(final_map)


# In[ ]:




