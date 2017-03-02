                    Day:<select class="w3-select" name="date" id="date" style="width: 90px">
                    <% 
                       for(int i=0;i<d.length;i++){%>
                       <option value="<%=d[i]%>"><%=d[i]%></option>
                       <%}%>
                    </select> &nbsp&nbsp
                    Month:<select class="w3-select" name="month" id="month" style="width: 90px">
                    <% 
                       for(int i=0;i<m.length;i++){%>
                       <option value="<%=m[i]%>"><%=mnames[i]%></option>
                       <%}%>
                    </select>&nbsp&nbsp
                    Year:<select class="w3-select" name="year" id="year" style="width: 90px">
                    <% 
                       for(int i=curr_year-1;i< curr_year+3;i++){%>
                       <option value="<%=i%>"><%=i%></option>
                       <%}%>
                    </select>