package com.aicubes.jersey.service;


import static org.junit.Assert.*;

import javax.ws.rs.core.Application;

import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.test.JerseyTest;

import org.junit.Test;

import com.aicubes.jersey.services.JerseyService;


public class JerseyServiceTest extends JerseyTest {

    @Override
    protected Application configure() {
        return new ResourceConfig(JerseyService.class);
    }
    
    
    @Test
    public void testEmployeesGet() {

    	   final String responseData = target("employees").request().get(String.class);
    	   System.out.println("--------------");
    	   System.out.println("-------------->"+responseData);
    	   System.out.println("--------------");
    	   
           assertEquals("{\"employeeList\":[{\"id\":1,\"name\":\"Lokesh Gupta\"},{\"id\":2,\"name\":\"Alex Kolenchiskey\"},{\"id\":3,\"name\":\"David Kameron\"}]}", responseData);
   }
    
}
