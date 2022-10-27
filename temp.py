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
    
    SHA1result1 = [''.join(p) for p in product(s1,repeat = 1)]
    SHA1result2 = [''.join(p) for p in product(s1,repeat = 2)]
    
    resultSHA1 = SHA1result1 + SHA1result2
    
    
    '''SHA256'''
    s = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?!0123456789'
    
    result1 = [''.join(p) for p in product(s,repeat = 1)]
    result2 = [''.join(p) for p in product(s,repeat = 2)]
    result3 = [''.join(p) for p in product(s,repeat = 3)]
    
    resultAll = result1 + result2 + result3


    dic = {}
    
    
    for i in range(len(resultAll)):
        dic[hashlib.sha256(resultAll[i].encode('utf-8')).hexdigest()] = resultAll[i]
        
    for i in range(len(resultSHA1)):
        dic[hashlib.sha1(resultSHA1[i].encode('utf-8')).hexdigest()] = resultSHA1[i]
    
    
    #json_object = json.dumps(dic, indent = 4) 
    #print(json_object)
    
    with open("hash_v1.json", "w") as outfile:
        json.dump(dic, outfile)
    print(dic["86f7e437faa5a7fce15d1ddcb9eaeaea377667b8"])