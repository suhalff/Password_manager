package com;

import java.sql.Connection;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class TestConnectionUtility {
	public static void main(String[] args) {
		ExecutorService es = Executors.newFixedThreadPool(2);
		es.execute(()->{
			Connection con1 = ConnectionUtility.getConnection();
			System.out.println(con1);
			
			Connection con2 =  ConnectionUtility.getConnection();
			System.out.println(con2);
		});
		es.execute(()->{
			Connection con3 = ConnectionUtility.getConnection();
			System.out.println(con3);
		});
	}
}
