SELECT *
FROM customers
-- customers without phone number
WHERE phone IS NULL

-- customers with phone number
-- WHERE phone IS NOT NULL