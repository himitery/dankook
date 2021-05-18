"""
    소프트웨어학과 20학번 이학진

    Python Version: 3.9.5
"""

import sys
import pymysql
from PyQt5.QtWidgets import *

import json

from pymysql.cursors import Cursor


class App(QWidget):
    def __init__(self) -> None:
        super().__init__()
        with open("./.assignment_2.env.json", "r") as f:
            connectionInfo = json.loads(f.read())

            host: str = connectionInfo["host"]  # localhost
            user: str = connectionInfo["user"]  # root
            password: str = connectionInfo["password"]
            database: str = connectionInfo["database"]  # world

            self.connection = pymysql.connect(
                host=host, user=user, password=password, database=database
            )
        self.initUI()

    def initUI(self) -> None:
        gridLayout = QGridLayout()

        countryNameLabel = QLabel("Country name")
        continentLabel = QLabel("Continent")
        populationLabel = QLabel("Population")
        GNPLabel = QLabel("GNP")
        capitalCityLabel = QLabel("Capital city")
        languageLabel = QLabel("Language")

        self.countryNameText = QTextEdit()
        self.continentText = QTextEdit()
        self.populationText = QTextEdit()
        self.GNPText = QTextEdit()
        self.capitalCityText = QTextEdit()
        self.languageText = QTextEdit()

        self.countryNameText.setFixedWidth(200)
        self.continentText.setFixedWidth(200)
        self.populationText.setFixedWidth(200)
        self.GNPText.setFixedWidth(200)
        self.capitalCityText.setFixedWidth(200)
        self.languageText.setFixedWidth(200)

        self.countryNameText.setFixedHeight(30)
        self.continentText.setFixedHeight(30)
        self.populationText.setFixedHeight(30)
        self.GNPText.setFixedHeight(30)
        self.capitalCityText.setFixedHeight(30)
        self.languageText.setFixedHeight(30)

        queryButton = QPushButton("Query")
        queryButton.clicked.connect(self.selectQuery)

        gridLayout.addWidget(countryNameLabel, 0, 0)
        gridLayout.addWidget(continentLabel, 1, 0)
        gridLayout.addWidget(populationLabel, 2, 0)
        gridLayout.addWidget(GNPLabel, 3, 0)
        gridLayout.addWidget(capitalCityLabel, 4, 0)
        gridLayout.addWidget(languageLabel, 5, 0)

        gridLayout.addWidget(self.countryNameText, 0, 1)
        gridLayout.addWidget(self.continentText, 1, 1)
        gridLayout.addWidget(self.populationText, 2, 1)
        gridLayout.addWidget(self.GNPText, 3, 1)
        gridLayout.addWidget(self.capitalCityText, 4, 1)
        gridLayout.addWidget(self.languageText, 5, 1)

        gridLayout.addWidget(queryButton, 0, 2)

        self.setLayout(gridLayout)
        self.setWindowTitle("Country Info")
        self.setGeometry(300, 300, 480, 250)
        self.show()

    def selectQuery(self) -> None:
        countryName: str = self.countryNameText.toPlainText()
        countryName: str = countryName.strip()

        if len(countryName) == 0 or not countryName:
            return None

        cursor: Cursor = self.connection.cursor()

        sql: str = f"""
        SELECT code, continent, population, gnp, capital
        FROM country
        WHERE name = '{countryName}'
        """
        cursor.execute(sql)

        countryData = cursor.fetchall()
        if len(countryData) == 0:
            self.countryNameText.setText("")
            self.continentText.setText("")
            self.populationText.setText("")
            self.GNPText.setText("")
            self.capitalCityText.setText("")
            self.languageText.setText("")
            return None
        (
            code,
            continent,
            population,
            gnp,
            capital,
        ) = countryData[0]

        self.continentText.setText(f"{continent}")
        self.populationText.setText(f"{population}")
        self.GNPText.setText(f"{gnp}")

        sql: str = f"""
        SELECT name
        FROM city
        WHERE id = '{capital}'
        """

        cursor.execute(sql)
        cityData = cursor.fetchall()
        (city,) = cityData[0]

        self.capitalCityText.setText(f"{city}")

        sql: str = f"""
        SELECT language
        FROM countrylanguage
        WHERE countrycode = '{code}' AND isOfficial = true;
        """

        cursor.execute(sql)
        languageData = cursor.fetchall()
        language = [data[0] for data in languageData]

        self.languageText.setText(f"{', '.join(language)}")

        cursor.close()

    def closeEvent(self, event) -> None:
        self.connection.close()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    assignment_2 = App()
    sys.exit(app.exec_())
