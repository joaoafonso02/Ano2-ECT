package Aula5;
// private numDays
// MUDAR A CLASSE Data (nº de dias 1/01/2000)
// Data(1, 1, 2000) {
//  numDias = 367
// funct q dá o numero de dias de um ano

public class Data implements Comparable{
    private int day, month, year;  // public or private eis a questão.
    private static final int[] allDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    // Constructor
    public Data(int day, int month, int year) {
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
            if(this.day == Days(this.month, this.year)) {
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
                this.day = Days(this.month, this.year);
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

    @Override
    public int compareTo(Object obj) {
        Data date = (Data) obj;
        if (this.year() < date.year) return -1;
		else if (this.year() > date.year()) return 1;
		if (this.month() < date.month()) return -1;
		else if (this.month() > date.month()) return 1;
		if (this.day() < date.day()) return -1;
		else if (this.day() > date.day()) return 1;
        return 0;
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj)
            return true;
        if(obj == null)
            return false;
        if(!(obj instanceof Data))
            return false;
        Data b = (Data) obj;
        if(this.day == b.day && this.month == b.month && this.year == b.year)
            return true;
        return false;
    }

    @Override
    public int hashCode(){
        int a = this.day * 7;
        a += 76;
        a += this.month;
        a /= 5;
        a += this.year;
        a *= 84;

        return a;
    }
}

