package com.alphacab.model;

/**
 * <h1>UserBean</h1>
 * Acts as the middle man between the data in the database and the views,
 * temporary storage for user model data that is either returned from the
 * database or to be sent to database from the views.
 *
 * <p>
 *
 * @author Midhath
 * @version 1.0
 * @since 2019-10-29
 */
public class UserBean implements java.io.Serializable {

    private String firstName;
    private String lastName;
    private String email;
    private String contactNo;
    private String profileImg;

    /**
     * Default Constructor, always no arguments passed, use getters and setters
     * methods
     */
    public UserBean() {

    }

    /**
     * Get the User's First Name
     *
     * @return firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Set User's First Name
     *
     * @param firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Get the User's Last Name
     *
     * @return lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets the User's Last Name
     *
     * @param lastName
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Gets the User's Email Address
     *
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the User's Email Address
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets the User's Contact Number
     *
     * @return contactNo
     */
    public String getContactNo() {
        return contactNo;
    }

    /**
     * Sets Contact Number of the User
     *
     * @param contactNo
     */
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    /**
     * Gets User Profile Picture (in Base64)
     *
     * @return profileImg
     */
    public String getProfileImg() {
        return profileImg;
    }

    /**
     * Sets Profile Picture Attribute of the User
     *
     * @param profileImg
     */
    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

}
