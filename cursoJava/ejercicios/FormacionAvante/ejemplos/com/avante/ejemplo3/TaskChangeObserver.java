package com.avante.ejemplo3;

public interface TaskChangeObserver {
	public void taskAdded(Task task);

	public void taskChanged(Task task);

	public void taskSelected(Task task);
}
