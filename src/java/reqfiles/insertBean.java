package reqfiles;
public class insertBean {
    String registrationID;
    String Line;
    String customer;
    String model;
    String check;
    String date;
    String tat;
    String ses;
    String status;
    public insertBean(String id,String line,String custom,String mod,String chec,String dat,String tt,String se,String st) {
    registrationID = id;
    Line = line;
    customer = custom;
    model = mod;
    check = chec;
    date = dat;
    tat = tt;
    ses = se;
    status = st;
    }
    public String getregistrationID(){
        return registrationID;
    }
    public String getLine(){
        return Line;
    }
    public String getcustomer(){
        return customer;
    }
    public String getmodel(){
        return model;
    }
    public String getcheck(){
        return check;
    }
    public String getdate(){
        return date;
    }
    public String gettat(){
        return tat;
    }
    public String getses(){
        return ses;
    }
    public String getStatus(){
        return status;
    }
}
