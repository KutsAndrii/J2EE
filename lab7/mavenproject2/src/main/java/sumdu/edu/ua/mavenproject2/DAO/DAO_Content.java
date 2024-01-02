/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sumdu.edu.ua.mavenproject2.DAO;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import sumdu.edu.ua.mavenproject2.model.Content;
import sumdu.edu.ua.mavenproject2.model.Student;


@Repository
public interface DAO_Content extends JpaRepository<Student, Integer>{
    @Query("from dis where student_id = id")
    List<Content> getMarksByStId(@Param("id") int id);
}
