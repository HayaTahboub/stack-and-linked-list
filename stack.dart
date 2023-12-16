
class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;
  
  @override
  String toString() {
    return '${_storage.reversed.join('\n')}';
  }
  
  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();
  
  bool get isEmpty => _storage.isEmpty;
}



bool areParenthesesBalanced(String input) {
  final stackString = Stack<String>();
  
  for (int i = 0; i < input.length; i++) {
    String currentChar = input[i];
    
    if (currentChar == '(') {
      stackString.push(currentChar);
    } else if (currentChar == ')') {
      if (stackString.isEmpty) {
        return false; // Unmatched closing parenthesis
      }
      stackString.pop();
    }
  }
  
  return stackString.isEmpty; // Stack should be empty for balanced parentheses
}

void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print(stack.toString());

  
  print("Expression 1 is balanced: ${areParenthesesBalanced("(a + b) * (c - d)")}");
  print("Expression 2 is balanced: ${areParenthesesBalanced("((a + b) * (c - d)")}");
