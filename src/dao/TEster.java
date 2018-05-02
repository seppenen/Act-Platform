package dao;

public class TEster {

	public static void main(String[] args) {
		
		System.out.println(laske("22", "50",  2, "2018-04-05"));
		System.out.println("22"+ "50"+ "2"+ "2018-04-05");

	
	}

	private static String laske(String start, String min, int kesto, String date) {
		
		int [] days= {31, 28,31,30, 31,30, 31,31,30,31,30,31};
		int hour = Integer.parseInt(start);
		int minute = Integer.parseInt(min);
		int result = (hour + kesto );
		String res = null;
		String[] daytaulukko = date.split("-");
		int day = Integer.parseInt(daytaulukko[2]);
		int month = Integer.parseInt(daytaulukko[1]);
		String resultmonth = null;
		String resultday = null;
		
		int j=0;
		if (result >=24) {
			int temp = 24-hour;
			hour = kesto - temp;
			j=1;
			
		}else {
			
			hour = hour + kesto;
		}
		
	
		if(hour<10) {
			
			res="0"+hour;
			
			
		}else {
			
			res = String.valueOf(hour);
		}
		
		if (days[month+1]==day && hour<=24 && j==1 ) {
			
			month = (month + 1);
			day = 1;
			
		}
		
			
		if(month<10) {
			
		 resultmonth="0"+month;
			
			
		}else {
			
			 resultmonth=String.valueOf(month);
		}
		
		if(day<10) {
			
			 resultday="0"+day;
				
				
			}else {
				
				 resultday=String.valueOf(day);
			}

		


		 return (daytaulukko[0] +"-"+ resultmonth + "-" + resultday + "T"+res +":"+minute);

	
}
	
}
