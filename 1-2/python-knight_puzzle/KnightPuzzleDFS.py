'''

프로젝트명
> PyQt5를 이용한 Knight Puzzle 풀이

팀명
> 이자식

팀원
> 산업보안학과    20학번  김준영
> 소프트웨어학과  20학번  이학진

'''

import datetime

''' Singly Linked List '''
class NodeList:
    # Node Class
    class Node:
        # 초기 설정
        def __init__(self, node, nodeList, next=None):
            self.node = node
            self.nodeList = nodeList
            self.next = next

    # 초기 설정
    def __init__(self, node, nodeList):
        self.head = None                # head는 현재의 노드를 가리키며 초기 값은 None
        self.insertNode(node, nodeList) # 파라미터로 전달 받은 값으로 새로운 노드를 생성

    # Node 생성
    def insertNode(self, node, nodeList):
        self.head = self.Node(node, nodeList, self.head)    # head에 새로운 Node를 지정

    # Node 삭제
    def deleteNode(self):
        if self.head is not None:   # head가 None이 아니라면, 즉 노드가 존재한다면
            self.head = self.head.next  # head에 다음 Node를 지정

    # Node.nodeList 값 변경
    def changeNodeList(self, newNodeList):
        self.head.nodeList = newNodeList    # 현재 노드의 nodeList의 값을 새로운 newNodelist 값으로 변경


''' DFS(Depth-First Search) Algorithm '''
class App:
    # 초기 설정
    def __init__(self, start, size):
        self.start = start
        self.size = size
        self.nodes = [start]    # 사용된 노드들의 순서를 담으며, 시작 값은 start
        self.node = NodeList(start, self.getReferencealbeNodes(start))  # NodeList 객체
        self.time = datetime.datetime.now() + datetime.timedelta(seconds=3) # 현재의 시간에 3초 후의 시간

    # 경로 찾음
    def main(self):
        while len(self.nodes) != self.size**2 and self.node.head is not None:   # 사용한 노드의 개수가 size**2가 아니고 head가 None이 아닐 때까지 반복
            if len(self.node.head.nodeList) != 0:   # 현재 노드의 nodeList의 길이가 0이 아니라면 setNode() 실행
                self.setNode()
            else:   # 현재 노드의 nodeList의 길이가 0이라면 nodeList 객체의 deleteNode() 메소드 실행
                self.node.deleteNode()
                del self.nodes[-1]  # 사용된 노드에서 제외
            if self.time <= datetime.datetime.now():    # 만약 App을 실행하고 3초가 지났다면 시간 초과로 가정하고 종료
                return False
        return self.nodes   # 노드의 순서를 반환

    # 현재 Node에서 참조 가능한 Nodes를 찾음
    def getReferencealbeNodes(self, node):
        x = [1, 2, 2, 1, -1, -2, -2, -1]    # 현재의 노드로부터 x 값의 차이
        y = [2, 1, -1, -2, -2, -1, 1, 2]    # 현재의 노드로부터 y 값의 차이

        referenceableNodes = [] # 참조 가능한 노드들을 저장할 리스트 선언
        for reference in range(8):  # 8회 반복
            # x, y의 각 인덱스의 값을 현재의 노드 위치에 더해가며 참조 가능한지 확인
            xReference = node[0] + x[reference]
            yReference = node[1] + y[reference]
            if xReference in range(self.size) and yReference in range(self.size):   # size의 범위 내에 있는지 확인
                if [xReference, yReference] not in self.nodes:  # 이미 사용된 노드인지 확인
                    referenceableNodes.append([xReference, yReference]) # 참조 가능한 노드에 추가
        return referenceableNodes   # 참조 가능한 노드들 반환

    # 다음 Node 설정
    def setNode(self):
        referenceableNodes = self.node.head.nodeList    # 참조 가능한 노드는 현재의 노드의 nodeList
        node = referenceableNodes[0]    # node에 참조 가능한 노드들 중 첫 번째 값을 저장
        if len(referenceableNodes) != 1:    # 참조 가능한 노드의 개수가 1이 아니라면
            for referenceableNode in referenceableNodes[1:]:    # 참조 가능한 노드의 첫 번째 값을 제외한 모든 값을 대상으로
                if len(self.getReferencealbeNodes(referenceableNode)) < len(self.getReferencealbeNodes(node)):  # node의 값과 참조 가능한 노드들의 값을 비교하여 getRefercealbeNodes()의 리턴 값의 길이가 더 작은 값을 node로 설정
                    node = referenceableNode
        newNodeList = self.node.head.nodeList   # newNodeList에 현재의 nodeList 값을 저장
        del newNodeList[newNodeList.index(node)]    # newNodeList에서 node를 제외
        self.node.changeNodeList(newNodeList)   # newNodeList를 현재 노드의 nodeList 값으로 변경
        self.node.insertNode(node, self.getReferencealbeNodes(node))    # 새로운 노드 추가
        self.nodes.append(node) # 사용한 노드에 새로 추가된 노드를 추가
