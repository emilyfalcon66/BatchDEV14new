public class Addition_of_Numbers {
    public static Integer num1;
    public static Integer num2;

    public Addition_of_Numbers(Integer a, Integer b) {
        num1 = a;
        num2 = b;
               
        }
        public static Integer calTotal() {
            Integer total = num1 + num2;
    
            return total;
        }

        public static Integer sub(){
            Integer sbt = num1 - num2;

            return sbt;
        }
      
    }