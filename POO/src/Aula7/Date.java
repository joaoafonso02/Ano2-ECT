package Aula7;

public abstract class Date {
    private static final int[] allDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    // Set values to day, month, year
    public abstract void set(int day, int month, int year);

    // increment date
    public abstract void increment(int days);

    // decrement date
    public abstract void decrement(int days); 

    public abstract int day(); // get day
    public abstract int month(); // get month
    public abstract int year(); // get year

    // Date --> AAAA-MM-DD.
    public String toString() {
		return String.format("%04d-%02d-%02d", year(), month(), day());
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

