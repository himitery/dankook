'''

프로젝트명
> PyQt5를 이용한 Knight Puzzle 풀이

팀명
> 이자식

팀원
> 산업보안학과    20학번  김준영
> 소프트웨어학과  20학번  이학진

'''

import sys

from PyQt5.QtWidgets import QLCDNumber, QWidget, QDesktopWidget, QPushButton, QLabel, QGridLayout, QMessageBox, QApplication, QDial
from PyQt5.QtGui import *
from PyQt5.QtCore import *

import KnightPuzzleDFS as kp

from string import ascii_lowercase as letters
import time


''' Main Screen '''
class Main(QWidget):
    # 초기 설정
    def __init__(self):
        super().__init__()  # 부모 클래스의 __init__() 호출
        self.status = 0     # 메뉴 선택 상태 (0: 선택 안함)
        self.initUI()       # initUI() 호출

    # 기본 UI 설정
    def initUI(self):
        grid = QGridLayout()  # QGridLayout 객체 생성
        self.setLayout(grid)  # default Layout을 grid(QGridLayout)으로 설정

        image = QLabel(self)  # QLabel 객체 생성
        
        image.setPixmap(QPixmap("KnightPuzzleMain.png")) # image를 KnightPuzzleMain.png의 QPixmap 객체로 설정
        
        # QPushButton 객체 생성
        start = QPushButton("Start", self)
        help = QPushButton("Help", self)
        quit = QPushButton("Quit", self)
        
        # Height의 Maximum을 150으로 설정
        start.setMaximumHeight(150)
        help.setMaximumHeight(150)
        quit.setMaximumHeight(150)
        
        # QPushButton 객체의 font style 설정
        start.setStyleSheet("font: 30pt '고도 M'")
        help.setStyleSheet("font: 30pt '고도 M'")
        quit.setStyleSheet("font: 30pt '고도 M'")
        
        # QPushButton이 클릭되었을 때 이벤트 처리 등록
        start.clicked.connect(self.start)
        help.clicked.connect(self.help)
        quit.clicked.connect(self.close)
        
        # grid(현재 레이아웃)에 Widget(QLabel, QPushButton) 추가
        grid.addWidget(image, 0, 0, 3, 1)
        grid.addWidget(start, 0, 1, 1, 1)
        grid.addWidget(help, 1, 1, 1, 1)
        grid.addWidget(quit, 2, 1, 1, 1)
        
        # Window 기본 설정
        self.setWindowTitle("Knight Puzzle")    # Window의 Title을 Knight Puzzle로 설정
        self.setWindowIcon(QIcon("knight.png")) # Window의 Icon을 knight.png로 설정
        self.setStyleSheet('background:rgb(255,255,255)') # Window의 Background Color를 rgb(255,255,255): White로 설정
        self.resize(1200, 900)  # Window의 크기를 Width: 1200, Height: 900으로 설정
        self.center()   # Window를 화면의 가운데로 위정
        self.show()     # Window를 보이게 함

    # Screen을 화면의 중앙으로 설정
    def center(self):
        qr = self.frameGeometry()   # 창의 위치와 크기 정보를 가져옴
        qp = QDesktopWidget().availableGeometry().center()  # 사용하는 모니터 화면의 가운데 위치 파악
        qr.moveCenter(qp)           # 창의 직사각형 위치를 화면의 중심으로 이동
        self.move(qr.topLeft())     # 현재 창을, 화면의 중심으로 이동했던 직사각형(qr) 위치로 이동

    # Main Screen에서 Start Screen으로 전환
    def start(self):
        self.status = Start()   # status를 Start() 객체로 설정
        self.close()            # Main 종료

    # Main Screen에서 Help Screen으로 전환
    def help(self):
        self.status = Help()    # status를 Help() 객체로 설정
        self.close()            # Main 종료

    # Key 입력 이벤트 처리
    def keyPressEvent(self, event):
        # ESC, 3, Q를 누르면 Main 종료
        if event.key() in [Qt.Key_Escape, Qt.Key_3, Qt.Key_Q]:
            self.close()
        # 1, S를 누르면 start() 호출 -> Start 창으로 전환
        elif event.key() in [Qt.Key_1, Qt.Key_S]:
            self.start()
        # 2, H를 누르면 help() 호출 -> Help 창으로 전환
        elif event.key() in [Qt.Key_2, Qt.Key_H]:
            self.help()

    # 종료 이벤트 처리
    def closeEvent(self, event):
        if self.status == 0:    # 선택된 메뉴가 없을 때에만 MessageBox 생성
            reply = QMessageBox.question(self, "Message", "Are you sure to quit?", QMessageBox.Yes | QMessageBox.No, QMessageBox.No)
            # 해당 Message를 띄운 후 Yes 또는 No의 값을 리턴 받음(초기 값은 No)
            if reply == QMessageBox.Yes:    # Yes를 눌렀다면 종료 이벤트를 실행
                event.accept()
            else:   # No를 눌렀다면 종료 이벤트 무시
                event.ignore()


''' Start Screen '''
class Start(QWidget):
    # 초기 설정
    def __init__(self):
        super().__init__()
        self.status = 0
        self.buttonList = []    # QPushButton 객체를 담을 리스트
        self.count = 1          # pre와 next에 의해 사용된 node의 수
        self.puzzleList = None  # puzzle의 접근 순서를 담을 리스트
        self.initUi()

    # 기본 UI 설정
    def initUi(self):
        # Layout 설정
        self.grid = QGridLayout()
        self.setLayout(self.grid)

        # QLabel 설정
        sizeLabel = QLabel("Size")
        sizeLabel.setStyleSheet("font: 20pt '고도 M'")
        sizeLabel.setAlignment(Qt.AlignCenter)  # 글자를 Label의 중앙으로 위치
        sizeLabel.setMaximumHeight(50)

        # QLCDNumber 설정
        self.sizeLCD = QLCDNumber(self)
        self.sizeLCD.setMaximumHeight(100)
        self.sizeLCD.setStyleSheet("font: 30pt '고도 M'")

        # QLabel 설정
        placeLabel = QLabel("Initial Value")
        placeLabel.setStyleSheet("font: 20pt '고도 M'")
        placeLabel.setAlignment(Qt.AlignCenter)
        placeLabel.setMaximumHeight(50)

        # QLCDNumber 설정
        self.placeLCD = QLCDNumber(self)
        self.placeLCD.setMaximumHeight(100)
        self.placeLCD.setStyleSheet("font: 30pt '고도 M'")

        # QDial 설정
        sizeDial = QDial(self)
        sizeDial.setRange(4, 26)    # Dial 범위를 4에서 26으로 설정
        sizeDial.setWrapping(True)  # 범위의 시작과 끝 사이의 간격을 삭제
        sizeDial.valueChanged.connect(self.sizeLCD.display)   # sizeLCD의 값을 sizeDial의 value로 변경
        
        # QPushButton 설정
        self.previous = QPushButton("Pre")
        self.previous.setStyleSheet("font: 30pt '고도 M'")
        self.previous.setMaximumHeight(100)
        self.previous.setEnabled(False)
        self.previous.clicked.connect(self.selfPrevious)
        
        # QPushButton 설정
        self.next = QPushButton("Next")
        self.next.setStyleSheet("font: 30pt '고도 M'")
        self.next.setMaximumHeight(100)
        self.next.setEnabled(False)
        self.next.clicked.connect(self.selfNext)
        
        # QPushButton 설정
        apply = QPushButton("Apply")
        apply.setStyleSheet("font: 30pt '고도 M'")
        apply.setMaximumHeight(100)
        apply.clicked.connect(self.setButtons)
        
        # QPushButton 설정
        self.auto = QPushButton("Auto")
        self.auto.setStyleSheet("font: 30pt '고도 M'")
        self.auto.setMaximumHeight(100)
        self.auto.setEnabled(False)
        self.auto.clicked.connect(self.autoPlay)
        
        # Size*Size 만큼 생성될 버튼 들이 위치할 새로운 Grid Layout
        self.buttonsGrid = QGridLayout()

        self.grid.addWidget(sizeLabel, 0, 0)
        self.grid.addWidget(self.sizeLCD, 1, 0)
        self.grid.addWidget(placeLabel, 0, 1)
        self.grid.addWidget(self.placeLCD, 1, 1)
        self.grid.addWidget(sizeDial, 0, 2, 2, 1)
        self.grid.addWidget(self.previous, 0, 3, 1, 1)
        self.grid.addWidget(self.next, 0, 4, 1, 1)
        self.grid.addWidget(apply, 1, 3, 1, 1)
        self.grid.addWidget(self.auto, 1, 4, 1, 1)
        self.grid.addLayout(self.buttonsGrid, 2, 0, 5,5)  # 현재의 Layout(grid)에 Layout(buttonGrid)을 추가

        self.setWindowTitle("Knight Puzzle")
        self.setWindowIcon(QIcon("knight.png"))
        self.setStyleSheet('background:rgb(255,255,255)')
        self.resize(1200, 900)
        self.center()
        self.show()

    # Apply Button 이벤트 -> size*size 만큼의 Buttons 생성
    # self.buttonGrid 내에 Buttons 생성
    def setButtons(self):
        # 현재 생성되어 있는 button이 있다면 삭제
        # buttonList는 생성되었던 button들의 정보를 가지고 있다가 button들 수를 늘리거나 줄여야 할때 기존의 button들을 삭제하기 위해 필요
        for button in self.buttonList:
            button.deleteLater()

        self.buttonList.clear()  # buttonList를 비움
        self.count = 1  # 사용된 node의 수를 1로 초기화

        # self.sizeLCD에 표시된 숫자만큼의 행과 열의 크기로 buttons 생성
        for row in range(self.sizeLCD.intValue()):
            for column in range(self.sizeLCD.intValue()):
                button = QPushButton(f"{str(letters[row])}{str(column)}")
                button.setStyleSheet("font:10pt '고도 M'")
                button.setMaximumSize(1000, 1000)
                button.setMinimumSize(60, 50)
                button.setCheckable(True)       # button을 누른 상태와 누르지 않은 상태 구분
                button.clicked.connect(self.setStartButton)
                self.buttonList.append(button)  # buttonList에 button 추가
                self.buttonsGrid.addWidget(self.buttonList[-1], row, column+1)  # buttonGrid에 button 추가
        self.puzzleList = None  # puzzleList를 None으로 초기화
        self.center()

    # setButtons에서 생성된 Button 이벤트 -> 해당 Button을 시작 주소(Start)로 설정
    def setStartButton(self):
        # 현재 설정된 button들 중 선택된 button을 찾음
        for button in self.buttonList:
            if button.isChecked():
                startButton = button.text()  # 선택된 button의 텍스트를 가져옴
                # button의 정보를 self.placeLCD에 표시
                self.placeLCD.display(startButton)
                button.toggle()  # button의 상태를 바꿈

        # node의 시작 위치 설정
        self.start = [ord(startButton[0])-ord('a'), int(startButton[1])]

        # button 활성화
        self.previous.setEnabled(True)
        self.next.setEnabled(True)
        self.auto.setEnabled(True)

    # 이전 퍼즐로 돌아감
    def selfPrevious(self):
        # puzzleList의 정보가 없다면 KnightPuzzleDFS로부터 리스트를 가져와 puzzleList에 저장
        if self.puzzleList is None:
            self.puzzleList = kp.App(self.start, self.sizeLCD.intValue()).main()

        self.auto.setEnabled(False)     # auto button 비활성화
        if self.puzzleList is False:    # puzzle의 경로를 찾을 수 없다면 cannotFind() 호출
            self.cannotFind()
        else:  # 최근 node의 button의 상태를 이전으로 되돌림
            self.count -= 1
            puzzle = self.puzzleList[self.count-1]
            self.buttonList[puzzle[0] * self.sizeLCD.intValue()+puzzle[1]].setStyleSheet("font:10pt '고도 M'")
            self.buttonList[puzzle[0] * self.sizeLCD.intValue()+puzzle[1]].repaint()

    # 다음 퍼즐을 찾음
    def selfNext(self):
        self.auto.setEnabled(False)
        if self.puzzleList is None:
            self.puzzleList = kp.App(self.start, self.sizeLCD.intValue()).main()

        if self.puzzleList is False:
            self.cannotFind()
        # puzzle의 다음 node의 button을 변경(사용되었다는 표시)
        elif self.count != len(self.puzzleList) + 1:
            puzzle = self.puzzleList[self.count-1]
            self.buttonList[puzzle[0] * self.sizeLCD.intValue()+puzzle[1]].setStyleSheet(f"font: 13pt'고도 M';color:rgb(255, 255, 255);background-color: #{hex(0x1000ff+0x300*self.count)[2:]}")
            self.buttonList[puzzle[0] * self.sizeLCD.intValue()+puzzle[1]].repaint()
            self.count += 1

    # 자동으로 모든 퍼즐을 찾아 순서대로 표시
    def autoPlay(self):
        if self.puzzleList is None:
            self.puzzleList = kp.App(
                self.start, self.sizeLCD.intValue()).main()

        if self.puzzleList is False:
            self.cannotFind()
        else:  # 반복문을 이용하여 차례로 수행
            for puzzle in self.puzzleList:
                button = self.buttonList[puzzle[0] * self.sizeLCD.intValue()+puzzle[1]]
                button.setStyleSheet(f"font: 13pt'고도 M';color:rgb(255, 255, 255);background-color: #{hex(0x1000ff+0x300*self.count)[2:]}")
                button.repaint()
                self.count += 1
                time.sleep(0.2)

        self.auto.setEnabled(False)

    # 퍼즐의 경로를 찾지 못한 경우
    def cannotFind(self):
        # 모든 button들을 주활색으로 변경(경로를 찾지 못했거나 오래걸렸다는 의미)
        for button in self.buttonList:
            button.setStyleSheet(f"font: 13pt'고도 M';color:rgb(255, 255, 255);background-color: #ff6200")
        
        # button 비활성화
        self.auto.setEnabled(False)
        self.previous.setEnabled(False)
        self.next.setEnabled(False)

        # puzzleList 초기화
        self.puzzleList = None

    # Screen을 화면의 중앙으로 설정
    def center(self):
        qr = self.frameGeometry()
        qp = QDesktopWidget().availableGeometry().center()
        qr.moveCenter(qp)
        self.move(qr.topLeft())

    # Key 입력 이벤트 처리
    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            self.status = Main()
            self.close()

    # 종료 이벤트 처리
    def closeEvent(self, event):
        if self.status == 0:
            reply = QMessageBox.question(self, "Message", "Are you sure to quit?", QMessageBox.Yes | QMessageBox.No, QMessageBox.No)
            if reply == QMessageBox.Yes:
                event.accept()
            else:
                event.ignore()


''' Help Screen '''
class Help(QWidget):
    # 초기 설정
    def __init__(self):
        super().__init__()
        self.status = 0
        self.buttonList = []
        self.initUi()

    # 기본 UI 설정
    def initUi(self):
        image = QLabel(self)
        image.setPixmap(QPixmap("KnightPuzzleHelp.png").scaledToHeight(900))    # image의 비율을 유지하며 높이를 900으로 설정
        image.move(0, 0)

        self.setWindowTitle("Knight Puzzle")
        self.setWindowIcon(QIcon("knight.png"))
        self.setStyleSheet('background:rgb(255,255,255)')

        self.resize(image.sizeHint().width(), image.sizeHint().height())        # image의 넓이와 높이만큼 Window 사이즈 조절
        self.center()
        self.show()

    # Screen을 화면의 중앙으로 설정
    def center(self):
        qr = self.frameGeometry()
        qp = QDesktopWidget().availableGeometry().center()
        qr.moveCenter(qp)
        self.move(qr.topLeft())

    # Key 이벤트 처리
    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            self.status = Main()
            self.close()

    # 종료 이벤트 처리
    def closeEvent(self, event):
        if self.status == 0:
            reply = QMessageBox.question(self, "Message", "Are you sure to quit?", QMessageBox.Yes | QMessageBox.No, QMessageBox.No)

            if reply == QMessageBox.Yes:
                event.accept()
            else:
                event.ignore()


if __name__ == "__main__":
    # manages the GUI application's control and main settings.
    app = QApplication(sys.argv)
    knightPuzzle = Main()           # Main() 객체 생성
    sys.exit(app.exec_())           # QApplication을 종료하면서 프로그램 종료
