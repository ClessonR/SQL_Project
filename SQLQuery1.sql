--Select * from FirstPortfolioProject..CovidDeaths
--order by 3,4

--Select * from FirstPortfolioProject..CovidVaccinations
--order by 3,4


--Selecting Data Section

--Select location, date, total_cases, new_cases, total_deaths, population
--from FirstPortfolioProject..CovidDeaths
--order by location, date


-- Finding out the death ratio per day in Brazil vs United States ( USA was more effective to retain the death_ratio than Brazil which got more deaths with less infections overall. )
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Ratio
from FirstPortfolioProject..CovidDeaths
where total_deaths/total_cases*100 > 1 and location like '%brazil'

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Ratio
from FirstPortfolioProject..CovidDeaths
where total_deaths/total_cases*100 > 1 and location like '%United States'



Select location, date,population ,total_cases, (total_cases/population)*100 as Infected_Percentage
from FirstPortfolioProject..CovidDeaths
where total_deaths/total_cases*100 > 1 and location like '%brazil'
order by 1, 2

--Countries with Highest Infetion Rate compared to Population	

Select location,population ,MAX(total_cases) as highestinfection, (MAX(total_cases)/population)*100 as Infected_Percentage
from FirstPortfolioProject..CovidDeaths
GROUP BY population, location
order by Infected_Percentage DESC

--Countries with the Highest Death Rates per population	

Select continent, MAX(CAST(Total_deaths as int)) as TotalDeathCount
from FirstPortfolioProject..CovidDeaths
Where continent is not null
GROUP BY continent
order by TotalDeathCount DESC

--Querying Global Numbers

Select date, SUM(new_cases) as Cases_p_day,SUM(CAST(new_deaths as int)) as deaths_p_day,SUM(CAST(new_deaths as int))/SUM(new_cases)*100  as death_percentage -- total_deaths, (total_deaths/total_cases)*100 as Death_Ratio
from FirstPortfolioProject..CovidDeaths
Where continent is not null
Group by date
order by 1,2

--Total Population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new 
from FirstPortfolioProject..CovidDeaths dea
Join FirstPortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date

