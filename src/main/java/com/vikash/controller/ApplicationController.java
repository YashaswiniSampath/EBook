package com.vikash.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vikash.modal.User;
import com.vikash.modal.Book;
import com.vikash.modal.Cat;
import com.vikash.services.UserService;


@Controller
public class ApplicationController {

	@Autowired
	UserService userService;
//	UserService bookService;
//	UserService categoryService;

	@RequestMapping("/welcome")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}

	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "welcomepage";
	}


	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveMyUser(user);
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}
	
	@PostMapping("/save-book")
	public String registerBook(@ModelAttribute Book book, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveMyBook(book);
		request.setAttribute("mode", "MODE_AUTHOR");
		return "author";
	}
	
	@PostMapping("/save-categorys")
	public String registerCategory(@ModelAttribute Cat cat, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveMyCat(cat);
		request.setAttribute("mode", "MODE_AUTHOR");
		return "author";
	}
	
	@PostMapping("/save-users")
	public String registerUsers(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveMyUser(user);
		request.setAttribute("mode", "MODE_HOME");
		return "homepage";
	}

	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "homepage";
	}
	
	@GetMapping("/manage")
	public String manageuser(HttpServletRequest request) {
		request.setAttribute("users", userService.manageusers());
		request.setAttribute("mode", "ALL_USERS");
		return "homepage";
	}
	
	
	
	//**********************************************************************************
	@GetMapping("/approve")
	public String approvebook(HttpServletRequest request) {
		request.setAttribute("books", userService.managebooks());
		request.setAttribute("mode", "ALL_BOOKS");
		return "homepage";
	}

	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) {
		userService.deleteMyUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "homepage";
	}
	
	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("user", userService.editUser(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "homepage";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request) {
		String var1="admin";
		String var2="language";
		String var3="editor";
		String var4="author";
		String var5="user";
		User Check;
		if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			Check=userService.findByUsername(user.getUsername());
	String Check1=Check.getrole();
			if(Check1.equals(var1 ))
			{
			return "homepage";
			}
			else if(Check1.equals(var2)) { 
				return "language";
			}
			else if(Check1.equals(var3)) { 
				return "editor";
			}
			else if(Check1.equals(var4)) { 
				return "author";
			}
			else if(Check1.equals(var5)) { 
				return "user";
			}
			else {
				return "welcomepage";
			}
			
		}
		else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
			
		}
	
	}
	
	@RequestMapping("/author")
	public String author(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_AUTHOR");
		return "author";
	}
	
	@RequestMapping("/language")
	public String language(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LANGUAGE");
		return "language";
	}
	
	@RequestMapping("/user")
	public String user(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_USER");
		return "user";
	}
	
	@RequestMapping("/addbooks")
	public String addbook(HttpServletRequest request) {
		request.setAttribute("cats", userService.showAllCats());
		request.setAttribute("mode", "MODE_ADDBOOK");
		return "author";
	}
	
	@RequestMapping("/editor")
	public String editor(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_EDITOR");
		return "editor";
	}
	
	@GetMapping("/aprovebooks")
	public String aprovebooks(HttpServletRequest request) {
		request.setAttribute("books", userService.showAllBooks());
		request.setAttribute("mode", "ALL_APROVEBOOKS");
		return "editor";
	}
	
	@GetMapping("/bookpresent")
	public String bookpresent(HttpServletRequest request) {
		request.setAttribute("books", userService.showAllBooks());
		request.setAttribute("mode", "ALL_BOOKPRESENT");
		return "language";
	}
	
	@GetMapping("/viewbooks")
	public String viewbook(HttpServletRequest request) {
		request.setAttribute("cats", userService.showAllCats());
		request.setAttribute("mode", "VIEW_BOOK");	
		return "user";
	}
	
	@RequestMapping("/save-id")
	public String saveid(@ModelAttribute Cat cat, HttpServletRequest request) {
	if(userService.findBycategory1(cat.getCid())!=null) {
			request.setAttribute("books",userService.findBycategory1(cat.getCid()) );
			request.setAttribute("mode", "VIEW_BOOKS");	
			return "user";
		}else {
	return "user";
		}
	}
		
	
	@RequestMapping("/approve-book1")
	public String approvebook1(@RequestParam int id, HttpServletRequest request) {
		Book book =userService.editBook(id);
		book.langexpert=true;
		userService.saveMyBook(book);
		return "language";
	
	}
	
	@RequestMapping("/reject-book1")
	public String rejectbook1(@RequestParam int id, HttpServletRequest request) {
		Book book =userService.editBook(id);
		book.publishstatus=false;
		userService.saveMyBook(book);
		return "language";
	
	}
	
	@RequestMapping("/approve-book2")
	public String approvebook2(@RequestParam int id, HttpServletRequest request) {
		Book book =userService.editBook(id);
		book.editor=true;
		userService.saveMyBook(book);
		return "editor";
	
	}
	
	@RequestMapping("/reject-book2")
	public String rejectbook2(@RequestParam int id, HttpServletRequest request) {
		Book book =userService.editBook(id);
		book.publishstatus=false;
		book.langexpert=false;
		userService.saveMyBook(book);
		return "language";
	
	}
	
	@RequestMapping("/approve-book3")
	public String approvebook3(@RequestParam int id, HttpServletRequest request) {
		Book book =userService.editBook(id);
		book.admin=true;
		userService.saveMyBook(book);
		return "editor";
	
	}
	
	@RequestMapping("/reject-book3")
	public String rejectbook3(@RequestParam int id, HttpServletRequest request) {
		Book book =userService.editBook(id);
		book.publishstatus=false;
		book.langexpert=false;
		book.editor=false;
		userService.saveMyBook(book);
		return "language";
	
	}
	
	@RequestMapping("/edit-book")
	public String editBook(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("book", userService.editBook(id));
		request.setAttribute("mode", "MODE_UPDATEBOOK");
		return "homepage";
	}
	
	
	@RequestMapping("/addcategory")
	public String addcategory(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_ADDCATEGORY");
		return "author";
	}

//	@GetMapping("/view-books")
//	public String viewbooks(HttpServletRequest request) {
//		request.setAttribute("book", userService.showAllBooks());
//		request.setAttribute("mode", "VIEW_BOOKS");
//		return "user";
//	}
	
	@GetMapping("/view-books")
	public String viewbooks(HttpServletRequest request) {
		request.setAttribute("books", userService.showAllBooks());
		request.setAttribute("mode", "VIEW_BOOKS");
		return "user";
		}
	
	
}
