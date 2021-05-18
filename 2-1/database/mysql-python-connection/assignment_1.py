"""
    소프트웨어학과 20학번 이학진

    Python Version: 3.9.5
"""


import pymysql
import json


class App:
    def __init__(self) -> None:
        with open("./.assignment_1.env.json", "r") as f:
            connectionInfo = json.loads(f.read())

            host: str = connectionInfo["host"]  # localhost
            user: str = connectionInfo["user"]  # root
            password: str = connectionInfo["password"]
            database: str = connectionInfo["database"]  # my_db

            self.connection = pymysql.connect(
                host=host, user=user, password=password, database=database
            )

    def selectQuery(self, sql: str) -> any:
        cursor = self.connection.cursor()
        cursor.execute(sql)

        data = cursor.fetchall()
        cursor.close()

        return data

    def printData(self, fetchData: tuple) -> None:
        data: list = [d[0] for d in fetchData]
        print(" " * 2 + ", ".join(data), end="\n\n")

    def disconnect(self) -> None:
        self.connection.close()


if __name__ == "__main__":
    app = App()


# 1
print("> 사원번호가 7521인 사원의 이름을 출력한다.")

soultion_1: tuple = app.selectQuery(
    """
    SELECT ename
    FROM emp
    WHERE empno = 7521
    """
)

app.printData(soultion_1)


# 2
print("> 이름이 SCOTT 인 사원의 부서이름을 출력한다.")

soultion_2: tuple = app.selectQuery(
    """
    SELECT dept.dname
    FROM dept
    INNER JOIN emp ON emp.deptno = dept.deptno
    WHERE emp.ename = "SCOTT"
    """
)

app.printData(soultion_2)

# 3
print("> 담당업무가 SALESMAN 인 모든사원의 이름을 출력한다.")

soultion_3: tuple = app.selectQuery(
    """
    SELECT ename
    FROM emp
    WHERE job = "SALESMAN"
    """
)

app.printData(soultion_3)

# 4
print("> 모든 부서의 이름을 출력한다.")

soultion_4: tuple = app.selectQuery(
    """
    SELECT dname
    FROM dept
    """
)
app.printData(soultion_4)

app.disconnect()
