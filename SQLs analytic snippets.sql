 select * from (select EMPNO,ENAME,DEPTNO,sal,DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal asc) as salrank from scott.emp) where salrank = 2;
 --pokaz wszystkie 2 w kolejnosci rosnacej sal w swoim deptno z roznych deptno
select DENSE_RANK(1260) WITHIN GROUP (partition by deptno order by sal asc)  from scott.emp;
--pokaz pozycje wartosci 1260 w zbiorze partycji deptno danego wiersza uporzadkowanej wg. sal rosnace
select sal,sum(sal) over (ORDER BY sal asc ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) from scott.emp ;
--pokaz sume sal 3 wierszy poprzedniego najwiekszego sal,biezacego sal i nastepnego wg. sal)
select sal,empno,deptno,max(sal) over (partition by deptno order by sal asc) from scott.emp;
--pokaz dotychczas najwieksza sal, w partycji deptno=deptno danego wiersza, uporzadkowane wg. sal

select sal,deptno,LAG/LEAD(sal,1) over(order by sal) as sal_off from scott.emp; 
--pokaz wartosc sal z poprzedniego/nastepnego o 1 wiersza, przy zalozeniu ze sa posortowane wg. sal
select  sal,deptno,count(sal) over (order by sal) from scott.emp;
--pokaz kt�rym kolejnym unikalnym wyst�pieniem przy sortowaniu wg. sal jest bie��cy wiersz
select empno,ename,deptno,sal,row_number() over (partition by deptno order by sal asc) from scott.emp; 
--pokaz dla kazdego numer w hierarchi danego deptno wg. wynagrodz.
---noi poszło ?
