/* 
This HR dataset was downloaded from Kaggle for practice purposes, i do not own the data.
 */

-- General view of the dataset columns
SELECT *
 FROM `rich-store-444522-s9.HR_Data_Analysis.HR_Raw_Data` 

-- Some column names have space between them like Employee ID, i will update it to be EmployeeID
alter table `rich-store-444522-s9.HR_Data_Analysis.HR_Raw_Data` 
 rename column `Employee ID` to EmployeeID,
 rename column `Performance Score` to PerformanceScore,
 rename column `Current Employee Rating` to CurrentEmployeeRating,
 rename column `Survey Date` to SurveyDate,
 rename column `Satisfaction Score` to SatisfactionScore,
 rename column `Work-Life Balance Score` to Work_Life_Balance_Score,
 rename column `Training Date` to TrainingDate,
 rename column `Training Outcome` to TrainingOutcome,
 rename column `Training Duration_Days_` to Training_Duration_Days,
 rename column `Training Cost` to TrainingCost

-- The age column is not clear if its the employee age upon hiring, i will calculate the age and compare it

select 
  Age,
  (extract(year from startdate)-extract(year from DOB)) as Age_hiring
from `rich-store-444522-s9.HR_Data_Analysis.HR_Raw_Data` 

-- Age column is the the employee age when hired, my calculation are exact match.

-- Let's see if there is null value 

select *
from  `rich-store-444522-s9.HR_Data_Analysis.HR_Raw_Data` 
where EmployeeID is null

select *
from  `rich-store-444522-s9.HR_Data_Analysis.HR_Raw_Data` 
where EmployeeType is null

-- Let's see employee terminated
select *
from HR_Data_Analysis.HR_Raw_Data
where EmployeeStatus = 'Terminated'

select 
    Title,
    DepartmentType,
    State,
    GenderCode,
    MaritalDesc,
    count(EmployeeStatus) as TerminatedCount
from HR_Data_Analysis.HR_Raw_Data
where EmployeeStatus = 'Terminated'
group by 1,2,3,4,5
order by 1

select 
    GenderCode,
    count(EmployeeStatus) as TerminatedCount
from HR_Data_Analysis.HR_Raw_Data
where EmployeeStatus = 'Terminated'
group by 1
order by 1


-- let's take a look at performance Score

select *
from `rich-store-444522-s9.HR_Data_Analysis.HR_Raw_Data` 
where PerformanceScore = 'Fully Meets'

--No more data cleaning needed, i will download the updated data and use tableau for visualization 
