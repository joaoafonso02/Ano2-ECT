package Aula7;

public class DateYMD extends Date{
    protected int day, month, year;

    private static final int[] allDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    public DateYMD(int day, int month, int year) {
        this.set(day, month, year);
    }
    // Set values to day, month, year
    public void set(int day, int month, int year) {
        assert validDate(day, month, year): "Data inválida";
        if(validDate(day, month, year)) {
            this.day = day;
            this.month = month;
            this.year = year;
        } else {
            System.out.println("\nInvalid Date!");
        }
    }

    // increment date
    public void increment(int days) {
        while( days > 0 ) {
            if(this.day == monthDays(this.month, this.year)) {
                this.day = 1;
                if(this.month == 12) {
                    this.month = 1;
                    this.year++;
                }
                else    
                    this.month++;
            } else 
                this.day++;
            days--;
        }
    }

    // decrement date
    public void decrement(int days) {
        while( days > 0 ) {
			if( this.day == 1 ) {
				
				if( this.month == 1 ) {
					this.month = 12;
					this.year--; 
				} else {
					this.month--;
				}
                this.day = monthDays(this.month, this.year);
			} else {
				this.day--;
			}
			days--;
		}
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
        return validMonth(month) && (day >= 1 && day <= monthDays(month, year));
	}

    // validate month[1-12]
    public static boolean validMonth(int mes) {
        return 1 <= mes && mes <= 12;
    }

    // get days of each month according the year
    public static int monthDays(int month, int year) {
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
