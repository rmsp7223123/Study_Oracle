[연습문제3-4]

1. 사원의 사번, 이름, 부서, 매니저번호를 조회하는 쿼리문을 작성한다
(단, 매니저가 있는 사원은 매니저, 매니저가 없는 사원은 No Manager라 표시하도록 한다)
--
SELECT
    employee_id, department_id, NVL2(manager_id, 'Manager', 'No Manager') AS manager
FROM
    employees;