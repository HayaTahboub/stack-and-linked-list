class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;
  
  void printInRevers() {
    if (next == null) {
      print('$value');
      return;
    }
    next?.printInRevers();
    print('$value');
  }
  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
  
  void findTheMid(){
    if(next == null){
      print( value);
    }
    
    Node<T>? current = next;
    Node<T>? prev = next;
    while (current?.next != null && current?.next?.next != null ){
       prev = prev?.next;
       current = current?.next?.next;
    }
    print(prev?.value);
  }
  
  static Node<T>? reverseLinkedList<T>(Node<T>? linklist) {
    Node<T>? prev = null;
    Node<T>? current = linklist;
    Node<T>? nextNode;

    while (current != null) {
      nextNode = current.next;
      current.next = prev;
      prev = current;
      current = nextNode;
    }

    return prev;
  }
  
  
    void removeDuplicates() {
    Node<T>? current = this;

    while (current != null && current.next != null) {
      Node<T>? runner = current;

      while (runner?.next != null) {
        if (runner?.next!.value == current.value) {
          runner?.next = runner?.next!.next;
        } else {
          runner = runner?.next;
        }
      }

      current = current.next;
    }
  }
}  





void main(){
  Node<int>? linkedlist7=Node(value: 7,next: null);
  Node<int>? linkedlist6=Node(value: 6,next: linkedlist7);
  Node<int>? linkedlist5=Node(value: 5,next: linkedlist6);
  Node<int>? linkedlist4=Node(value: 4,next: linkedlist5);
  Node<int>? linkedlist3=Node(value: 7,next: linkedlist4);
  Node<int>? linkedlist2=Node(value: 2,next: linkedlist3);
  Node<int>? linkedlist1=Node(value: 1,next: linkedlist2);
  print(linkedlist1.toString());
  linkedlist1.printInRevers();
  linkedlist1.findTheMid();
  
  Node<int>? reversedList = Node.reverseLinkedList(linkedlist1);
  print(reversedList.toString());
  
  reversedList?.removeDuplicates();
  print(reversedList?.toString());
}
