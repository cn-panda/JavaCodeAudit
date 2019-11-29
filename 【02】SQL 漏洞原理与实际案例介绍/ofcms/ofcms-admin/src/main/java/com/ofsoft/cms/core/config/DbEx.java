package com.ofsoft.cms.core.config;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;

public class DbEx extends Db {

	public DbEx() {
		super();
	}

	public static void bath(String sql, List<Object> nodes, Integer index) {
		Object[][] bath = new Object[nodes.size()][index];
		for (int i = 0; i < bath.length; i++) {
			for (int j = 0; j <= index; j++) {
				bath[i][j] = nodes.get(i);
			}
		}
		System.out.println(bath);
		// Db.batch(sql, bath, bath.length);
	}

	public static void main(String[] args) {
		List<Object> nodes = new ArrayList<Object>();
		DbEx.bath("", nodes, 2);

	}
}
