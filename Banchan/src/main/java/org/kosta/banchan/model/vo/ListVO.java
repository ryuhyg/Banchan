package org.kosta.banchan.model.vo;

import java.util.List;

public class ListVO<T> {

    private List<T> list;
    private PagingBean pb;
	public ListVO() {
		super();
	}
	@Override
	public String toString() {
		return "ListVO [pb=" + pb + "]";
	}
	
	public ListVO(List<T> list, PagingBean pb) {
		super();
		this.list = list;
		this.pb = pb;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public PagingBean getPb() {
		return pb;
	}
	public void setPb(PagingBean pb) {
		this.pb = pb;
	}


    



}