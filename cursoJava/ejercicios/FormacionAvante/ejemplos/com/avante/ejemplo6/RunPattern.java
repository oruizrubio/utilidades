package com.avante.ejemplo6;

import java.awt.Container;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.BoxLayout;
import javax.swing.JFrame;


public class RunPattern {
	public static void main (String[] args){
		RunPattern example = new RunPattern();
		example.createGui();
		ContactEditView view = new ContactEditView(null);
		
		view.createGui();
	}
	
	public void createGui() {
		JFrame mainFrame = new JFrame("MVC Pattern Example");
		Container content = mainFrame.getContentPane();
		content.setLayout(new BoxLayout(content, BoxLayout.Y_AXIS));
		ContactModel model = new ContactModel();
		
		ContactEditView component1 = new ContactEditView(model);
		ContactDisplayView component2 = new ContactDisplayView();
		
		model.addContactView(component2);
		model.addContactView(component1);
		
		
		content.add(component1);
		content.add(component2);
		mainFrame.addWindowListener(new WindowCloseManager());
		mainFrame.pack();
		mainFrame.setVisible(true);
	}
	
	private class WindowCloseManager extends WindowAdapter {
		public void windowClosing(WindowEvent evt) {
			System.exit(0);
		}
	}
}
