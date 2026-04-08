use esmel
--- [Question 1] — Coin with the highest annual return
SELECT
    crypto_name,
    annual_return_pct
FROM crypto_metrics_clean
ORDER BY annual_return_pct DESC;
-- Decision: Invest priority on top-ranked coin by annual return

--- [Question 2] — Coin with the lowest risk
SELECT
    crypto_name,
    risk_level_pct,
    risk_category
FROM crypto_metrics_clean
ORDER BY risk_level_pct ASC;
-- Decision: Low-risk coins preferred for conservative portfolios

--- [Question 3] — Best return/risk ratio per coin
SELECT
    crypto_name,
    annual_return_pct,
    risk_level_pct,
    return_risk_ratio,
    performance_label
FROM crypto_metrics_clean
ORDER BY return_risk_ratio DESC;
-- Decision: Highest ratio = best reward per unit of risk taken

--- [Question 4] — Count of efficient vs inefficient coins
SELECT
    performance_label,
    COUNT(crypto_name)   AS nb_coins,
    AVG(annual_return_pct) AS avg_return_pct,
    AVG(risk_level_pct)    AS avg_risk_pct
FROM crypto_metrics_clean
GROUP BY performance_label;
-- Decision: If majority inefficient, market conditions unfavorable for active allocation

--- [Question 5] — Price amplitude per coin over the period
SELECT
    crypto_name,
    price_range_usd,
    annual_return_pct,
    risk_category
FROM crypto_metrics_clean
ORDER BY price_range_usd DESC;
-- Decision: Wide range = high exposure, relevant for stop-loss strategy

--- [Question 6] — Coin with the best average daily return
SELECT
    AVG(btc_daily_return) AS btc_avg_daily,
    AVG(eth_daily_return) AS eth_avg_daily,
    AVG(bnb_daily_return) AS bnb_avg_daily,
    AVG(sol_daily_return) AS sol_avg_daily,
    AVG(xrp_daily_return) AS xrp_avg_daily
FROM historical_crypto_prices_clean;
-- Decision: Coin with highest avg daily return = best short-term momentum

--- [Question 7] — Quarter with the highest average BTC return
SELECT
    quarter,
    ROUND(AVG(btc_daily_return), 6) AS avg_btc_return,
    COUNT(Date)                      AS trading_days
FROM historical_crypto_prices_clean
GROUP BY quarter
ORDER BY avg_btc_return DESC;
-- Decision: Best quarter reveals seasonal patterns for entry timing

--- [Question 8] — Coin with the most bullish days
SELECT
    'BTC' AS coin,
    COUNT(*) AS bullish_days
FROM historical_crypto_prices_clean
WHERE btc_return_direction = 'Up'
UNION ALL
SELECT 'ETH', COUNT(*) FROM historical_crypto_prices_clean WHERE eth_return_direction = 'Up'
UNION ALL
SELECT 'BNB', COUNT(*) FROM historical_crypto_prices_clean WHERE bnb_return_direction = 'Up'
UNION ALL
SELECT 'SOL', COUNT(*) FROM historical_crypto_prices_clean WHERE sol_return_direction = 'Up'
UNION ALL
SELECT 'XRP', COUNT(*) FROM historical_crypto_prices_clean WHERE xrp_return_direction = 'Up'
ORDER BY bullish_days DESC;
-- Decision: More bullish days = more consistent upward momentum

--- [Question 9] — Relationship between risk and annual return
SELECT
    crypto_name,
    risk_level_pct,
    risk_category,
    annual_return_pct,
    return_risk_ratio
FROM crypto_metrics_clean
ORDER BY risk_level_pct ASC;
-- Decision: If high risk does not yield high return, allocation is not justified

--- [Question 10] — Coin with the highest average daily volatility
SELECT
    ROUND(STDDEV(btc_daily_return), 6) AS btc_daily_volatility,
    ROUND(STDDEV(eth_daily_return), 6) AS eth_daily_volatility,
    ROUND(STDDEV(bnb_daily_return), 6) AS bnb_daily_volatility,
    ROUND(STDDEV(sol_daily_return), 6) AS sol_daily_volatility,
    ROUND(STDDEV(xrp_daily_return), 6) AS xrp_daily_volatility
FROM historical_crypto_prices_clean;
-- Decision: Highest std dev = most unpredictable coin, requires tighter risk management
