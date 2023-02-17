# Engenharia-de-Dados

# ETL - Utilizando Azure Data Factory


Este documento demonstra o desenvolvimento técnico do projeto de ETL de dados financeiros e visualização em um dashboard.

Utilizando ferramentas como Data Factory, Azure SQL e PowerBi.

## 🏭 Arquitetura

![image](https://user-images.githubusercontent.com/116772002/219800668-ec682281-160b-4018-96fb-f133fc0f7023.png)


## ⚙️ Fonte de Dados

Processo de extração dos dados da API através do Data Factory.
API - Alphavantage.co

 - Google (Alphabet)
 https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=GOGL&apikey={chave_api}&datatype=csv

 - Amazon
 https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=AMZN&apikey={chave_api}&datatype=csv 
 
 - Microsoft
 https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=MSFT&apikey={chave_api}&datatype=csv
 





### 🔩 Layout dos arquivos

Tabela Stage


|   **variável**  | **tipo** |    **descrição**   |
|:---------------:|:--------:|:------------------:|
|    timestamp    |   vachar | data do fechamento |
|       open      |   vachar |  preço de abertura |
|       high      |   vachar |     preço max      |
|       low       |   vachar |      preço min     |
|      close      |   vachar |     preço final    |
|  adjusted close |   vachar |     preço final    |
|      volume     |   vachar |                    |
| dividend amount |   vachar |                    |

Tabela Final Prices

|   **variável**  | **tipo** |    **descrição**   |
|:---------------:|:--------:|:------------------:|
|    timestamp    |   date   | data do fechamento |
|       open      |   float  |  preço de abertura |
|       high      |   float  |     preço max      |
|       low       |   float  |      preço min     |
|      close      |   float  |     preço final    |



## 📦 Desenvolvimento

Para o  processo de extração dos dados foi utilizada a API do site Alphavantage, utilizando a atividade Copy Data(copiar dados) da ferramenta Data Factory para coletar os dados e enviar para as tabelas stage.

![image](https://user-images.githubusercontent.com/116772002/219796008-66680b8b-3390-4b28-8b65-ded4d87eb20c.png)

Realizado a extração dos dados, foi criado uma Procedure (procedimento armazenado) para estruturar/tratar os dados.

Onde inicialmente ocorre um truncate table na tabela Prices para não ocorrer duplicação de dados, e também é realizado a conversão da tipagem dos dados e inserção dos dados na tabela Prices.

![image](https://user-images.githubusercontent.com/116772002/219801342-6cbf0cfd-ea6f-4986-acef-509afba46213.png)


## 🛠️ Construído com

* [Data Factory](https://azure.microsoft.com/pt-br/products/data-factory/) - Ferramenta de ETL Microsoft Azure
* [Azure SQL](https://azure.microsoft.com/pt-br/products/azure-sql/database) - Banco de dados SQL do Azure
* [Power Bi] (https://powerbi.microsoft.com/pt-br/) - Ferramenta de Visualização de Dados
* [API](https://www.alphavantage.com/) - API para extração das informações financeiras


## 🏃 Autor


* **Fernando Barbosa** - *Engenheiro de Dados Jr* - [github](https://github.com/FernandoBarbosaB)
