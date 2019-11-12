#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[261]:


df_tran = pd.read_excel('datasetpricing.xlsx', sheet_name='transacoes')


# In[290]:


df_tran.head(5)


# In[266]:


# Este campo originalmente é descritivo, porem diz respeito ao prazo de pagamento
# é possível extrair este prazo da descrição.
df_tran['COND_PAGTO'] = df_tran['COND_PAGTO'].str[2:4]
df_tran['COND_PAGTO'] = df_tran['COND_PAGTO'].apply(pd.to_numeric, errors='coerce')


# In[267]:


X = df_tran[(df_tran['F_DAY']==20190601) & (df_tran['SKU_ID']==44644) & (df_tran['TXN_TYPE']=='CAMPO')].drop(['F_DAY','SKU_ID','TXN_TYPE'], axis=1)
#Ao invés apenas de tratar os NA vou remover as colunas que so possuem NA´s
X = X.dropna(axis=1, how='all')
X = X.fillna(value=0)


# In[269]:


X.head()


# Como estamos observando caracteristicas em unidades diferente é conveniente padronizar as variáveis.

# In[270]:


Z = pd.DataFrame()


# In[271]:


Z = (X - X.mean())/X.std()
Z = Z.fillna(value=0)
Z.head()


# ### Calculo matriz correlação

# calculo da matriz de correlação das transações.

# In[272]:


R = Z.corr().fillna(value=0)
R.head()


# ### Calculo dos autovalores e autovetores da matriz de correlação

# In[273]:


eigen_val, eigen_vect =np.linalg.eig(R)


# Ordena os autovalores em ordem decrescente

# In[274]:


idx = np.argsort(eigen_val)
eigen_vect = eigen_vect.T[idx][::-1]
eigen_val = eigen_val[idx][::-1]


# Autovalores 

# In[275]:


#print(eigen_val)


# Auvetores

# In[276]:


#print(eigen_vect)


# In[277]:


Z.head()


# Os componentes principais Y são dados por:

# In[278]:


# Y1 = np.dot(eigen_vect[0,:],Z.T)
# Y2 = np.dot(eigen_vect[1,:],Z.T)
Y = np.dot(eigen_vect,Z.T)


# A variância do componente principal Yi é igual o autovalor i

# In[279]:


Y.var(axis=1)


# In[280]:


eigen_val


# ### Contribuição de cada componente principal

# In[281]:


C = eigen_val*100/eigen_val.sum()


# In[282]:


index = 1
for i in C:
        print("Contribuição C%s do componente Y%s: %5.2f" %(str(index),str(index),i))
        index=index + 1


# A soma dos primeiros k autovalores representa a proporção de informação retida na redução de p para k dimensões. Nesse caso vamos considerar uma redução para 70% porcento da informação.

# In[283]:


index = 1
acumulador = 0
while acumulador<70:
    acumulador = acumulador + C[index]
    index = index + 1
print("Foi possivel reter %5.2f%% da informação reduzindo de %d para %d dimensões" %(acumulador, len(C),index))


# ### Interpretação de cada componente

# Verifica-se a influência que cada variável Xj tem sobre o componente Yi. O grau de influência é dado pela correlação entre cada Xj e o componente Yi.
# 
# A influência de cada variável sobre o componente Y é dada pelo peso w.

# In[284]:


W = pd.DataFrame()
for i in range(len(eigen_vect)):
    W[i] = eigen_vect[i,:]/Z.std()


# In[285]:


W.T.head()


# Neste contexto a análise termina aqui, pois neste caso estamos interessados na obtenção de indices.

# ### Escores dos componentes principais

# In[ ]:




