package ListNode;
sub new {
   my $class = shift;
   my $self = {
       value => shift,
       next => shift,
   };
   return bless $self, $class;
}
1;
sub reverseNodesInKGroups {
	my ($head, $k) = @_;
    my $count = 0;
    my $node = $head;
    my $first = 1;
    while($node) {
        my $temp = $node;
        for my $i (0..$k) {
            
            $node = $node->{next};
        }
        $head = $node if $first--;
        $temp->{next} = $node->{next}
    }
}
my $node = ListNode::new(5);
reverseNodesInKGroups($node, 5);
