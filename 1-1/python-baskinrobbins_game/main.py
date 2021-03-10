from tkinter import *   # tkinter 라이브러리 호출
import random           # random 라이브러리 호출
import time             # time 라이브러리 호출

global num, win, lose   # 전역변수 num, win, lose 선언
num=0                   # num을 0으로 초기화
win=0                   # win을 0으로 초기화
lose=0                  # lose를 0으로 초기화

def b1():   # b1 메소드 : startGame에서 버튼을 클릭하는 이벤트 발생 시 실행
    global num, lose    # 전역 변수 num과 lose 선언(사용)
    num+=1  # num의 값에 1을 더함
    label.config(text="번호 : " + str(num)) # label의 속성 값 변경
    button1.config(text=num + 1)            # button1의 속성 값 변경
    button2.config(text=num + 2)            # button2의 속성 값 변경
    button3.config(text=num + 3)            # button3의 속성 값 변경
    if num>=31:                             # num의 값이 31 이상이라면(게임이 종료되는 상황)
        label.config(text="lose")           # label의 속성 값 변경
        lose+=1                             # lose의 값에 1을 더함 : 사용자가 선택하여 31 이상이 되었기 때문
        time.sleep(1)                       # 1초간 멈춤
        addEndButton()                      # addEndButton 메소드 호출
    else:                                   # num의 값이 31 이상이 아니라면(게임이 진행되는 상황)
        computer()                          # computer 메소드 실행 : 컴퓨터가 숫자를 선택할 차례

def b2():   # b2 메소드 : startGame에서 버튼을 클릭하는 이벤트 발생 시 실행
    global num, lose
    num += 2
    label.config(text="번호 : " + str(num))
    button1.config(text=num + 1)
    button2.config(text=num + 2)
    button3.config(text=num + 3)
    if num>=31:
        label.config(text="lose")
        lose+=1
        time.sleep(1)
        addEndButton()
    else:
        computer()

def b3():   # b3 메소드 : startGame에서 버튼을 클릭하는 이벤트 발생 시 실행
    global num, lose    
    num += 3
    label.config(text="번호 : " + str(num))
    button1.config(text=num + 1)
    button2.config(text=num + 2)
    button3.config(text=num + 3)
    if num>=31:
        label.config(text="lose")
        lose+=1
        time.sleep(1)
        addEndButton()
    else:
        computer()

def addEndButton(): # addEndButton 메소드 : 게임이 끝났을 때 실행
    button1.pack_forget()   # button1 삭제
    button2.pack_forget()   # button2 삭제
    button3.pack_forget()   # button3 삭제
    endButton = Button(start, text="exit", height=10, command=start.destroy)    # endButton의 Button 객체 생성 : 클릭시 start Tk 객체 종료
    endButton.pack(side="top", fill="both") # endButton을 화면에 배치

def computer(): # computer 메소드 : 컴퓨터가 숫자를 선택하는 상황
    global num, win # 전역 변수 num과 win 선언(사용)

    if num==30: # num의 값이 30이면 : 컴퓨터가 무엇을 선택하든 패배가 확정된 상황
        label.config(text="win")    # label의 속성 값 변경
        win+=1                      # wind의 값에 1을 더함
        time.sleep(1)               # 1초간 멈춤
        addEndButton()              # addEndButton 메소드 호출
    else:       # num의 값이 30이 아니라면
        if num % 4 == 2:    # num의 값을 4로 나눈 나머지가 2라면
            num += random.randint(1, 3) # 1~3의 숫자 중 랜덤으로 선택하여 num에 더함
        else:               # num의 값을 4로 나눈 나머지가 2가 아니라면
            while (True):   # 무한 반복
                num += 1    # num의 값에 1을 더함
                if num % 4 == 2:    # num을 4로 나눈 나머지의 값이 2가 된다면
                    break   # while문 탈출

        label.config(text="번호 : " + str(num))   # label의 속성 값 변경
        button1.config(text=num + 1)    # button1의 속성 값 변경
        button2.config(text=num + 2)    # button2의 속성 값 변경
        button3.config(text=num + 3)    # button3의 속성 값 변경

def startGame():    # startGame 메소드 : 게임을 실행하는 메소드
    global num, start   # 전역 변수 num과 start 선언(사용)
    num=0   # num을 0으로 초기화
    start = Tk()    #Tk 클래스의 start 객체 생성
    start.geometry("500x100+100+100")   # 윈도우의 창의 너비와 높이, 화면 위치 좌표 설정
    start.resizable(False, False)       # 윈도우 창의 크기 조절 불가능하게 설정
    start.title("Start Game")           # 윈도우 창의 제목 설정

    labelText = "번호 : " + str(num)      # labelText에 해당 내용을 저장
    global label    # 전역변수 label 선언
    label = Label(start, text=labelText,  relief=SOLID) # 레이블 생성
    label.pack(side="top", fill="x")                    # 레이블을 화면에 배치

    global button1  # 전역변수 button1 선언
    global button2  # 전역변수 button2 선언
    global button3  # 전역변수 button3 선언

    button1 = Button(start, text=num+1, overrelief="solid", width=23, height=5, command=b1) # 버튼 생성
    button1.pack(side="left")   # 버튼을 화면에 배치
    button2 = Button(start, text=num+2, overrelief="solid", width=23, height=5, command=b2) # 버튼 생성
    button2.pack(side="left")   # 버튼을 화면에 배치
    button3 = Button(start, text=num+3, overrelief="solid", width=23, height=5, command=b3) # 버튼 생성
    button3.pack(side="left")   # 버튼을 화면에 배치

    start.mainloop()    # start 객체의 mainloop 메소드 호출

def score():    # score 메소드 : 현재 점수 출력
    global win, lose    # 전역 변수 win, lose 선언(사용)
    score = Tk()
    score.title("Score")
    score.geometry("500x300+100+100")
    score.resizable(False, False)

    scoreLabelText = "win : " + str(win) + "\tlose : " + str(lose)
    scoreLabel = Label(score, text="Score", height=3, relief=SOLID)
    scoreLabel.pack(side="top", fill="x")

    checkButton = Button(score, text="확인", height=3, relief=SOLID, command=score.destroy)
    checkButton.pack(side="bottom", fill="x")

    winLose = Label(score, text=scoreLabelText, height=13, relief=SOLID)
    winLose.pack(fill="both")

def main(): # main 메소드 : 프로그램의 메인
    root = Tk()
    root.title("Baskin Robins 31 Game")
    root.geometry("500x500+100+100")
    root.resizable(False, False)

    titleLabel = Label(root, text="Baskin Robins 31 Game", width=20, height=4, relief=SOLID)
    titleLabel.pack(side="top", fill="x")

    menuLabel = Label(root, text="메뉴", width=20, height=3, relief=SOLID)    # 메뉴라는 이름의 라벨 설정
    menuLabel.pack(side="left", fill="y")   # 윈도우 창의 왼쪽에 y로 채워 배치

    menuButton1 = Button(root, text="게임 시작", width=20, height=9, relief=SOLID, command=startGame)   # 게임시작 버튼을 누르면 startGame 메소드 호출
    menuButton1.pack(side="top", fill="x")  # 윈도우 창의 위에 x로 채워 배치

    menuButton2 = Button(root, text="점수", width=20, height=9, relief=SOLID, command=score)  # 점수 버튼을 누르면 score 메소드 호출
    menuButton2.pack(side="top", fill="x")  # 윈도우 창의 위에 x로 채워 배치

    menuButton3 = Button(root, text="끝내기", width=20, height=9, relief=SOLID, command=root.destroy)  # 끝내기 버튼을 누르면 root 객체 종료
    menuButton3.pack(side="top", fill="x")  # 윈도우 창의 위에 x로 채워 배치

    root.mainloop() # root 객체의 mainloop 메소드 호출

main()  # main 메소드 호출
