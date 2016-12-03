package com.aicubes.jersey.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

	import com.aicubes.jersey.beans.Employee;
	import com.aicubes.jersey.beans.Employees;
	import java.util.ArrayList;


	@Path("/employees")
	public class JerseyService 
	{
	    @GET
	    @Produces(MediaType.APPLICATION_JSON)
	    public Employees getAllEmployees() 
	    {
	        Employees list = new Employees();
	        list.setEmployeeList(new ArrayList<Employee>());
	        list.getEmployeeList().add(new Employee(1, "Lokesh Gupta"));
	        list.getEmployeeList().add(new Employee(2, "Alex Kolenchiskey"));
	        list.getEmployeeList().add(new Employee(3, "David Kameron"));
	         
	        return list;
	    }
	}   


