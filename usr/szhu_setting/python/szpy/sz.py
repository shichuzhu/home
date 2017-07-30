import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

def hms2utc(hms):
    """hms: numeric
    output: numeric
    """
    return np.mod(hms,100)+np.mod(np.floor(hms/100),100)*60+np.floor(hms/10000)*3600;

def utc2hms(utc):
    """utc: numeric
    output: numeric
    """
    return np.mod(utc,60)+np.mod(np.floor(utc/60),60)*100+np.floor(utc/3600)*10000;

def hist(x):
    tmp = x.ravel()
    return tmp[~np.isnan(tmp)]

def nanmoving_mean(data,window,axis=0):
    kw = {'center':True,'window':window,'min_periods':1}
    if len(data.shape)==1:
        return pd.Series(data).rolling(**kw).mean().as_matrix()
    elif len(data.shape)>=2:
        tmp = np.swapaxes(data,0,axis)
        tmpshp = tmp.shape
        tmp = np.reshape( tmp, (tmpshp[0],-1), order='C' )
        tmp = pd.DataFrame(tmp).rolling(**kw).mean().as_matrix()
        tmp = np.reshape( tmp, tmpshp, order='C' )
        return np.swapaxes(tmp,0,axis)
    else:
        print('Invalid dimension!')
        return None

def cal_mmd(bin_div, psd, md='fb'):
    """
    md 'fb' -> Francis and Brown
       'ft' -> Fontaine
       'dl' -> Delphine HIWC
    """
    pass
