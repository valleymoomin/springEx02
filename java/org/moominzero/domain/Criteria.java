package org.moominzero.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private int skipCount;
	
	private String type; //t, tc, tcw, cw 문자열 -> foreach 배열,map,set 으로 변경해서 돌려야,//myBatis는 getter,setter로 동작한다.
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skipCount = (pageNum -1) * amount;
	}
	
	public int getSkipCount() {
	        return (this.pageNum - 1) * this.amount;
	 }
	
	public String[] getTypeArr() {
		
		System.out.println("---------getTypeArr-----------------");
		return type == null? new String[] {}: type.split("");
	}
	//loop을 돌리기위해서 배열이 필요하다.
	//loop을 돌릴때 배열이 null이면 안된다. null이 안나게 빈배열을 만들었다.
	//or 동적sql태그에다가 if체크 ,notnull체크를 하면된다.
	
	
}
