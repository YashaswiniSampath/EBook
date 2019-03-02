package com.vikash.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.vikash.modal.User;
import com.vikash.modal.Book;
import com.vikash.modal.Cat;

import com.vikash.repository.UserRepository;
import com.vikash.repository.BookRepository;
import com.vikash.repository.CatRepository;

@Service
@Transactional
public class UserService {
	
	private final UserRepository userRepository;
	private final BookRepository bookRepository;
	private final CatRepository catRepository;
	
	public UserService(UserRepository userRepository,BookRepository bookRepository,CatRepository catRepository) {
		this.userRepository=userRepository;
		this.bookRepository=bookRepository;
	    this.catRepository=catRepository;
		
	}
	
	public void saveMyUser(User user ) {
		userRepository.save(user);
	}
	
	public void saveMyBook(Book book ) {
		bookRepository.save(book);
	}
	
	public void saveMyCat(Cat cat ) {
		catRepository.save(cat);
	}
	
	public List<User> manageusers(){
		List<User> users = new ArrayList<User>();
		for(User user : userRepository.findAll()) {
			users.add(user);
		}
		
		return users;
	}
	
	public List<Book> managebooks(){
		List<Book> books = new ArrayList<Book>();
		for(Book book : bookRepository.findAll()) {
			books.add(book);
		}
		
		return books;
	}
	
	public List<User> showAllUsers(){
		List<User> users = new ArrayList<User>();
		for(User user : userRepository.findAll()) {
			users.add(user);
		}
		
		return users;
	}
	
	public List<Book> showAllBooks(){
		List<Book> books = new ArrayList<Book>();
		for(Book book : bookRepository.findAll()) {
			books.add(book);
		}
		
		return books;
	}
	
	public List<Cat> showAllCats(){
		List<Cat> cats = new ArrayList<Cat>();
		for(Cat cat : catRepository.findAll()) {
			cats.add(cat);
		}
		
		return cats;
	}
	
	public void deleteMyUser(int id) {
		userRepository.delete(id);
	}
	
	public User editUser(int id) {
		return userRepository.findOne(id);
	}
	
	public Book editBook(int id) {
		return bookRepository.findOne(id);
	}
	
	public User findByUsernameAndPassword(String username, String password) {
		return userRepository.findByUsernameAndPassword(username, password);
	}
	
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	
	public Book findByid(int id) {
		return bookRepository.findByid(id);
	}
	
//	public Category findByOne(int Cid) {
//		return categoryRepository.findOne(Cid);
//	}
	
	public Book findBycategory1(int category) {
		return bookRepository.findBycategory(category);
	}

	
	
	
	}

	