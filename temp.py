import hashlib
import json 
from itertools import permutations
from itertools import product

class Solution(object):
    def intToRoman(self, num):
        """
        :type num: int
        :rtype: str
        """
        
    '''SHA1'''
    s1 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    
    SHA1result = [''.join(p) for p in product(s1,repeat = 1)]
    
    
    '''SHA256'''
    s = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?!0123456789'
    
    SHA256result1 = [''.join(p) for p in product(s,repeat = 1)]
    SHA256result2 = [''.join(p) for p in product(s,repeat = 2)]
    SHA256result3 = [''.join(p) for p in product(s,repeat = 3)]
    
    resultAll = SHA256result1 + SHA256result2 + SHA256result3

    dic = {}
    
    for i in range(len(resultAll)):
        dic[hashlib.sha256(resultAll[i].encode('utf-8')).hexdigest()] = resultAll[i]
        
    for i in range(len(SHA1result)):
        dic[hashlib.sha1(SHA1result[i].encode('utf-8')).hexdigest()] = SHA1result[i]
    
    
    #json_object = json.dumps(dic, indent = 4) 
    #print(json_object)
    
    with open("hash.json", "w") as outfile:
        json.dump(dic, outfile)
    //print(dic["ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4"])