import 'dart:io';


// Singly-linked lists are already defined with this interface:
class ListNode<T> {
  T value;
  ListNode<T> next;

  ListNode(T value) {
    this.value = value;
    this.next = null;
  }
}

ListNode<int> rearrangeLastN(ListNode<int> head, int n) {
  int length = 0;
  { var node = head;
    // find the length
    while (node != null) {
      node = node.next;
      length += 1;
    }
  }
  if (n == 0 || n >= length) {
    return head;
  }
  var tail = head;
  for (var i = 0; i < length - n - 1; ++i) {
    tail = tail?.next;
  }
  if (tail == null) {
    return head;
  }
  var nextHead = tail.next;
  var nextTail = nextHead;
  while (nextTail.next != null) {
    nextTail = nextTail.next;
  }
  nextTail.next = head;
  tail.next = null;
  head = nextHead;
  return head;
}

main() {
  var list = new ListNode<int>(1000);
  list.next = new ListNode<int>(-1000);
  // list.next.next = new ListNode<int>(3);
  // list.next.next.next = new ListNode<int>(4);
  // list.next.next.next.next = new ListNode<int>(5);
  list = rearrangeLastN(list, 0);
  stdout.write("List: ");
  while (list != null) {
   stdout.write("${list.value}, ");
    list = list.next;
  }
}
