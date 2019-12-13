import 'dart:io';

 // Singly-linked lists are already defined with this interface:
class ListNode<T> {
  ListNode(T x) {
    value = x;
  }
  T value;
  ListNode<T> next;
}
// 1, 2, 3, 4, 5
ListNode<int> reverseNodesInKGroups(ListNode<int> head, int k) {
  bool firstTime = true;
  ListNode<int> previousHead;
  var tmpHead = head;
  ListNode<int> nextHead;
  
  do {
    var node = tmpHead;
    for (var i = 0; i < k - 1; ++i) {
      node = node?.next;
    }
    if (node == null) {
      
      return head;
    }
    previousHead?.next = node;
    nextHead = node.next;
    node.next = null;       
    node = tmpHead;               // move to what will be the end of the list
    tmpHead = reverseList(tmpHead);
    if (firstTime) {
      head = tmpHead;
      firstTime = false;
    }
    previousHead = node;
    tmpHead = nextHead;
    node.next = nextHead;
  } while (previousHead != null);
  return head;
}

ListNode<int> reverseList(ListNode<int> head) {
  ListNode<int> previous;
  ListNode<int> current = head;
  ListNode<int> next = current?.next;
  while (current != null) {
    current.next = previous;
    previous = current;
    current = next;
    next = current?.next;
  }
  head = previous;
  return head;
}
main() {
  var list = new ListNode<int>(1);
  list.next = new ListNode<int>(2);
  list.next.next = new ListNode<int>(3);
  list.next.next.next = new ListNode<int>(4);
  list.next.next.next.next = new ListNode<int>(5);
  list = reverseNodesInKGroups(list, 3);
  stdout.write("List: ");
  while (list != null) {
   stdout.write("${list.value}, ");
    list = list.next;
  }
}
