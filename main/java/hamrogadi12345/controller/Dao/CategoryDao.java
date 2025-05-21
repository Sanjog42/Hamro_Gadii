package hamrogadi12345.controller.Dao;

import hamrogadi12345.controller.models.CategoryModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {

    
	public List<CategoryModel> getAllCategories() {
	    List<CategoryModel> categories = new ArrayList<>();
	    String sql = "SELECT * FROM category";

	    try (Connection conn = DBConnections.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            CategoryModel category = new CategoryModel(
	                    rs.getInt("CategoryID"),
	                    rs.getString("CategoryName")
	            );
	            categories.add(category);
	        }

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    return categories;
	}
    
    
}