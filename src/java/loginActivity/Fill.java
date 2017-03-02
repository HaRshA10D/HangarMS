package loginActivity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import reqfiles.Utilities;

public class Fill {
    ArrayList<Keys> keys = new ArrayList<Keys>();
    Fill(String company){
        Keys key = new Keys(company);
        System.out.println(key);
        keys.add(key);
    }
}
class Keys{
    public String color;
    Keys(String company){
        try {
            /*if(company.equals("AIRASIA")){
            color = "red";
            }
            else if(company.equals("FLYNAS")){
            color = "blue";
            }
            else if(company.equals("GO AIR")){
            color = "green";
            }
            else if(company.equals("INDIGO")){
            color = "yellow";
            }
            else if(company.equals("JETAIRWAYS")){
            color = "orange";
            }
            else if(company.equals("SPICEJET")){
            color = "pink";
            }
            else{
            color = "black";
            }*/
            Utilities utils = new Utilities();
            ResultSet rs = utils.giveall(2);
            while(rs.next()){
                if(rs.getString(1).equals(company)){
                    color = rs.getString(2);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Keys.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
