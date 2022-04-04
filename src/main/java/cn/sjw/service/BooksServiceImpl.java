package cn.sjw.service;

import cn.sjw.mapper.BooksMapper;
import cn.sjw.pojo.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BooksServiceImpl implements BooksService {

   @Autowired
    private BooksMapper booksMapper;


    public int addBook(Books book) {

        return booksMapper.addBook(book);
    }

    public int deleteBookById(int id) {
        return booksMapper.deleteBookById(id);
    }

    public int updateBook(Books books) {
        return booksMapper.updateBook(books);
    }

    public Books queryBookById(int id) {
        return booksMapper.queryBookById(id);
    }

    public List<Books> queryAllBook() {
        return booksMapper.queryAllBook();
    }
}
