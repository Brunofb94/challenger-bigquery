QUANTIDADE DE CONTRATOS QUE ESTÁ SENDO CRIADO POR BLOCO

SELECT  count(symbol) as `count`, block_number, symbol as `token` FROM `bigquery-public-data.crypto_ethereum.tokens` 
group by block_number, symbol
order by `count` desc limit 20

Bloco contendo tokens em um dia 

SELECT  count(block_number) as `block_number`,  symbol as `token` FROM `bigquery-public-data.crypto_ethereum.tokens` 
where date(block_timestamp) = '2021-12-27'
group by symbol
order by `block_number` desc limit 20



Variação Quantidade Tokens


SELECT  count(block_number) as `block_number_count`,  symbol as `token`, date(block_timestamp) as `dt_criacao`,
var_pop(`block_number`)
 FROM `bigquery-public-data.crypto_ethereum.tokens` 
where  date(block_timestamp) between DATE_SUB(current_date(), INTERVAL 15 DAY) and current_date()
group by  dt_criacao, symbol
order by dt_criacao desc 




Últimos 15 dias, a variação na quantidade de blocos

SELECT  count(symbol) as `block_number_count`, date(block_timestamp) as `dt_criacao`,
var_pop(`block_number`)
 FROM `bigquery-public-data.crypto_ethereum.tokens` 
where  date(block_timestamp) between DATE_SUB(current_date(), INTERVAL 15 DAY) and current_date()
group by  dt_criacao, block_number
order by dt_criacao desc 