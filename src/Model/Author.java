package Model;

import Controller.Interface;

import java.io.Serializable;
import java.util.Date;

public class Author implements Serializable, Interface {
    private int id;
    private String name;
    private Date dob;

    public Author() {
    }

    public Author(int id, String name, Date dob) {
        this.id = id;
        this.name = name;
        this.dob = dob;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Override
    public Object[] toObject() {
        return new Object[]{this.name, this.dob};
    }
}
