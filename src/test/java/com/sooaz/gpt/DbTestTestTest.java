package com.sooaz.gpt;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static org.junit.Assert.*;

public class DbTestTestTest {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "scott";
    private final String PASSWORD = "tiger";


    @Test
    public void dbTest() throws SQLException {

        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("connection = " + connection);
        connection.close();

    }

}