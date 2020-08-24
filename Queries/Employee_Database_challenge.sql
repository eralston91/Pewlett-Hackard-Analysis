
select Employees.emp_no,
	Employees.first_name,
	Employees.last_name,
	Titles.title,
	Titles.from_date,
	Titles.to_date
into retirement_titles
from Employees
left join Titles
on Employees.emp_no = Titles.emp_no
where (birth_date between '1952-01-01' AND '1955-12-31')
group by Employees.emp_no,Titles.title,Titles.from_date,Titles.to_date
order by Employees.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select count(title),title 
into retiring_titles
from unique_titles
group by title
order by count desc

