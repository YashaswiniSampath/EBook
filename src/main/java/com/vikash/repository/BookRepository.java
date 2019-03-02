package com.vikash.repository;

//import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.vikash.modal.Book;


public interface BookRepository extends CrudRepository<Book, Integer> {	
	
	public Book findByid(int id);
	public Book findBycategory(int category);
	
//	@Query(value = "select file from Book b where b.id =:id")
//	public Book showfile(int id);
//	
}




