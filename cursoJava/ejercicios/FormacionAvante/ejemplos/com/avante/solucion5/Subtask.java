package com.avante.solucion5;

import java.util.ArrayList;
import java.util.Iterator;

import com.avante.ejemplo4.Contact;
import com.avante.ejemplo4.Deliverable;
import com.avante.ejemplo4.ProjectItem;

public class Subtask implements ProjectItem{

	private String name;
	private String details;
	private ArrayList projectItems = new ArrayList();
	private Contact owner;
	private double timeRequired;
	
	public Subtask() {
	}

	public Subtask(String newName, String newDetails, Contact newOwner,
			double newTimeRequired) {
		name = newName;
		details = newDetails;

		owner = newOwner;
		timeRequired = newTimeRequired;
	}

	public String getName() {
		return name;
	}

	public String getDetails() {
		return details;
	}

	public ArrayList getProjectItems() {
		return projectItems;
	}

	public Contact getOwner() {
		return owner;
	}

	public double getTimeRequired() {
		double totalTime = timeRequired;
		Iterator items = projectItems.iterator();
		while (items.hasNext()) {
			ProjectItem item = (ProjectItem) items.next();
			totalTime += item.getTimeRequired();
		}
		return totalTime;
	}

	public void setName(String newName) {
		name = newName;
	}

	public void setDetails(String newDetails) {
		details = newDetails;
	}

	public void setOwner(Contact newOwner) {
		owner = newOwner;
	}

	public void setTimeRequired(double newTimeRequired) {
		timeRequired = newTimeRequired;
	}

	public void addProjectItem(ProjectItem element) {
		if ((element instanceof Deliverable) && !projectItems.contains(element)) {
			projectItems.add(element);
		}
	}

	public void removeProjectItem(ProjectItem element) {
		projectItems.remove(element);
	}

}
