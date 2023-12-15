/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proje;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author USER2
 */
public class sesion {

    private String tc;
    private String isim;
    private String tel;
    private String email;
    private String tur;
    public LocalDate Bugun = LocalDate.now();
    public Date Bugun2 = Date.valueOf(Bugun);
    private Date Birgun = Date.valueOf(Bugun);
    public LocalTime Bugun_saat = LocalTime.now();
    public Time Bugun_saat2 = new Time((Bugun_saat.getHour() - 2)*60*60*1000 + Bugun_saat.getMinute()*60*1000 + Bugun_saat.getSecond()*1000);

    public String getTc() {
        return tc;
    }

    public void setTc(String tc) {
        this.tc = tc;
    }

    public String getIsim() {
        return isim;
    }

    public void setIsim(String isim) {
        this.isim = isim;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTur() {
        return tur;
    }

    public void setTur(String tur) {
        this.tur = tur;
    }

    public Date getBirgun() {
        return Birgun;
    }

    public void setBirgun(Date Birgun) {
        this.Birgun = Birgun;
    }
}