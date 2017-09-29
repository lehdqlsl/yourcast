package com.yourcast.app.vo;

public class GenreVO {
	private int genre_num;
	private String genre_name;
	public GenreVO(){
		
	}
	
	public GenreVO(int genre_num, String genre_name) {
		super();
		this.genre_num = genre_num;
		this.genre_name = genre_name;
	}

	public int getGenre_num() {
		return genre_num;
	}
	public void setGenre_num(int genre_num) {
		this.genre_num = genre_num;
	}
	public String getGenre_name() {
		return genre_name;
	}
	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}
	
}
