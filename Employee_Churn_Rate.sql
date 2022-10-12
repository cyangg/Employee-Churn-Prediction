#Problems:

#1.Yearly turnover/churn Rate
#2.Top 10 turnover stores, top 10 city.
#3.Gender & Age.
#4.Most popular termination reason.


--1.
with c1(Year, Total) as(
select STATUS_YEAR, count(status)
from Churn.Dataset
group by STATUS_YEAR),
c2(Year, Terminated) as(
select STATUS_YEAR, count(status)
from Churn.Dataset
where status='TERMINATED'
group by STATUS_YEAR)
select c1.Year, round(cast (Terminated as float)/cast (Total as float)*100,2) 
as Turnover_Rate
from c1 join c2 on c1.Year=c2.Year
order by 1;

--2.
with c1(Department, Total) as(
select department_name, count(status)
from Churn.Dataset
group by department_name),
c2(Department, Terminated) as(
select department_name, count(status)
from Churn.Dataset
where status='TERMINATED'
group by department_name)
select top(10) c1.Department, round(cast (Terminated as float)/cast (Total as float)*100,2)
as Turnover_Rate
from c1 join c2 on c1.Department=c2.Department
order by 2 desc;

with c1(City, Total) as(
select city_name, count(status)
from Churn.Dataset
group by city_name),
c2(City, Terminated) as(
select city_name, count(status)
from Churn.Dataset
where status='TERMINATED'
group by city_name)
select top(10) c1.City, round(cast (Terminated as float)/cast (Total as float)*100,2)
as Turnover_Rate
from c1 join c2 on c1.City=c2.City
order by 2 desc;

--4.
select termreason_desc, count(termreason_desc)
from churn.Dataset
group by termreason_desc;

select job_title
from churn..Dataset
where job_title like '%Analyst';













