package cn.sjw.controller;

//package cn.sjw.controller;
//
//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@Controller
//@RequestMapping("/book")

public class BooksController {
}

//    @Autowired
//    private BooksService booksService;
//
//@GetMapping("/add")
//    public void addBook(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//
//    request.getRequestDispatcher("/WEB-INF/jsp/.jsp").forward(request,response);
//
//}
//
//    @PostMapping("/add")
//    public String addBook(Model model,Books book) {
//    String mag=" ";
//    int i=booksService.addBook(book);
//    if (i>0){
//        mag="添加成功！";
//    } else{
//        mag="添加失败！";
//    }
//        model.addAttribute("mag",mag);
//        return "";
//    }
//
////    根据ID删除书籍信息
//@GetMapping("/delet")
//public String deleteBookById(Model model, @RequestParam("id") Integer id){
//    String mag=" ";
//    int i=booksService.deleteBookById(id);
//
//    if (i>0){
//        mag="删除成功！";
//    } else{
//        mag="删除失败！";
//    }
//
//    model.addAttribute("mag",mag);
//    return "";
//}
//
//
//
//    //  查询所有书籍信息
//    @GetMapping("/query")
//    public String updateBook(@RequestParam(value = "pn",defaultValue = "1")Integer pn , Model model){
//        PageHelper.startPage(pn,5);
//        List<Books> books= booksService.queryAllBook();
//        PageInfo pageInfo=new PageInfo(books);
//        pageInfo.setNavigatePages(5);
//        model.addAttribute("pageInfo", pageInfo);
//        return "";
//    }
//
////    根据ID修改书籍信息
//@GetMapping("/update")
//public String updateBook(int id,Model model){
//    Books books = booksService.queryBookById(id);
//    model.addAttribute("books", books);
//  return "";
//
//}
//
//    @PostMapping("/update")
//    public String updateBook(Model model,Books book) {
//        String mag=" ";
//        int i=booksService.updateBook(book);
//        if (i>0){
//            mag="修改成功！";
//        } else{
//            mag="修改失败！";
//        }
//        model.addAttribute("mag",mag);
//        return "";
//    }
//}
