package loginActivity;
public class onLabel {
    public String value;
    public int fontSize = 17;
    public String fontFamily = "Segoe UI";
    public String textOverflow = "anychart.graphics.vector.Text.TextOverflow.ELLIPSIS";
    public String position = "anychart.enums.Position.CENTER";
    public String anchor = "anychart.enums.Anchor.CENTER_TOP";
    public String fontWeight = "bold";
    public String fontColor = "#FFFFFF";
    onLabel(String reg,int x){
        value = reg;
        
    }
    onLabel(String reg,int x,int tat){
        value = reg;
        if(tat < 5)
        {
            fontColor="#000000";
            fontSize=10;
        }
        
    }
}
