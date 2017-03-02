package loginActivity;

import java.util.ArrayList;

public class lineRecord {
    public String id;
    public String name;
    public int rowHeight;
    public String parent;
    public ArrayList<record> periods = new ArrayList<record>();
    public void addRecord(record rec){
        periods.add(rec);
    }
    lineRecord(String id,String name){
        this.id = id;
        this.name = name;
        this.rowHeight = 48;
    }

    lineRecord(String id,String name,String parent) {
        this.id = id;
        this.name = name;
        this.parent = parent;
        this.rowHeight = 42;
    }
    
}
