package loginActivity;

import java.util.Date;

public class record {
    public int id;
    public String customer;
    public String reg;
    public String model;
    public Date start;
    public Date end;
    public int tat; 
    public Stroke stroke;
    Fill fill;
    public onLabel label;
    record(int id,String customer,String reg,String model,String check,Date start,Date end,int tat,String company,String status,int x){
        this.id = id;
        this.customer = customer;
        this.reg = reg;
        this.model = model;
        this.start = start;
        this.end = end;
        this.tat = tat;
        this.fill = new Fill(company);
        this.label = new onLabel(reg,x);
        this.stroke = new Stroke(status);
    }
    public class Stroke{
    String color;
    int thickness;
    public Stroke(String status) {
        if(status.equals("planning")){
            this.color = "#F44336";
            this.thickness = 4;
        }
        if(status.equals("confirm")){
            this.color = "#000000";
            this.thickness = 2;
        }
    }
}
}
