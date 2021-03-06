package thuongnguyen.it78.daos;

import thuongnguyen.it78.configs.LibraryMethod;
import thuongnguyen.it78.models.Shoes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShoesDAO {

    public ShoesDAO() {

    }

    // lấy một shoes chi tiết
    public static Shoes getShoes(int shoesId) {

        String query = "select sd.shoes_detail_id, s.shoes_name, s.shoes_image, s.shoes_description," +
                " sd.shoes_detail_price, sd.shoes_detail_color, sd.shoes_detail_stock, ss.size_name, s.shoes_gender " +
                "from shoes as s, shoes_details as sd, sizes as ss " +
                "where s.shoes_id = sd.shoes_id and sd.shoes_id = ? and sd.size_id = ss.size_id and ss.size_id = 1 " +
                "limit 1;";

        Connection connect = null;
        PreparedStatement pstmt = null;
        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setInt(1, shoesId);
            ResultSet rs =  pstmt.executeQuery();
            while(rs.next()) {
                int shoesID = Integer.parseInt(rs.getString(1));
                String shoesName = rs.getString(2);
                String shoesImage = rs.getString(3);
                String shoesDescription = rs.getString(4);
                double shoesPrice = Double.parseDouble(rs.getString(5));
                String shoesColor = rs.getString(6);
                int shoesStock = Integer.parseInt(rs.getString(7));
                String shoesSize = rs.getString(8);
                int shoesGender = Integer.parseInt(rs.getString(9));



                Shoes shoes = new Shoes();

                shoes.setId(shoesID);
                shoes.setName(shoesName);
                shoes.setImage(shoesImage);
                shoes.setDescription(shoesDescription);
                shoes.setPrice(shoesPrice);
                shoes.setColor(shoesColor);
                shoes.setStock(shoesStock);
                shoes.setSize(shoesSize);
                shoes.setType(shoesGender);

                // clean up environment
                rs.close();
                pstmt.close();
                connect.close();

                return shoes;
            }
            // clean up environment
            rs.close();
            pstmt.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // kiểm tra id shoes này là thuộc category nào
    public static String getCategoryByShoesID(int id) {
        String query = "select c.category_name from categories as c, shoes as s, shoes_details as sd " +
                "where sd.shoes_detail_id = ? and sd.shoes_id = s.shoes_id and s.category_id = c.category_id " +
                "limit 1";
        Connection connect = null;
        PreparedStatement pstmt = null;
        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs =  pstmt.executeQuery();
            while(rs.next()) {
                String result = rs.getString(1);
                // clean up environment
                rs.close();
                pstmt.close();
                connect.close();

                return result.trim();
            }
            // clean up environment
            rs.close();
            pstmt.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Shoes";
    }

    // lấy một list shoes detail theo giới tính
    public static ArrayList<Shoes> getListShoesByGender(int gender) {
        ArrayList<Shoes> listShoes = new ArrayList<Shoes>();

        String query = "select s.shoes_id, s.shoes_name, s.shoes_image, sd.shoes_detail_price, " +
                "sd.shoes_detail_color from shoes as s, shoes_details as sd where s.shoes_id = " +
                "sd.shoes_id and s.shoes_gender = ? and sd.shoes_detail_isDelete != 1 group by shoes_id, shoes_name, shoes_image, " +
                "shoes_detail_price, shoes_detail_color";

        Connection connect = null;
        PreparedStatement pstmt = null;
        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setInt(1, gender);
            ResultSet rs =  pstmt.executeQuery();
            while(rs.next()) {
                int shoesID = Integer.parseInt(rs.getString(1));
                String shoesName = rs.getString(2);
                String shoesImage = rs.getString(3);
                double shoesPrice = Double.parseDouble(rs.getString(4));
                String shoesColor = rs.getString(5);

                Shoes shoes = new Shoes();
                shoes.setId(shoesID);
                shoes.setName(shoesName);
                shoes.setImage(shoesImage);
                shoes.setPrice(shoesPrice);
                shoes.setColor(shoesColor);

                listShoes.add(shoes);
            }
            // clean up environment
            rs.close();
            pstmt.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listShoes;
    }

    // lấy ra một đôi giày bằng shoes detail id
    public static Shoes getShoesByShoesDetailId(int shoesDetailId) {

        String query = "select sd.shoes_detail_id, s.shoes_name, s.shoes_image," +
                " sd.shoes_detail_price, sd.shoes_detail_color, ss.size_name " +
                "from shoes as s, shoes_details as sd, sizes as ss " +
                "where s.shoes_id = sd.shoes_id and sd.shoes_detail_id = ? and sd.size_id = ss.size_id " +
                "limit 1;";

        Connection connect = null;
        PreparedStatement pstmt = null;
        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setInt(1, shoesDetailId);
            ResultSet rs =  pstmt.executeQuery();
            while(rs.next()) {
                int shoesID = Integer.parseInt(rs.getString(1));
                String shoesName = rs.getString(2);
                String shoesImage = rs.getString(3);
                double shoesPrice = Double.parseDouble(rs.getString(4));
                String shoesColor = rs.getString(5);
                String shoesSize = rs.getString(6);

                Shoes shoes = new Shoes();

                shoes.setId(shoesID);
                shoes.setName(shoesName);
                shoes.setImage(shoesImage);
                shoes.setPrice(shoesPrice);
                shoes.setColor(shoesColor);
                shoes.setSize(shoesSize);

                // clean up environment
                rs.close();
                pstmt.close();
                connect.close();

                return shoes;
            }
            // clean up environment
            rs.close();
            pstmt.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // lấy ra một đôi giày bằng shoesID và size id
    public static int getIdBySizeAndId(int shoesID, int sizeID) {
        String query = "select shoes_detail_id from shoes_details " +
                "where shoes_id = ? and size_id = ? ";

        Connection connect = null;
        PreparedStatement pstmt = null;
        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setInt(1, shoesID);
            pstmt.setInt(2, sizeID);
            ResultSet rs =  pstmt.executeQuery();

            while(rs.next()) {
                int shoesDetailID = Integer.parseInt(rs.getString(1));

                // clean up environment
                rs.close();
                pstmt.close();
                connect.close();

                return shoesDetailID;
            }
            // clean up environment
            rs.close();
            pstmt.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return shoesID;
    }

    // get list shoes
    public static ArrayList<Shoes> getListShoes(int category, int price, int size, int gender, String sort, int start, int limit) {
        ArrayList<Shoes> listShoes = new ArrayList<>();
        String categoryFilter = " and s.category_id = " + category;
        String genderFilter = " and s.shoes_gender = " + gender;

        String template = "";
        String sortTemplate = "";

        if(category != 0) template += categoryFilter;
        if(price != 0) template += LibraryMethod.filterPrice(price);
        if(gender != 0) template += genderFilter;
        if(sort != null) sortTemplate += LibraryMethod.filterSort(sort);

        String query = "select s.shoes_id, s.shoes_name, s.shoes_image, sd.shoes_detail_price, sd.shoes_detail_color " +
                "from shoes as s, shoes_details as sd " +
                "where s.shoes_id = sd.shoes_id and sd.shoes_detail_isDelete != 1 " + template +
                " group by shoes_id, shoes_name, shoes_image, shoes_detail_price, shoes_detail_color " +
                sortTemplate +
                " limit " + start +", " + limit;

        Connection connect = null;
        PreparedStatement pstmt = null;
        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            ResultSet rs =  pstmt.executeQuery();
            while(rs.next()) {
                int shoesID = Integer.parseInt(rs.getString(1));
                String shoesName = rs.getString(2);
                String shoesImage = rs.getString(3);
                double shoesPrice = Double.parseDouble(rs.getString(4));
                String shoesColor = rs.getString(5);

                Shoes shoes = new Shoes();
                shoes.setId(shoesID);
                shoes.setName(shoesName);
                shoes.setImage(shoesImage);
                shoes.setPrice(shoesPrice);
                shoes.setColor(shoesColor);

                listShoes.add(shoes);
            }
            // clean up environment
            rs.close();
            pstmt.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listShoes;
    }

    // ADMIN
    // create
    public static boolean createShoes(Shoes shoes, int size1, int size2, int size3, int size4,
                                      double price1, double price2, double price3, double price4,
                                      int stock1, int stock2, int stock3, int stock4) {

        String query = "insert into shoes (shoes_name, shoes_description, shoes_gender, shoes_image, category_id) values(?, ?, ?, ?, ?)";
        String query1 = "insert into shoes_details (shoes_detail_color, shoes_id, size_id, shoes_detail_price, shoes_detail_stock) " +
                "values(?, ?, ?, ?, ?)," +
                "(?, ?, ?, ?, ?)," +
                "(?, ?, ?, ?, ?)," +
                "(?, ?, ?, ?, ?)";



                Connection connect = null;
        PreparedStatement pstmt = null;

        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, shoes.getName());
            pstmt.setString(2, shoes.getDescription());
            pstmt.setInt(3, shoes.getType());
            pstmt.setString(4, shoes.getImage());
            pstmt.setInt(5, shoes.getCategoryID());

            pstmt.executeUpdate();

            // clean up environment
            pstmt.close();
            connect.close();

            int shoesIDInsert = getColumnBig();

            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query1);
            pstmt.setString(1, shoes.getColor());
            pstmt.setInt(2, shoesIDInsert);
            pstmt.setInt(3, size1);
            pstmt.setDouble(4, price1);
            pstmt.setInt(5, stock1);

            pstmt.setString(6, shoes.getColor());
            pstmt.setInt(7, shoesIDInsert);
            pstmt.setInt(8, size2);
            pstmt.setDouble(9, price2);
            pstmt.setInt(10, stock2);

            pstmt.setString(11, shoes.getColor());
            pstmt.setInt(12, shoesIDInsert);
            pstmt.setInt(13, size3);
            pstmt.setDouble(14, price3);
            pstmt.setInt(15, stock3);

            pstmt.setString(16, shoes.getColor());
            pstmt.setInt(17, shoesIDInsert);
            pstmt.setInt(18, size4);
            pstmt.setDouble(19, price4);
            pstmt.setInt(20, stock4);

            pstmt.executeUpdate();
            pstmt.close();
            connect.close();

            return true;


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    public static boolean deleteShoes(int shoesDetailID) {
        String query = "update shoes_details set shoes_detail_isDelete = 1 where shoes_detail_id = ?";

        Connection connect = null;
        PreparedStatement pstmt = null;

        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setInt(1, shoesDetailID);
            pstmt.executeUpdate();



            pstmt.executeUpdate();
            pstmt.close();
            connect.close();

            return true;


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;

    }


    public static boolean updateShoes(Shoes shoes) {

        String query = "update shoes set shoes_name = ?, shoes_description = ?, category_id = ? where shoes_id = " + getShoesIDbyShoesDetailID(shoes.getId());
        String query1 = "update shoes_details set shoes_detail_color = ?, shoes_detail_price = ?, shoes_detail_stock = ?, shoes_detail_active = ? where shoes_detail_id = ?";


        Connection connect = null;
        PreparedStatement pstmt = null;

        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, shoes.getName());
            pstmt.setString(2, shoes.getDescription());
            pstmt.setInt(3, shoes.getCategoryID());
            pstmt.executeUpdate();

            // clean up environment
            pstmt.close();

            pstmt = connect.prepareStatement(query1);
            pstmt.setString(1, shoes.getColor());
            pstmt.setDouble(2, shoes.getPrice());
            pstmt.setInt(3, shoes.getStock());
            pstmt.setInt(4, shoes.getActive());
            pstmt.setInt(5, shoes.getId());


            pstmt.executeUpdate();
            pstmt.close();
            connect.close();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static int getShoesIDbyShoesDetailID(int shoesDetailID) {
        String query = "select shoes_id from shoes_details where shoes_details.shoes_detail_id = ?";
        System.out.println(shoesDetailID);
        Connection connect = null;
        PreparedStatement pstmt = null;

        int result;

        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            pstmt.setInt(1, shoesDetailID);

            ResultSet rs = pstmt.executeQuery();
            rs.next();
            result = rs.getInt(1);


            rs.close();
            pstmt.close();
            connect.close();

            return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static int getColumnBig() {
        String query = "select shoes_id from shoes order by shoes_id desc";

        Connection connect = null;
        PreparedStatement pstmt = null;

        int result;

        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();
            rs.next();
            result = rs.getInt(1);


            rs.close();
            pstmt.close();
            connect.close();

            return result;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    // lấy một list shoes detail theo giới tính
    public static ArrayList<Shoes> getAllShoesDetail() {
        ArrayList<Shoes> listShoes = new ArrayList<Shoes>();

        String query = "select s.shoes_name, s.shoes_description, s.shoes_gender, s.shoes_image, s.category_id, sd.shoes_detail_id," +
                "sd.shoes_detail_price, sd.shoes_detail_stock, sd.shoes_detail_active, sd.shoes_detail_color, " +
                "sd.size_id from shoes as s, shoes_details as sd where s.shoes_id = sd.shoes_id and sd.shoes_detail_isDelete = 0";

        Connection connect = null;
        PreparedStatement pstmt = null;
        try {
            connect = ConnectDB.getConnection();
            pstmt = connect.prepareStatement(query);
            ResultSet rs =  pstmt.executeQuery();
            while(rs.next()) {
                String shoesName = rs.getString(1);
                String shoesDescription = rs.getString(2);
                int shoesGender = rs.getInt(3);
                String shoesImage = rs.getString(4);
                int shoesCategory = rs.getInt(5);
                int shoesID = rs.getInt(6);
                double shoesPrice = rs.getDouble(7);
                int shoesStock = rs.getInt(8);
                int shoesActive = rs.getInt(9);
                String shoesColor = rs.getString(10);
                int shoesSize = rs.getInt(11);

                Shoes shoes = new Shoes();

                shoes.setId(shoesID);
                shoes.setName(shoesName);
                shoes.setImage(shoesImage);
                shoes.setPrice(shoesPrice);
                shoes.setColor(shoesColor);
                shoes.setDescription(shoesDescription);
                shoes.setType(shoesGender);
                shoes.setStock(shoesStock);
                shoes.setSize(String.valueOf(shoesSize));
                shoes.setActive(shoesActive);
                shoes.setCategoryID(shoesCategory);


                listShoes.add(shoes);
            }
            // clean up environment
            rs.close();
            pstmt.close();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listShoes;
    }




    public static void main(String[] args) {
        Shoes shoes = new Shoes();
        shoes.setId(1);
        shoes.setName("DEMO");
        shoes.setActive(0);
        shoes.setColor("LOVEYOU3000");
        shoes.setStock(0);
        shoes.setDescription("LOVEYOU3000 time 2");
        shoes.setPrice(100);
        shoes.setSize("42");
        shoes.setImage("URL IMAGE");
        shoes.setType(1);
        shoes.setCategoryID(2);

        // System.out.println(createShoes(shoes));
        System.out.println(getAllShoesDetail().toString());


        int category = 6;

        // ShoesDAO.updateShoes(shoes);
        // System.out.println(ShoesDAO.getShoesIDbyShoesDetailID(5));
        // System.out.println(ShoesDAO.getColumnBig());
    }

}
