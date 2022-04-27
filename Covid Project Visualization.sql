--Queries used for Tableau Project


--1.
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS INT)) AS total_deaths, SUM(cast(new_deaths AS INT))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject.dbo.[Covid Death]
WHERE continent is not null
ORDER BY 1,2


--"International Location
SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject.dbo.[Covid Death]
WHERE location = 'World'
ORDER BY 1,2
--2

SELECT location, SUM(CAST(new_deaths AS INT)) AS totalDeathCount
FROM PortfolioProject.dbo.[Covid Death]
WHERE continent is null
and location not in ('World', 'European Union', 'International', 'Upper middle income','high income', 'lower middle income', 'low income')
GROUP BY location
ORDER BY totalDeathCount DESC


--3

SELECT location, Population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.[Covid Death]
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC

--4
SELECT Location, Population, date, MAX(Total_cases) as HighestInfectionCount, MAX(total_cases/population)*100 AS PercentagePopulationInfected
FROM PortfolioProject.dbo.[Covid Death]
GROUP BY location, population, date
ORDER BY PercentagePopulationInfected DESC


