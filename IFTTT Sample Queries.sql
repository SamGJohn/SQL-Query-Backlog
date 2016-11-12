SELECT `Channel Name`, 
`users_activated`, `users_enabled`
FROM Channels 
WHERE `category_name` = 'Connected Home'
ORDER BY

SELECT `Channel Name`, 
`User Daily Run`, `num_recipe_runs` 
FROM Channels 
ORDER BY `User Daily Run` DESC

SELECT `Channel Name`, 
`users_activated` 
FROM Channels 
WHERE `num_actions` < 1 
ORDER BY users_activated DESC

SELECT `Channel Name`, 
`users_activated` 
FROM Channels 
WHERE `num_triggers` < 1 
ORDER BY users_activated DESC

SELECT `Channel Name`, 
`users_enabled` 
FROM Channels 
WHERE `num_triggers` < 1 
ORDER BY users_enabled DESC

SELECT `Channel Name`, `users_enabled` 
FROM Channels 
ORDER BY users_enabled DESC

SELECT `category_name`, 
sum(`users_enabled`) AS 'Active Users'
FROM Channels
GROUP BY category_name
ORDER BY 'Active Users' DESC

SELECT `Channel Name`, `num_recipe_runs`/users_enabled AS 'runs per user'
FROM Channels
ORDER BY 'runs per user' DESC

SELECT `Channel Name`, users_enabled, `num_recipe_runs`
FROM Channels
ORDER BY users_enabled, num_recipe_runs DESC

SELECT `category_name`, `Channel Name`, 
`users_enabled`
FROM Channels  
ORDER BY category_name, users_enabled DESC

SELECT `category_name`, `Channel Name`, `users_enabled`
FROM Channels  
GROUP BY category_name
ORDER BY users_enabled DESC

SELECT `category_name`, 
`users_activated`
FROM Channels  
GROUP BY category_name
ORDER BY users_activated DESC

SELECT `category_name`, 
`users_activated`
FROM Channels  
ORDER BY category_name, users_activated DESC

SELECT `category_name`, `Channel Name` , 
`users_activated`
FROM Channels  
ORDER BY category_name, users_activated DESC