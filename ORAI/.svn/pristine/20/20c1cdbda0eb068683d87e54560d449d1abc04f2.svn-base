package cmn;

import java.util.UUID;

import org.apache.log4j.Logger;

 
public class StringUtil {
	private static Logger LOG = Logger.getLogger(StringUtil.class);	
	public static String nvl(Object str,String defVal){
		String retStr = "";
		if(null ==str || str.equals("")){
			retStr = defVal;
		}else{
			retStr = str.toString().trim();
		}
		return retStr;
	}
	public static String getUUID(){
		UUID uId= UUID.randomUUID();
		  System.out.println("uId:"+uId.toString().replace("-", ""));
		  return uId.toString().replace("-", "");
	}
	
	//게시판 페이지 체크
	public static String renderPaing(int maxNum,int currPageNo,int rowPerPage,int bottomCount, String url,String scriptName){
		/**
		 * 계산하기
		 * <<  < 12345678910  >  >>
		 * 총 글수: 21개라고 생각하고 계산
		 */
		int maxPageNo= ((maxNum-1)/rowPerPage)+1; //(21-1)/10 =2+1=3 //총 페이지 수는 3개 
		int startPageNo = ((currPageNo-1)/bottomCount)*bottomCount+1; //페이지 시작번호  1
		int endPageNo= ((currPageNo-1)/bottomCount+1)*bottomCount;//페이지 마지막번호 10
		int nowBlockNo = ((currPageNo-1)/bottomCount)+1; //현재 블록 (1~10까지가 한블록)
		int maxBlockNo = ((maxNum-1)/bottomCount)+1; //최대 블록
		
		int inx =0; //반복변수 
		StringBuilder html = new StringBuilder();
		if(currPageNo>maxPageNo){
			return ""; //현재페이지가 총페이지보다 크면 아무것도 표시하지 않는다 
		}
		//<table><tr><td></td></tr></table> 만들기
		//html.append("<table border= \"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" >\n");
	    //html.append("<tr>\n");	
		//html.append("<td align=\"center\">\n");	
		 html.append("<nav class=\"text-center\">\n"); 
	     html.append("   <ul class=\"pagination\">\n"); 
	     html.append("      <li>\n"); 

		//paging-------------------------
		// 1. << 만들기 : &laquo;
		if(nowBlockNo>1 && nowBlockNo <=maxBlockNo){
    		//html.append("<a  href=\"javascript:"+scriptName+"('"+url+"',1);\"  > ");
    		//html.append("&laquo; ");
    		//html.append("</a> \n");
			html.append("         <li>\n");
		    if(nowBlockNo>1 && nowBlockNo <=maxBlockNo){
		       html.append("<a  aria-label=\"Previous\" href=\"javascript:"+scriptName+"('"+url+"',1);\"  > ");
		       html.append("<span aria-hidden=\"true\">&laquo;</span>");
		       html.append("</a> \n");
		    }

    	}
    	//<
    	if(startPageNo>bottomCount){
    		html.append("<a  href=\"javascript:"+scriptName+"('"+url+"',"+(startPageNo-1)+");\"  > ");
    		html.append("< ");
    		html.append("</a> \n");    		
    	}
    	 html.append("         </li>\n");
    	//1 2  .... 10
    	for(inx = startPageNo;inx<=maxPageNo && inx<=endPageNo;inx++){
    		if( inx == currPageNo){//현재 page
    			 html.append("            <li><a>"+inx+"</a></li> &nbsp;&nbsp;\n");
            }else{
            	   html.append("            <li><a  href=\"javascript:"+scriptName+"('"+url+"',"+inx+");\"  > ");
                   html.append(inx);
                   html.append("</a></li>&nbsp;&nbsp; \n"); 			
    		}
    		  html.append("         <li>\n");
    	
    	}
    	//>
    	if(maxPageNo>=inx){
    		html.append("<a  href=\"javascript:"+scriptName+"('"+url+"',"+((nowBlockNo*bottomCount)+1)+");\"  > ");
    		html.append("> ");
    		html.append("</a> \n");     		
    	}
    	//>> &raquo;	오른쪽 꺾인 괄호
    	if(maxPageNo >=inx){
    		  html.append("            <a  aria-label=\"Next\" href=\"javascript:"+scriptName+"('"+url+"',"+maxPageNo+");\"  > ");
              html.append("<span aria-hidden=\"true\">&raquo;</span>");
              html.append("</a> \n");
   		
    	}
    	html.append("         </li>\n");

		//-paging------------------------		
		//html.append("</td>\n");	
		//html.append("</tr>\n");	
		//html.append("</table>");
    	 html.append("      </li>\n");
         html.append("   </ul>\n");
         html.append("</nav>\n");

		
		LOG.debug("==================");
		LOG.debug("html.toString()=\n"+html.toString());
		LOG.debug("==================");
		return html.toString();
	}
}
