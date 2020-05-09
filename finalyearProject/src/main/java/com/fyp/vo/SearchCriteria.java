package com.fyp.vo;

public class SearchCriteria extends Criteria{
	
	private String searchType = "";
	private String keyword = "";
	private String role ="";
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;	
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType="+ searchType + ", keyword="+ keyword + ", role="+ role + "]";
	}
	
}