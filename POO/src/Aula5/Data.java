package Aula5;


public class Data {
    private int day, month, year;  // public or private eis a questão.
    private static final int[] allDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    // Constructor
    Data(int day, int month, int year) {
        this.set(day, month, year);
    }

    // Set values to day, month, year
    public void set(int day, int month, int year) {
        assert validDate(day, month, year): "Data inválida";
        this.day = day;
        this.month = month;
        this.year = year;
    }

    // increment date
    public void increment(int days) {
        while( days > 0 ) {
            if(this.day == Days(this.month, this.year)) {
                this.day = 0;
                this.month++;
                if(this.month > 12) {
                    this.month = 1;
                    this.year++;
                }
            }
            this.day++;
            days--;
        }
    }

    // decrement date
    public void decrement(int days) {
        // NO IDEA
    }

    public int day() { return day; } // get day
    public int month() { return month; } // get month
    public int year() { return year; } // get year

    // Date --> AAAA-MM-DD.
    public String toString() {
		return String.format("%04d-%02d-%02d", this.year, this.month, this.day);
	}

    // return true or false if date is valid
	public static boolean validDate(int day, int month, int year) {
        return validMonth(month) && (day >= 1 && day <= Days(month, year));
	}

    // validate month[1-12]
    public static boolean validMonth(int mes) {
        return 1 <= mes && mes <= 12;
    }

    // get days of each month according the year
    public static int Days(int month, int year) {
        assert validMonth(month): "Mês inválido";  
        int monthDay = allDays[month-1];
        if (month == 2 && leapYear(year))
            monthDay++;
        return monthDay;
    }
    // return true/false if it's a leapyear/not
    public static boolean leapYear(int year) {
        return (year % 400 == 0) || ( (year % 4 == 0) && (year % 100 != 0) );
    }
}

