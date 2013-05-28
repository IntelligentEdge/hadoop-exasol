import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
 
public class industries {
	public static void main(String[] args) {
 
	BufferedReader br = null;
	String[] parts ;
	String[] words ;
	String thiscountry="";
	String trade_string="";
	String started_trade_string="N";
	try {
		String sCurrentLine;
		br = new BufferedReader(new FileReader("/home/gm/factbook/fields/2090.html"));
		while ((sCurrentLine = br.readLine()) != null) {
			if (sCurrentLine.matches(".*fl_region.*")) {
				parts = sCurrentLine.split("<|>");
				thiscountry=parts[4];
				}
			if (sCurrentLine.matches("^\\s\\s\\s\\s\\s\\s\\s\\s</td>.*")) {
				started_trade_string="N";
				words=trade_string.split(";|,");
				for(int i = 0; i < words.length; i++){
					System.out.println(thiscountry + "#" + words[i].replaceAll("^\\s+", ""));
				}
				trade_string="";
				}
			if (started_trade_string=="Y") {
				trade_string+=sCurrentLine;
				if (thiscountry.matches(".*Zimbabwe.*")) {
                                words=trade_string.split(";|,");
                                for(int i = 0; i < words.length; i++){
                                        System.out.println(thiscountry + "#" + words[i].replaceAll("^\\s+", ""));
                                }
				break;
				}
			}
			if (sCurrentLine.matches(".*category_data.*")) { 
				trade_string="";
				started_trade_string="Y";
			}
		}
 
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
			try {
				if (br != null)br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
 
	}
}
