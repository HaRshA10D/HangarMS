package reqfiles;
import java.sql.*;
import javax.servlet.http.HttpSession;
public class Utilities {
    public String checkSession(HttpSession session)
    {
        String url="";
        String user =(String)session.getAttribute("username");
        if(user == null)
            url="Home.jsp";
    return url;
    }
    
    public Connection NewConnection(String dbname){
        Connection conn = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName="+dbname+";user=sa;password=Nstatehs_1");
        }catch(ClassNotFoundException e){
            
        }catch(SQLException e){
            
        }
        return conn;
    }

    /**
     *
     * @param aircraft_reg
     * @param total
     * @return
     */
    public ResultSet retriveData(String aircraft_reg,String total){
        ResultSet rs = null;
        try{
            Utilities util = new Utilities();
            Connection conn = util.NewConnection("db_HF");
            java.sql.Date date = java.sql.Date.valueOf(total);
            CallableStatement cstm = conn.prepareCall("{call mp_retrive(?,?)}");
            cstm.setString(1,aircraft_reg);
            cstm.setDate(2,date);
            rs = cstm.executeQuery();
        }catch(SQLException e){
            
        }
        return rs;
    }
    public ResultSet giveall(int i){
        ResultSet rs=null;
        try{
            Utilities utils = new Utilities();
            Connection conn = utils.NewConnection("db_HF");
            if(i==1){
            CallableStatement cstm = conn.prepareCall("{call mp_selectbyorder()}");
             rs = cstm.executeQuery();
            }else if(i==0){
            CallableStatement cstm = conn.prepareCall("{call mp_history()}");
             rs = cstm.executeQuery();
            }else if(i==2){
            CallableStatement cstm = conn.prepareCall("{call Companies()}");
             rs = cstm.executeQuery();
            }else if(i==3){
            CallableStatement cstm = conn.prepareCall("{call Model()}");
             rs = cstm.executeQuery();
            }else if(i==4){
            CallableStatement cstm = conn.prepareCall("{call Check_types()}");
            rs = cstm.executeQuery();
            }
        }catch(SQLException e){
            
        }
        return rs;
    }
    public ResultSet retriveModify(String air_reg,String Date){
        ResultSet rs = null;
        try{
            java.sql.Date idate = java.sql.Date.valueOf(Date);
            Utilities util = new Utilities();
            Connection conn = util.NewConnection("db_HF");
            CallableStatement cstm = conn.prepareCall("{call mp_retrivebyReg(?,?)}");
            cstm.setString(1,air_reg);
            cstm.setDate(2,idate);
            rs = cstm.executeQuery();
        }catch(SQLException e){
            
        }
        return rs;
    }
}
