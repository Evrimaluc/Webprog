/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proje;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

/**
 *
 * @author USER2
 */
public class vt_baglan {

    public ArrayList<String> TCler = new ArrayList<String>();
    public ArrayList<Time> saatler = new ArrayList<Time>();
    public ArrayList<String> Onaylar = new ArrayList<String>();
    public ArrayList<String> Tarhiler = new ArrayList<String>();
    public ArrayList<String> yazi = new ArrayList<String>();
    public String kontrol;
    public String tel;
    public String posta;
    public String Sifre;
    public String Tur;

    public void giris_yap(String tc, String isim, String sifre) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT COUNT(*) as miktar FROM Kisiler WHERE TCKimlikNo = ? AND Sifre = ? AND isim = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, tc);
            preparedStatement.setString(2, sifre);
            preparedStatement.setString(3, isim);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                kontrol = rs.getString("miktar");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void kayit_yap(String tc, String isim, String sifre, String mail, String telefon) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "INSERT INTO Kisiler VALUES (Null, ?, ?, ?, 'Üye', ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, tc);
            preparedStatement.setString(2, isim);
            preparedStatement.setString(3, sifre);
            preparedStatement.setString(4, mail);
            preparedStatement.setString(5, telefon);
            preparedStatement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void kontrol_et(String tc) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT COUNT(*) as miktar FROM Kisiler where TCKimlikNo = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, tc);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                kontrol = rs.getString("miktar");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void guncelle(String isim, String posta, String telefon_no, String tc) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "UPDATE Kisiler SET isim= ?, EMail= ?, TelephoneNo= ? WHERE TCKimlikNo= ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, isim);
            preparedStatement.setString(2, posta);
            preparedStatement.setString(3, telefon_no);
            preparedStatement.setString(4, tc);
            preparedStatement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sifre_guncelle(String sifre, String tc) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "UPDATE Kisiler SET Sifre= ? WHERE TCKimlikNo= ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, sifre);
            preparedStatement.setString(2, tc);
            preparedStatement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String sifre_kontrol(String tc) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT Sifre FROM Kisiler WHERE TCKimlikNo = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, tc);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Sifre = rs.getString("Sifre");
            }
            conn.close();
         } catch (Exception e) {
            e.printStackTrace();
        }
        return Sifre;
    }

    public void yaz(String tc) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT EMail, TelephoneNo FROM Kisiler WHERE TCKimlikNo = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, tc);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                posta = rs.getString("EMail");
                tel = rs.getString("TelephoneNo");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void uye_tur(String tc) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT UyeTuru FROM Kisiler WHERE TCKimlikNo = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, tc);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Tur = rs.getString("UyeTuru");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void randevu_kayit_yap(String tc, Date tarih, Time saat, String onay) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "INSERT INTO randevular (TCKimlikNo, Tarih, Saat, Onay) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, tc);
            preparedStatement.setDate(2, tarih);
            preparedStatement.setTime(3, saat);
            preparedStatement.setString(4, onay);
            preparedStatement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getir(Date tarih) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT TCKimlikNo, Saat, Onay FROM randevular where Tarih = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            ResultSet rs = preparedStatement.executeQuery();
            TCler.clear();
            saatler.clear();
            Onaylar.clear();
            while (rs.next()) {
                String tc1 = rs.getString("TCKimlikNo");
                TCler.add(tc1);
                Time saat1 = rs.getTime("Saat");
                saatler.add(saat1);
                String Onay1 = rs.getString("Onay");
                Onaylar.add(Onay1);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void randevu_sil(Date tarih, Time saat) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "DELETE FROM randevular WHERE Tarih = ? AND Saat = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            preparedStatement.setTime(2, saat);
            preparedStatement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void randevu_kontrol(Date tarih, Time saat) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT COUNT(*) as miktar FROM randevular WHERE Tarih = ? AND Saat = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            preparedStatement.setTime(2, saat);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                kontrol = rs.getString("miktar");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void yazdir(Date tarih, Time saat) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT * FROM Kisiler RIGHT JOIN randevular ON Kisiler.TCKimlikNo = randevular.TCKimlikNo WHERE (Tarih > ? AND Onay = 'onaylandı') OR (Tarih = ? AND Saat >= ? AND Onay = 'onaylandı') ORDER BY Tarih ASC, Saat ASC";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            preparedStatement.setDate(2, tarih);
            preparedStatement.setTime(3, saat);
            ResultSet rs = preparedStatement.executeQuery();
            int i = 0;
            while (rs.next()) {
                i = i + 1;
                yazi.add(String.valueOf(i));
                yazi.add(rs.getString("randevular.TCKimlikNo"));
                yazi.add(rs.getString("isim"));
                yazi.add(rs.getString("EMail"));
                yazi.add(rs.getString("TelephoneNo"));
                yazi.add(rs.getString("Tarih"));
                yazi.add(rs.getString("Saat"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eski_yazdir(Date tarih, Time saat) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT * FROM Kisiler RIGHT JOIN randevular ON Kisiler.TCKimlikNo = randevular.TCKimlikNo WHERE (Tarih < ? AND Onay = 'onaylandı') OR (Tarih = ? AND Saat <= ? AND Onay = 'onaylandı') ORDER BY Tarih DESC, Saat DESC";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            preparedStatement.setDate(2, tarih);
            preparedStatement.setTime(3, saat);
            ResultSet rs = preparedStatement.executeQuery();
            int i = 0;
            while (rs.next()) {
                i = i + 1;
                yazi.add(String.valueOf(i));
                yazi.add(rs.getString("TCKimlikNo"));
                yazi.add(rs.getString("isim"));
                yazi.add(rs.getString("EMail"));
                yazi.add(rs.getString("TelephoneNo"));
                yazi.add(rs.getString("Tarih"));
                yazi.add(rs.getString("Saat"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void onay_yazdir(Date tarih, Time saat) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT * FROM Kisiler RIGHT JOIN randevular ON Kisiler.TCKimlikNo = randevular.TCKimlikNo WHERE (Tarih > ? AND Onay = 'onaylanmadı') OR (Tarih = ? AND Saat >= ? AND Onay = 'onaylanmadı') ORDER BY Tarih ASC, Saat ASC";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            preparedStatement.setDate(2, tarih);
            preparedStatement.setTime(3, saat);
            ResultSet rs = preparedStatement.executeQuery();
            int i = 0;
            while (rs.next()) {
                i = i + 1;
                yazi.add(String.valueOf(i));
                yazi.add(rs.getString("randevular.TCKimlikNo"));
                yazi.add(rs.getString("isim"));
                yazi.add(rs.getString("EMail"));
                yazi.add(rs.getString("TelephoneNo"));
                yazi.add(rs.getString("Tarih"));
                yazi.add(rs.getString("Saat"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void onay_guncelle(Date tarih, Time saat) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "UPDATE randevular SET Onay = 'onaylandı' WHERE Tarih = ? AND Saat = ?";

            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            preparedStatement.setTime(2, saat);
            preparedStatement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void onay_getir(Date tarih, Time saat) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://data.sobiad.com/ostim", "sinif", "123456");
            String sql = "SELECT COUNT(*) as miktar FROM Kisiler RIGHT JOIN randevular ON Kisiler.TCKimlikNo = randevular.TCKimlikNo WHERE (Tarih > ? AND Onay = 'onaylanmadı') OR (Tarih = ? AND Saat >= ? AND Onay = 'onaylanmadı') ORDER BY Tarih ASC, Saat ASC";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, tarih);
            preparedStatement.setDate(2, tarih);
            preparedStatement.setTime(3, saat);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                kontrol = rs.getString("miktar");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}