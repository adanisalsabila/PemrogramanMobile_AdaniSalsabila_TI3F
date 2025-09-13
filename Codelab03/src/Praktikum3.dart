void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21) {
      break;
    }
    
    if (index > 10 && index < 15) { 
      continue;
    }
    
    print(index);
  }
}