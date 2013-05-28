package exasol.hadoop;

import java.lang.InterruptedException;
import java.io.IOException;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

import java.io.BufferedReader;
import java.io.FileReader;


public class EXAIndustry {
    public static class InputMapper extends Mapper<EXAIOFormat.Key, EXAIOFormat.Value, LongWritable, Text> {
        private LongWritable outKey = new LongWritable();
        private Text outValue = new Text();
        public void map(EXAIOFormat.Key key, EXAIOFormat.Value value, Context context) throws IOException, InterruptedException {
// Variable Declaration//
//
            Long col0;
            String col1;
            long current_row = 1;
	    String file_location="/home/gm/factbook/fields/2090.html";
// Loop round input rows
//
            for (boolean endOfRows = true; endOfRows; endOfRows = value.readNextRow(false), ++current_row) {
                col0 = value.getLong(0); col1 = value.getString(1);
// start of my inserted code 
//
        BufferedReader br = null;
        String[] parts ;
        String[] words ;
        String thiscountry="";
        String trade_string="";
        String started_trade_string="N";

        try {
                String sCurrentLine;
                br = new BufferedReader(new FileReader(file_location));
                while ((sCurrentLine = br.readLine()) != null) { //loop round lines in the file
                        if (sCurrentLine.matches(".*fl_region.*")) {
                                parts = sCurrentLine.split("<|>");
                                thiscountry=parts[4];
                                }
                        if (sCurrentLine.matches("^\\s\\s\\s\\s\\s\\s\\s\\s</td>.*")) {
                                started_trade_string="N";
                                words=trade_string.split(";|,");
                                for(int i = 0; i < words.length; i++){
					value.newResultRow().setLong(current_row).setString(thiscountry + "#" + words[i].replaceAll("^\\s+", "")).emit();
                                }
                                trade_string="";
                                }
                        if (started_trade_string=="Y") {
                                trade_string+=sCurrentLine;
                                if (thiscountry.matches(".*Zimbabwe.*")) {
                                words=trade_string.split(";|,");
                                for(int i = 0; i < words.length; i++){
                                value.newResultRow().setLong(current_row).setString(thiscountry + "#" + words[i].replaceAll("^\\s+", "")).emit();
                                }
                                break;
                                }
                        }
                        if (sCurrentLine.matches(".*category_data.*")) {
                                trade_string="";
                                started_trade_string="Y";
                        }
		} //end of loop round lines in file
                } // end of try 

         catch (IOException e) {
                e.printStackTrace();
        } finally {
                        try {
                                if (br != null)br.close();
                        } catch (IOException ex) {
                                ex.printStackTrace();
                        }
                } // end of finally

// end of my inserted code

            } // End of Loop round input rows
        } //end of map decalaration
    } //end of InputMapper  declaration
} // end of class declaration
