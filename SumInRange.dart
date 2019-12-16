int sumInRange(List<int> nums, List<List<int>> queries) {
  List<int> prefix = new List<int>();
  prefix.length = nums.length + 1;
  prefix[0] = 0;
  for (var i = 1; i < prefix.length; ++i) {
    prefix[i] = prefix[i-1] + nums[i-1];
  }
  print(prefix);
  int sum = 0;
  for (var querry in queries) {
    sum += prefix[querry[1] + 1] - prefix[querry[0]];
  }
  return sum % 1000000007;
}
int main() {
  print(sumInRange([3, 0, -2, 6, -3, 2], [[0, 2], [2, 5], [0, 5]]));
}
