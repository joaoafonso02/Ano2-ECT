package Aula5;

public class Calendar {
    private int weekDay, year;  
  
    // Constructor
    Calendar(int weekDay, int year) {
        assert weekDay>=1 && weekDay<=7 : "\nInvalid Date!";
        this.year = year;
        this.weekDay = weekDay;
    }

    public int firstWeekDayOfYear() { return this.weekDay; } // get week day
    public int year() { return this.year; } // get year

    public int firstWeekdayOfMonth(int month) {
		assert month>=1 && month<=12;
        int nextDay = 0;
        for (int i = 1; i < month; i++) {
            nextDay += Data.Days(i, this.year);
        }
		return ((this.weekDay - 1 + nextDay) % 7) + 1;
	}

    public String printMonth(int month) {
        String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

        System.out.println("\n   " + months[month-1] + " " + year);
        System.out.println("Su Mo Tu We Th Fr Sa");

        int nextDayOfTheMonth = firstWeekdayOfMonth(month);

        for (int i = 0; i < nextDayOfTheMonth-1; i++) {
            System.out.print("   ");    // create space depending on the WeekDay
        }
       
        for(int i = 1; i <= Data.Days(month, this.year);i++){
            System.out.printf("%2d ",i);
            if((nextDayOfTheMonth - 1 + i) % 7 == 0){
                System.out.println();
            }
        }
        System.out.println("\n");

        return "";
    }
    // Date --> AAAA-MM-DD.
    public String toString() {
		String s = "";
        for (int i = 1; i <= 12; i++) {
            s += printMonth(i);
        }
        return s;
	}

    // return true or false if date is valid
	public static boolean validDate(int day, int month, int year) {
        return validMonth(month) && (day >= 1 && day <= Data.Days(month, year));
	}

    // validate month[1-12]
    public static boolean validMonth(int mes) {
        return 1 <= mes && mes <= 12;
    }

    // return true/false if it's a leapyear/not
    public static boolean leapYear(int year) {
        return (year % 400 == 0) || ( (year % 4 == 0) && (year % 100 != 0) );
    }
}

