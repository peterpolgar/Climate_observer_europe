import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.lang.Math;
import java.io.*;
import geomerative.*;

// general
int twice_run = -2;
float prev_mouseX = 0f, prev_mouseY = 0f;
float win_height = 0f, win_width = 0f, bc_color = 240f;
PFont myFont;
boolean is_kezdet = true;
class Ui_parameters {
    int city_choosed;
    boolean[] map_kiv_cities;
    boolean isFirst;
    float rect_kiv_tx;
    float rect_kiv_ty;
    float rect_kiv_bx;
    float rect_kiv_by;
    float lat_1_tx;
    float lat_1_ty;
    float lat_1_bx;
    float lat_1_by;
    float lat_2_tx;
    float lat_2_ty;
    float lat_2_bx;
    float lat_2_by;
    float lon_1_tx;
    float lon_1_ty;
    float lon_1_bx;
    float lon_1_by;
    float lon_2_tx;
    float lon_2_ty;
    float lon_2_bx;
    float lon_2_by;
    float act_lat_k;
    float act_lat_v;
    float act_lon_k;
    float act_lon_v;
    int megj_f_start;
    int megj_a_start;
    int kiv_city_count;
    int dia_kiv_f_city_count;
    int dia_kiv_a_city_count;
    int dia_f_act_kiv_idx;
    int dia_a_act_kiv_idx;
    int[] dia_f_kiv_cities_idx, dia_a_kiv_cities_idx, vis_f_kiv_idx, vis_a_kiv_idx;
    int[] dia_f_allkiv_cities_idx, dia_a_allkiv_cities_idx;
    String text_f_allnone, text_a_allnone;
    int fo_f_ido_menu_kiv,  fo_a_ido_menu_kiv;
    String fo_f_text_from, fo_f_text_to, fo_f_text_agg, fo_f_text_al_k, fo_f_text_al_v, fo_a_text_from, fo_a_text_to, fo_a_text_agg, fo_a_text_al_k, fo_a_text_al_v;
    float fo_f_slider_k_tx, fo_f_slider_k_bx, fo_f_slider_v_tx, fo_f_slider_v_bx;
    float fo_a_slider_k_tx, fo_a_slider_k_bx, fo_a_slider_v_tx, fo_a_slider_v_bx;
    int fo_f_k_year, fo_f_v_year, fo_a_k_year, fo_a_v_year;
    int fo_f_agg_kiv, fo_a_agg_kiv, fo_f_agg_count, fo_a_agg_count;
    int fo_f_al_k_day, fo_f_al_k_month, fo_f_al_v_day, fo_f_al_v_month;
    int fo_a_al_k_day, fo_a_al_k_month, fo_a_al_v_day, fo_a_al_v_month;
    int eddig_f_k, eddig_f_v, eddig_a_k, eddig_a_v;
    // lehetosegek
    boolean[] fo_f_is_attr, fo_f_is_muv, fo_a_is_attr, fo_a_is_muv;
    int fo_lehet_map_ter, fo_lehet_map_attr, fo_lehet_map_muv;
    boolean fo_f_is_dev, fo_f_is_inter_jobb, fo_f_is_inter_bal, fo_f_is_many_jobb, fo_f_is_many_bal;
    boolean fo_a_is_dev, fo_a_is_inter_jobb, fo_a_is_inter_bal, fo_a_is_many_jobb, fo_a_is_many_bal;
    boolean fo_f_is_hm, fo_a_is_hm, fo_f_is_hm_ch, fo_a_is_hm_ch;
    int fo_f_attr_kiv_count, fo_f_muv_kiv_count, fo_a_attr_kiv_count, fo_a_muv_kiv_count;
    int fo_f_attr_min_idx, fo_a_attr_min_idx, fo_f_muv_min_idx, fo_a_muv_min_idx;
    int[] fo_lehet_f_am_lens, fo_lehet_a_am_lens;
    int fo_f_group_num, fo_a_group_num;
    boolean fo_f_is_ng_muv, fo_a_is_ng_muv;
    // mavi
    boolean mavi_is_magma;
    // draw diagrams
    boolean fo_f_exec, fo_a_exec;
    int chart_f_start_year, chart_f_end_year, chart_a_start_year, chart_a_end_year;
    boolean is_f_calc_years, is_a_calc_years, is_f_agg_changed, is_a_agg_changed;
    boolean is_f_ut_heatmap, is_heatmap_drawed;
    int chart_f_x_beoszt_szama, chart_a_x_beoszt_szama;
    float[] chart_f_x_beoszt_xs, chart_a_x_beoszt_xs;
    String[] chart_f_x_labels, chart_a_x_labels, chart_f_y_labels, chart_a_y_labels;
    // kirajz
    int kir_f_agg_count, kir_f_elozo_type, kir_f_elozo_unicount;
    int kir_a_agg_count, kir_a_elozo_type, kir_a_elozo_unicount;
    String[] mav_f_labels, mav_a_labels;
    public Ui_parameters() {
        city_choosed = 0;
        map_kiv_cities = new boolean[200];
        for ( int i = 0; i < 200; ++i ) {
            map_kiv_cities[i] = false;
        }
        megj_f_start = 0;
        megj_a_start = 0;
        kiv_city_count = 0;
        dia_kiv_f_city_count = 0;
        dia_kiv_a_city_count = 0;
        dia_f_kiv_cities_idx = new int[7];
        dia_a_kiv_cities_idx = new int[7];
        for ( int i = 0; i < 7; ++i ) {
            dia_f_kiv_cities_idx[i] = -1;
            dia_a_kiv_cities_idx[i] = -1;
        }
        vis_f_kiv_idx = new int[18];
        vis_a_kiv_idx = new int[18];
        for ( int i = 0; i < 18; ++i ) {
            vis_f_kiv_idx[i] = -1;
            vis_a_kiv_idx[i] = -1;
        }
        dia_f_allkiv_cities_idx = new int[200];
        dia_a_allkiv_cities_idx = new int[200];
        for ( int i = 0; i < 200; ++i ) {
            dia_f_allkiv_cities_idx[i] = -1;
            dia_a_allkiv_cities_idx[i] = -1;
        }
        isFirst = true;
        text_f_allnone = "select first 7";
        text_a_allnone = "select first 7";
        dia_f_act_kiv_idx = 0; dia_a_act_kiv_idx = 0;
        //  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
        fo_f_ido_menu_kiv = -1;  fo_a_ido_menu_kiv = -1;
        fo_f_text_from = "From: 1973"; fo_f_text_to = "To: 2020"; fo_f_text_agg = "Agg.: 1 year";
        fo_f_text_al_k = "Al. k.: 01.01."; fo_f_text_al_v = "Al. v.: 12.31."; fo_a_text_from = "From: 1973";
        fo_a_text_to = "To: 2020"; fo_a_text_agg = "Agg.: 1 year"; fo_a_text_al_k = "Al. k.: 01.01.";
        fo_a_text_al_v = "Al. v.: 12.31.";
        fo_f_k_year = 1973; fo_f_v_year = 2020; fo_a_k_year = 1973; fo_a_v_year = 2020;
        fo_f_agg_kiv = 0; fo_a_agg_kiv = 0; fo_f_agg_count = 6; fo_a_agg_count = 6;
        fo_f_al_k_day = 1; fo_f_al_k_month = 1; fo_f_al_v_day = 31; fo_f_al_v_month = 12;
        fo_a_al_k_day = 1; fo_a_al_k_month = 1; fo_a_al_v_day = 31; fo_a_al_v_month = 12;
        eddig_f_k = 31; eddig_f_v = 31; eddig_a_k = 31; eddig_a_v = 31;
        // lehetosegek
        fo_f_is_attr = new boolean[13];
        fo_a_is_attr = new boolean[13];
        for ( int i = 0; i < 13; ++i ) {
            fo_f_is_attr[i] = false;
            fo_a_is_attr[i] = false;
        }
        fo_f_is_muv = new boolean[5];
        fo_a_is_muv = new boolean[5];
        for ( int i = 0; i < 5; ++i ) {
            fo_f_is_muv[i] = false;
            fo_a_is_muv[i] = false;
        }
        fo_lehet_map_ter = -1; fo_lehet_map_attr = -1; fo_lehet_map_muv = -1;
        fo_f_is_dev = false; fo_f_is_inter_jobb = false; fo_f_is_inter_bal = false; fo_f_is_many_jobb = false;
        fo_f_is_many_bal = false; fo_f_is_hm = false;
        fo_a_is_dev = false; fo_a_is_inter_jobb = false; fo_a_is_inter_bal = false; fo_a_is_many_jobb = false;
        fo_a_is_many_bal = false; fo_a_is_hm = false; fo_f_is_hm_ch = false; fo_a_is_hm_ch = false;
        fo_f_attr_kiv_count = 0; fo_f_muv_kiv_count = 0; fo_a_attr_kiv_count = 0; fo_a_muv_kiv_count = 0;
        fo_f_attr_min_idx = 0; fo_a_attr_min_idx = 0; fo_f_muv_min_idx = 0; fo_a_muv_min_idx = 0;
        fo_lehet_f_am_lens = new int[] { 5, 5, 5, 3, 4, 4, 4, 3, 3, 4, 4, 2, 2 };
        fo_lehet_a_am_lens = new int[] { 5, 5, 5, 3, 4, 4, 4, 3, 3, 4, 4, 2, 2 };
        fo_f_group_num = 0; fo_a_group_num = 0;
        fo_f_is_ng_muv = false; fo_a_is_ng_muv = false;
        mavi_is_magma = true;
        fo_f_exec = false; fo_a_exec = false;
        chart_f_start_year = 1973; chart_f_end_year = 2020; chart_a_start_year = 1973; chart_a_end_year = 2020;
        is_f_calc_years = false; is_a_calc_years = false; is_f_agg_changed = true; is_a_agg_changed = true;
        is_f_ut_heatmap = false; is_heatmap_drawed = false;
        chart_f_x_beoszt_szama = 0; chart_a_x_beoszt_szama = 0;
        chart_f_x_beoszt_xs = new float[40]; chart_a_x_beoszt_xs = new float[40];
        chart_f_x_labels = new String[40]; chart_a_x_labels = new String[40];
        chart_f_y_labels = new String[11]; chart_a_y_labels = new String[11];
        for ( int i = 0; i < 11; ++i ) {
            chart_f_y_labels[i] = "1009.9";
            chart_a_y_labels[i] = "1009.9";
        }
        kir_f_agg_count = 0; kir_f_elozo_type = -1; kir_f_elozo_unicount = 0;
        kir_a_agg_count = 0; kir_a_elozo_type = -1; kir_a_elozo_unicount = 0;
        mav_f_labels = new String[11]; mav_a_labels = new String[11];
    }
}
Ui_parameters[] ui_instances = new Ui_parameters[10];
Ui_parameters current_instance;
// ---------------------------------------------------------------------------------------
// teruleti felosztasok
boolean dr_all = true, dr_map = false, dr_tab = false, dr_city_lists = false, dr_fo_ter_f = false, dr_fo_ter_a = false, dr_mavi = false, dr_mavtext = false;
// ---------------------------------------------------------------------------------------
// map valtozok -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
RShape eU_map, la1;
int[] idx_teruletek = { 0, 1, 3, 6, 7, 9, 10, 11, 14, 15, 16, 17, 18, 20, 32, 35, 36, 37, 38, 39, 40, 41, 43, 44, 45, 46, 48, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 61 };
int[] tavak_idx = { 0, 1, 2, 3, 10, 14, 15, 20, 22, 23, 24, 25, 26, 30, 31, 34, 35, 36, 37, 41, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 68, 70, 72, 74, 75, 76, 77, 78, 81, 83, 84, 85, 86, 87, 88, 89, 94, 95, 104, 106 };
float map_w = 0f, map_h = 0f, map_scale = 1f, map_ratio = 701.08234 / 1085.3909, map_eltolas = 0f;
float[] draw_map_rect = { 0f, 0f, 0f, 0f };
// ---------------------------------------------------------------------------------------
// telepulesek adatai
int city_count = 0;
final int max_varos = 200;
float[] x_ko = new float[max_varos];
float[] y_ko = new float[max_varos];
float[] draw_x = new float[max_varos];
float[] draw_y = new float[max_varos];
int[] haromszogek = {6, 8, 4, 8, 4, 3, 1, 3, 8, 0, 8, 6, 0, 8, 2, 2, 8, 1, 0, 5, 6, 5, 6, 7, 18, 17, 16, 17, 16, 15, 15, 19, 20, 14, 15, 20, 14, 15, 16, 13, 14, 16, 13, 18, 16, 11, 13, 18, 11, 3, 10, 11, 13, 10, 13, 12, 10, 13, 12, 14, 12, 14, 24, 14, 24, 20, 24, 20, 21, 21, 24, 22, 24, 12, 22, 22, 23, 12, 12, 23, 10, 9, 10, 23, 10, 1, 9, 2, 1, 9, 9, 23, 40, 22, 23, 39, 1, 3, 10, 22, 39, 38, 21, 22, 25, 22, 38, 25, 21, 26, 20, 21, 26, 25, 20, 26, 27, 19, 20, 27, 26, 27, 28, 26, 28, 34, 25, 26, 34, 25, 34, 38, 5, 7, 81, 81, 80, 5, 5, 80, 0, 0, 80, 79, 0, 2, 79, 2, 79, 76, 2, 76, 9, 76, 9, 40, 76, 40, 77, 76, 77, 78, 77, 40, 41, 77, 75, 41, 75, 77, 78, 78, 75, 74, 78, 74, 82, 82, 74, 71, 79, 78, 82, 82, 79, 81, 79, 80, 81, 76, 78, 79, 71, 74, 72, 74, 75, 73, 72, 73, 74, 75, 41, 73, 73, 41, 42, 73, 42, 48, 73, 48, 63, 73, 63, 65, 73, 65, 72, 72, 65, 68, 72, 68, 70, 72, 70, 71, 71, 70, 69, 70, 69, 67, 67, 68, 70, 68, 67, 66, 65, 66, 68, 65, 66, 64, 65, 64, 63, 63, 48, 47, 63, 47, 64, 64, 47, 60, 64, 61, 60, 39, 40, 41, 39, 41, 42, 39, 42, 38, 42, 48, 46, 42, 35, 46, 42, 35, 38, 38, 34, 35, 35, 46, 43, 35, 43, 36, 35, 36, 37, 36, 37, 43, 35, 37, 30, 35, 34, 30, 37, 33, 30, 34, 28, 29, 27, 28, 31, 28, 29, 31, 34, 30, 29, 29, 31, 30, 30, 31, 33, 31, 32, 33, 47, 48, 46, 46, 43, 44, 46, 44, 45, 46, 45, 53, 46, 60, 53, 46, 60, 47, 60, 61, 62, 60, 62, 53, 61, 59, 62, 59, 58, 62, 62, 54, 58, 62, 53, 54, 53, 55, 54, 54, 58, 57, 54, 55, 56, 54, 52, 56, 56, 51, 52, 51, 52, 49, 51, 49, 50, 50, 51, 56, 83, 84, 85, 83, 85, 87, 84, 85, 86, 85, 87, 88, 85, 88, 89, 85, 89, 86, 86, 89, 90, 89, 88, 91, 89, 90, 91, 90, 91, 92, 90, 93, 92, 91, 92, 94, 92, 94, 93, 91, 94, 95, 94, 95, 93, 95, 96, 93, 23, 39, 40};
String[] alpha2_of_countries = { "IS", "PT", "ES", "BE", "IT", "BY", "PL", "GR", "FI", "DE", "SE", "NO", "MD", "UA", "HR", "IE", "CH", "AT", "CZ", "SK", "HU", "LT", "LV", "RO", "BG", "EE", "", "LU", "FR", "", "NL", "BA", "SI", "RS", "", "MK", "AL", "ME", "GB", "GB", "", "DK" };
int[] country_idx_of_cities = new int[max_varos];
String[] country_code_of_cities = new String[max_varos];
int[] heat_city_idx = new int[max_varos];
float[] lats = new float[max_varos];
float[] lons = new float[max_varos];
int[] start_dates = new int[max_varos];
int[] end_dates = new int[max_varos];
LocalDate[] local_start_dates = new LocalDate[max_varos];
LocalDate[] local_end_dates = new LocalDate[max_varos];
String[] telep_texts = new String[max_varos];
// varosok idojarasi adatai
float[][] a_frshtt = new float[max_varos][];
float[][] a_dewp = new float[max_varos][];
float[][] a_temp = new float[max_varos][];
float[][] a_tmax = new float[max_varos][];
float[][] a_tmin = new float[max_varos][];
float[][] a_wdsp = new float[max_varos][];
float[][] a_mxsw = new float[max_varos][];
float[][] a_gust = new float[max_varos][];
float[][] a_prcp = new float[max_varos][];
float[][] a_sndp = new float[max_varos][];
float[][] a_slp = new float[max_varos][];
float[][] a_stp = new float[max_varos][];
float[][] a_visib = new float[max_varos][];
// ---------------------------------------------------------------------------------------
// ui valtozok
// tabok
float tab_height = 0f, a_tab_width = 0f;
float[] tab_recs = new float[40], tab_x_recs = new float[40], tab_kozep_vonalak = new float[10];
String[] tab_strings = new String[10], cop_tab_strings = new String[10];
int[] tab_texts = new int[10];
boolean[] isSzabad_tab_texts = new boolean[10];
boolean is_enter_name = false;
int tab_count = 1, max_tabcount = 10, active_tab = 0, tab_dragged = -1, ch_text_id = 0;
float add_tab_tx = 0f, add_tab_ty = 0f, add_tab_bx = 0f, add_tab_by = 0f;
// ---------------------------------------------------------------------------------------
// varosok kivalasztasa
float[] city_choose_recs = new float[16];
float sugar2 = 0f, rect_kiv_vastag = 0f;
int rectkiv_dragged = -1, latlon_dragged = -1;
float lat_slider_start = 0f, lat_slider_end = 0f, lon_slider_start = 0f, lon_slider_end = 0f, latlon_y = 0f;
float lat_max = 0f, lat_min = 0f, lon_max = 0f, lon_min = 0f;
float latlon_f_szoveg_y = 0f, latlon_a_szoveg_y = 0f;
float lat_kul = 0f, lat_slider_hossz = 0f, lon_kul = 0f, lon_slider_hossz = 0f, csuszka_wid = 0f;
// ---------------------------------------------------------------------------------------
// megj varosok lists
float[] kiv_szinek = { 0f, 0f, 0f, 220f, 0f, 0f, 0f, 255f, 0f, 0f, 0f, 255f, 255f, 255f, 0f, 255f, 0f, 255f, 255f, 158f, 0f };
float station1_rect_tx = 0f, station1_rect_ty = 0f, station1_rect_bx = 0f, station1_rect_by = 0f;
float station2_rect_tx = 0f, station2_rect_ty = 0f, station2_rect_bx = 0f, station2_rect_by = 0f;
float[] rect_f_kiv_cities = new float[72], rect_a_kiv_cities = new float[72];
float[] text_f_kiv_cities_y = new float[18], text_a_kiv_cities_y = new float[18];
float text_kiv_cities_x = 0f;
float[] kiv_f_cities_color_y = new float[18], kiv_a_cities_color_y = new float[18];
float navbar_f_cont_tx = 0f, navbar_f_cont_ty = 0f, navbar_f_cont_bx = 0f, navbar_f_cont_by = 0f;
float navbar_a_cont_tx = 0f, navbar_a_cont_ty = 0f, navbar_a_cont_bx = 0f, navbar_a_cont_by = 0f, navlen = 0f;
String text_select_7 = "select first 7", text_clear_selects = "clear selections";
// ---------------------------------------------------------------------------------------
// foelem  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
float fo_ido_menu_x_both_k = 0f, fo_ido_menu_x_both_v = 0f, fo_ido_menu_x_from = 0f, fo_ido_menu_x_to = 0f, fo_ido_menu_x_agg = 0f, fo_ido_menu_x_al_k = 0f, fo_ido_menu_x_al_v = 0f;
String fo_text_both = "Both";
float fo_text_y1 = 0f, fo_text_y2 = 0f, fo_text_x1 = 0f, fo_text_x2 = 0f, fo_text_x3 = 0f, fo_text_x4 = 0f, fo_text_x5 = 0f, fo_text_x6 = 0f;
float lenyil_f_rect_by = 0f, lenyil_a_rect_by = 0f;
float fo_slider_line_k_x = 0f, fo_slider_line_f_y = 0f, fo_slider_line_v_x = 0f, fo_slider_line_a_y = 0f;
float fo_f_slider_ty = 0f, fo_f_slider_by = 0f, fo_a_slider_ty = 0f, fo_a_slider_by = 0f;
float fo_f_line_szak_y_k = 0f, fo_f_line_szak_y_v = 0f, fo_a_line_szak_y_k = 0f, fo_a_line_szak_y_v = 0f;
float[] fo_f_line_szak_xs = new float[48];
String[] fo_slider_texts = new String[24];
float fo_f_text_y = 0f, fo_a_text_y = 0f, fo_slider_start = 0f, fo_slider_end = 0f, fo_slider_hossz = 0f;
int fo_f_dragged = -1, fo_a_dragged = -1;

String[] fo_agg_texts = { "1 year", "1 seas.", "6 mon.", "4 mon.", "2 mon.", "1 mon.", "2 week", "1 week", "1 day" };
float fo_agg_f_ty = 0f, fo_agg_f_by = 0f, fo_agg_a_ty = 0f, fo_agg_a_by = 0f, fo_f_agg_text_y = 0f, fo_a_agg_text_y = 0f;
float[] fo_agg_xs = new float[18], fo_agg_text_xs = new float[9];

float fo_al_text_x = 0f, fo_f_al_text_month_y = 0f, fo_f_al_text_day_y = 0f, fo_a_al_text_month_y = 0f, fo_a_al_text_day_y = 0f;
String fo_al_text_month = "month:", fo_al_text_day = "day:";
float fo_f_al_month_ty = 0f,  fo_f_al_month_by = 0f, fo_f_al_day_ty = 0f,  fo_f_al_day_by = 0f;
float fo_a_al_month_ty = 0f,  fo_a_al_month_by = 0f, fo_a_al_day_ty = 0f,  fo_a_al_day_by = 0f;
float[] fo_al_month_xs = new float[13], fo_al_day_xs = new float[32], fo_al_month_text_xs = new float[12], fo_al_day_text_xs = new float[31];
String[] fo_al_month_texts = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" }, fo_al_day_texts = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };
int[] days_of_months = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
// ---------------------------------------------------------------------------------------
// fo attributumok
float fo_f_attr_by = 0f, fo_a_attr_by = 0f, fo_f_attr_text_y = 0f, fo_a_attr_text_y = 0f;
float[] fo_attr_xs = new float[26], fo_attr_text_xs = new float[13];
String[] fo_attr_texts = { "avg temp", "max temp", "min temp", "dew point", "avg wind", "sus wind", "wind gust", "precip", "snow dep", "sea press", "st press", "visibility", "HTT" };
// lehetosegek
float fo_kisl_x1 = 0f, fo_kisl_x2 = 0f, fo_kisl_x3 = 0f, fo_kisl_x4 = 0f;
float fo_kisl_text_x1 = 0f, fo_kisl_text_x2 = 0f, fo_kisl_text_x3 = 0f, fo_kisl_text_x4 = 0f;
String fo_kisl_m_text = "m", fo_kisl_i_text = "i", fo_kisl_s_text = "s", fo_kisl_h_text = "h";

float fo_f_lehet_ty = 0f, fo_f_lehet_by = 0f, fo_f_lehet_text_y = 0f, fo_a_lehet_ty = 0f, fo_a_lehet_by = 0f, fo_a_lehet_text_y = 0f;
float[] fo_lehet_xs = new float[10], fo_lehet_text_xs = new float[5];
String[] fo_lehet_nagy_strings = { "avg", "max", "min", "max - min", "distribution", "avg temp - dp", "sum stacking / m.", "histogram", "stacked hist / m.", "sum" };
int[][] fo_lehet_attrs_muvs = { { 0, 1, 2, 3, 4 }, { 0, 1, 2, 3, 4 }, { 0, 1, 2, 3, 4 }, { 0, 4, 5 }, { 0, 1, 2, 4 }, { 0, 1, 2, 4 }, { 0, 1, 2, 4 }, { 1, 9, 6 }, { 1, 9, 6 }, { 0, 1, 2, 4 }, { 0, 1, 2, 4 }, { 0, 4 }, { 7, 8 } };
int[] fo_muv_groups = { 0, 0, 0, 0, 1, 1, 1, 2, 3, 4, 4, 5, 6 };
float fo_f_attr_color_y = 0f, fo_f_muv_color_y = 0f, fo_a_attr_color_y = 0f, fo_a_muv_color_y = 0f;
float[] fo_attr_colors = { 0f, 0f, 0f, 220f, 0f, 0f, 0f, 255f, 0f, 0f, 0f, 255f, 0f, 0f, 0f, 220f, 0f, 0f, 0f, 255f, 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f, 220f, 0f, 0f };
float[] fo_muv_colors = { 0f, 0f, 0f, 220f, 0f, 0f, 0f, 255f, 0f, 0f, 0f, 255f, 255f, 255f, 0f, 255f, 0f, 255f };
// mavi -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
float mavi_xko = 0f, mavi_xv = 0f, mavi_y1 = 0f, mavi_y2 = 0f, mavi_y3 = 0f;
float[] mavi_beoszt_xs = new float[11];
float mavi_beoszt_yt = 0f, mavi_beoszt_yb = 0f;
float mavi_text_y = 0f, mavi_text_xm = 0f, mavi_text_xv = 0f;
color[] viridis = { #440154, #481567, #482677, #453781, #404788, #39568C, #33638D, #2D708E, #287D8E, #238A8D, #1F968B, #20A387, #29AF7F, #3CBB75, #55C667, #73D055, #95D840, #B8DE29, #DCE319, #FDE725 };
color[] magma = { #000003, #06061d, #160f3b, #29115a, #401373, #56177d, #6b1d81, #802582, #952c80, #ab337c, #c03a76, #d6456c, #e85362, #f4685c, #fa815f, #fd9a69, #feb37b, #fecc8f, #fde4a6, #fcfdbf };
float mavi_draw_unit_w = 0f;
float mavi_murect_text_x = 0f, mavi_murect_text_y = 0f, mav_lab_text_y = 0f;
float mavi_meas_unit_rect_tx = 0f, mavi_meas_unit_rect_ty = 0f, mavi_meas_unit_rect_bx = 0f, mavi_meas_unit_rect_by = 0f;
float mavi_lab_rect_ty = 0f, mavi_lab_rect_by = 0f;
// ---------------------------------------------------------------------------------------
// chart
String[] chart_units_per_group = { "°C", "km/h", "mm", "cm", "hPa", "km", "pcs" };
float chart_f_y_axis_yt = 0f, chart_f_y_axis_yb = 0f, chart_a_y_axis_yt = 0f, chart_a_y_axis_yb = 0f, chart_y_axis_x = 0f, chart_x_axis_xr = 0f;
float chart_y_beoszt_kx = 0f, chart_f_x_beoszt_vy = 0f, chart_a_x_beoszt_vy = 0f, chart_x_axis_len = 0f, chart_y_axis_len = 0f;
float chart_y_labels_xr = 0f, chart_f_x_labels_y = 0f, chart_a_x_labels_y = 0f;
float[] chart_f_y_beoszt_ys = new float[11], chart_a_y_beoszt_ys = new float[11];
float[] chart_f_y_labels_y = new float[11], chart_a_y_labels_y = new float[11];
String[] year_strings = new String[48], cutted_year_strings = new String[48], week_strings = new String[52];
String[] normal_year_days = new String[365], szoko_ev_days = new String[366];
final int chart_max_beoszt = 36;
final float piper4 = PI / 4;
float chart_munit_bx = 0f, chart_munit_text_x = 0f;
float[] chart_stack_jm_xs = new float[13]; String[] chart_stack_jm_ss = { "1.", "2.", "3.", "4.", "5.", "6.", "7.", "8.", "9.", "10.", "11.", "12." };
// ---------------------------------------------------------------------------------------

void setup() {
    size(200, 200, P2D);
    smooth();
    
    // city_data.txt beolvasasa
    int count = 0;
    String localDir = sketchPath("");
    File formatDir = new File(localDir + "\\formatted_csv");
    File[] filesList = formatDir.listFiles();
    for(File f : filesList){
        if(f.isFile()){
            // println(f.getName());
            String fname = localDir + "\\formatted_csv\\" + f.getName();
            try {
                BufferedReader br = new BufferedReader(new FileReader(fname));
                String st = br.readLine();
                // println(st);
                if ( st != null ) {
                    String[] elsosor = st.split(";");
                    int okod = Integer.parseInt(elsosor[0]);
                    int azon = Integer.parseInt(elsosor[1]);
                    country_idx_of_cities[count] = okod;
                    country_code_of_cities[count] = alpha2_of_countries[okod];
                    heat_city_idx[azon] = count;
                    lats[count] = Float.parseFloat(elsosor[2]);
                    lons[count] = Float.parseFloat(elsosor[3]);
                    x_ko[count] = Integer.parseInt(elsosor[5]);
                    y_ko[count] = Integer.parseInt(elsosor[6]);
                    String[] std = elsosor[7].split("-");
                    int syear = Integer.parseInt(std[0]), smonth = Integer.parseInt(std[1]), sday = Integer.parseInt(std[2]);
                    start_dates[count] = syear * 500 + smonth * 32 + sday;
                    String[] end = elsosor[8].split("-");
                    int eyear = Integer.parseInt(end[0]), emonth = Integer.parseInt(end[1]), eday = Integer.parseInt(end[2]);
                    end_dates[count] = eyear * 500 + emonth * 32 + eday;
                    telep_texts[count] = country_code_of_cities[count] + " " + elsosor[9];
                    if ( telep_texts[count].length() > 20 ) {
                        telep_texts[count] = telep_texts[count].substring(0, 20);
                    }
                    
                    LocalDate dateStart = LocalDate.of(syear, smonth, sday);
                    LocalDate dateEnd = LocalDate.of(eyear, emonth, eday);
                    local_start_dates[count] = dateStart;
                    local_end_dates[count] = dateEnd;
                    int daysBetween = (int)ChronoUnit.DAYS.between(dateStart, dateEnd) + 1;
                    // println(daysBetween);
                    a_frshtt[count] = new float[daysBetween];
                    a_dewp[count] = new float[daysBetween];
                    a_temp[count] = new float[daysBetween];
                    a_tmax[count] = new float[daysBetween];
                    a_tmin[count] = new float[daysBetween];
                    a_wdsp[count] = new float[daysBetween];
                    a_mxsw[count] = new float[daysBetween];
                    a_gust[count] = new float[daysBetween];
                    a_prcp[count] = new float[daysBetween];
                    a_sndp[count] = new float[daysBetween];
                    a_slp[count] = new float[daysBetween];
                    a_stp[count] = new float[daysBetween];
                    a_visib[count] = new float[daysBetween];
                    
                    String line; int dcount = 0;
                    while ( (line = br.readLine()) != null ) {
                        String[] elems = line.split(";");
                        a_frshtt[count][dcount] = ((elems[0].charAt(3) == '1' || elems[0].charAt(4) == '1' || elems[0].charAt(5) == '1') ? 1f : 0f);
                        a_dewp[count][dcount] = Float.parseFloat(elems[1]);
                        a_temp[count][dcount] = Float.parseFloat(elems[2]);
                        a_tmax[count][dcount] = Float.parseFloat(elems[3]);
                        a_tmin[count][dcount] = Float.parseFloat(elems[4]);
                        a_wdsp[count][dcount] = Float.parseFloat(elems[5]);
                        a_mxsw[count][dcount] = Float.parseFloat(elems[6]);
                        a_gust[count][dcount] = Float.parseFloat(elems[7]);
                        a_prcp[count][dcount] = Float.parseFloat(elems[8]);
                        a_sndp[count][dcount] = Float.parseFloat(elems[9]);
                        a_slp[count][dcount] = Float.parseFloat(elems[10]);
                        a_stp[count][dcount] = Float.parseFloat(elems[11]);
                        a_visib[count][dcount] = Float.parseFloat(elems[12]);
                        ++dcount;
                    }
                    ++count;
                }else {
                    println("st is null");
                }
            }
            catch (FileNotFoundException e){
                System.out.println("hiba");
            }
            catch (IOException e){
                System.out.println("hiba2");
            }
        }
    }
    city_count = count;
    // ---------------------------------------------------------------------------------------
    frameRate(25);
    // window maximizing
    com.jogamp.newt.opengl.GLWindow window = (com.jogamp.newt.opengl.GLWindow)(surface.getNative());
    window.setResizable(true);
    window.setMaximized(true, true);
    win_width = window.getWidth();
    win_height = window.getHeight();
    // println(window.getWidth(), " ", window.getHeight());
    // VERY IMPORTANT: Allways initialize the library before using it
    RG.init(this);
    RG.ignoreStyles(true);
    
    RG.setPolygonizer(RG.ADAPTATIVE);
    // ---------------------------------------------------------------------------------------
    // tab height
    tab_height = 0.03f * win_height;
    a_tab_width = 0.1f * win_width;
    float t_x_w = 0.01f * win_width, t_x_h = 0.015f * win_height;
    for ( int i = 0; i < 10; ++i ) {
        tab_recs[i * 4] = i * a_tab_width;
        tab_recs[i * 4 + 1] = 0;
        tab_recs[i * 4 + 2] = (i + 1) * a_tab_width;
        tab_recs[i * 4 + 3] = tab_height;
        tab_x_recs[i * 4] = (i + 1) * a_tab_width - t_x_w;
        tab_x_recs[i * 4 + 1] = 0;
        tab_x_recs[i * 4 + 2] = (i + 1) * a_tab_width;
        tab_x_recs[i * 4 + 3] = t_x_h;
        tab_kozep_vonalak[i] = (i + 0.5) * a_tab_width;
        cop_tab_strings[i] = "Tab_" + String.valueOf(i + 1);
        tab_strings[i] = cop_tab_strings[i];
        isSzabad_tab_texts[i] = true;
    }
    add_tab_tx = a_tab_width; add_tab_ty = 0; add_tab_bx = add_tab_tx + 0.05 * win_width; add_tab_by = tab_height;
    tab_texts[0] = 0;
    isSzabad_tab_texts[0] = false;
    // ---------------------------------------------------------------------------------------  
    // map drawing
    map_scale = (1.5f * win_height / 1085.3909);
    eU_map = RG.loadShape("ori_Countries_of_Europe.svg");
    map_w = map_scale * 1085.3909; map_h = map_w * map_ratio;
    eU_map.transform(0, 0, map_w, map_h, false);
    // println(map_w, " ", map_h);
    // println(eU_map.getWidth(), " ", eU_map.getHeight());
    // float tmp_getx = -eU_map.getX() - (float)(200d / 1085.3909d) * map_w, tmp_gety = -eU_map.getY() - (float)(0d / 701.08234d) * map_h;
    map_eltolas = 2 * tab_height;
    float tmp_getx = -eU_map.getX() - eU_map.getChild("pt-0").getBoundsPoints()[0].x * map_scale + 4, tmp_gety = -eU_map.getY() - eU_map.getChild("no-6").paths[6].getBoundsPoints()[0].y * map_scale + 4 + map_eltolas;
    eU_map.translate( new RPoint(tmp_getx + 1, tmp_gety + 1) );
    draw_map_rect[1] = map_eltolas; draw_map_rect[2] = 0.523 * map_w; draw_map_rect[3] = map_eltolas + 0.844 * map_h;
    la1 = eU_map.children[0];
    // ---------------------------------------------------------------------------------------
    // city recs
    float ctmp = (draw_map_rect[2] - 0.2f * win_width) / 3;
    city_choose_recs[0] = 0;
    city_choose_recs[1] = tab_height;
    city_choose_recs[2] = ctmp;
    city_choose_recs[3] = map_eltolas;
    
    city_choose_recs[4] = city_choose_recs[2];
    city_choose_recs[5] = tab_height;
    city_choose_recs[6] = 2 * ctmp;
    city_choose_recs[7] = map_eltolas;
    
    city_choose_recs[8] = city_choose_recs[6];
    city_choose_recs[9] = tab_height;
    city_choose_recs[10] = 3 * ctmp;
    city_choose_recs[11] = map_eltolas;
    
    city_choose_recs[12] = city_choose_recs[10];
    city_choose_recs[13] = tab_height;
    city_choose_recs[14] = draw_map_rect[2];
    city_choose_recs[15] = map_eltolas;
    
    sugar2 = (0.012 * draw_map_rect[2]) * (0.012 * draw_map_rect[2]);
    rect_kiv_vastag = 0.036 * draw_map_rect[2];
    latlon_y = 1.5f * tab_height;
    latlon_f_szoveg_y = 2.6f * tab_height; latlon_a_szoveg_y = 2f * tab_height;
    lat_slider_start = city_choose_recs[10] + 0.025f * win_width; lat_slider_end = city_choose_recs[10] + 0.095f * win_width;
    lon_slider_start = city_choose_recs[10] + 0.12f * win_width; lon_slider_end = city_choose_recs[10] + 0.19f * win_width;
    lat_slider_hossz = lat_slider_end - lat_slider_start;
    lon_slider_hossz = lon_slider_end - lon_slider_start;
    csuszka_wid = 0.006 * win_width;
    // ---------------------------------------------------------------------------------------
    // megj varosok
    station1_rect_tx = draw_map_rect[2]; station1_rect_ty = tab_height;
    station1_rect_bx = 0.515f * win_width; station1_rect_by = 2 * tab_height;
    float rtmp = 0.025f * win_height;
    station2_rect_tx = draw_map_rect[2]; station2_rect_ty = 18 * rtmp + station1_rect_by + 0.01f * win_height;
    station2_rect_bx = 0.515f * win_width; station2_rect_by = station2_rect_ty + tab_height;
    float cotmp = 0.002f * win_height, tym = 0.003 * win_height;
    text_kiv_cities_x = station1_rect_tx + cotmp;
    for ( int i = 0; i < 18; ++i ) {
        int x = i * 4;
        rect_f_kiv_cities[x] = station1_rect_tx;
        rect_f_kiv_cities[x + 1] = i * rtmp + station1_rect_by;
        rect_f_kiv_cities[x + 2] = station1_rect_bx;
        rect_f_kiv_cities[x + 3] = (i + 1) * rtmp + station1_rect_by;
        rect_a_kiv_cities[x] = station2_rect_tx;
        rect_a_kiv_cities[x + 1] = i * rtmp + station2_rect_by;
        rect_a_kiv_cities[x + 2] = station2_rect_bx;
        rect_a_kiv_cities[x + 3] = (i + 1) * rtmp + station2_rect_by;

        text_f_kiv_cities_y[i] = (rect_f_kiv_cities[x + 1] + rect_f_kiv_cities[x + 3]) / 2 - tym;
        text_a_kiv_cities_y[i] = (rect_a_kiv_cities[x + 1] + rect_a_kiv_cities[x + 3]) / 2 - tym;
        
        kiv_f_cities_color_y[i] = rect_f_kiv_cities[x + 3] - cotmp;
        kiv_a_cities_color_y[i] = rect_a_kiv_cities[x + 3] - cotmp;
    }
    navbar_f_cont_tx = station1_rect_bx;                    navbar_f_cont_ty = station1_rect_by;
    navbar_f_cont_bx = navbar_f_cont_tx + 0.01 * win_width; navbar_f_cont_by = rect_f_kiv_cities[71];
    navbar_a_cont_tx = station2_rect_bx;                    navbar_a_cont_ty = station2_rect_by;
    navbar_a_cont_bx = navbar_a_cont_tx + 0.01 * win_width; navbar_a_cont_by = rect_a_kiv_cities[71];
    navlen = navbar_f_cont_by - navbar_f_cont_ty;
    // ---------------------------------------------------------------------------------------
    // foelem -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
    fo_ido_menu_x_both_k = navbar_f_cont_bx;
    fo_ido_menu_x_both_v = fo_ido_menu_x_both_k + 0.035f * win_width;
    fo_ido_menu_x_from = fo_ido_menu_x_both_v + 0.088f * win_width;
    fo_ido_menu_x_to = fo_ido_menu_x_from + 0.088f * win_width;
    fo_ido_menu_x_agg = fo_ido_menu_x_to + 0.088f * win_width;
    fo_ido_menu_x_al_k = fo_ido_menu_x_agg + 0.088f * win_width;
    fo_ido_menu_x_al_v = fo_ido_menu_x_al_k + 0.088f * win_width;
    fo_text_y1 = (station1_rect_ty + station1_rect_by) / 2;
    fo_text_y2 = (station2_rect_ty + station2_rect_by) / 2;
    fo_text_x1 = (fo_ido_menu_x_both_k + fo_ido_menu_x_both_v) / 2;
    fo_text_x2 = (fo_ido_menu_x_both_v + fo_ido_menu_x_from) / 2;
    fo_text_x3 = (fo_ido_menu_x_from + fo_ido_menu_x_to) / 2;
    fo_text_x4 = (fo_ido_menu_x_to + fo_ido_menu_x_agg) / 2;
    fo_text_x5 = (fo_ido_menu_x_agg + fo_ido_menu_x_al_k) / 2;
    fo_text_x6 = (fo_ido_menu_x_al_k + fo_ido_menu_x_al_v) / 2;
    
    lenyil_f_rect_by = station1_rect_by + 0.05 * win_height;
    lenyil_a_rect_by = station2_rect_by + 0.05 * win_height;
    
    fo_slider_line_k_x = navbar_f_cont_bx + 0.013f * win_width;
    fo_slider_line_v_x = fo_ido_menu_x_al_v - 0.013f * win_width;
    fo_slider_line_f_y = station1_rect_by + 0.02f * win_height;
    fo_slider_line_a_y = station2_rect_by + 0.02f * win_height;
    
    fo_f_slider_ty = station1_rect_by + 0.01f * win_height;
    fo_f_slider_by = station1_rect_by + 0.03f * win_height;
    fo_a_slider_ty = station2_rect_by + 0.01f * win_height;
    fo_a_slider_by = station2_rect_by + 0.03f * win_height;
    
    fo_f_line_szak_y_k = fo_slider_line_f_y - 0.01 * win_height;
    fo_f_line_szak_y_v = fo_slider_line_f_y + 0.01 * win_height;
    fo_a_line_szak_y_k = fo_slider_line_a_y - 0.01 * win_height;
    fo_a_line_szak_y_v = fo_slider_line_a_y + 0.01 * win_height;
    
    float kul = (fo_slider_line_v_x - fo_slider_line_k_x) / 47;
    for ( int i = 0; i < 48; ++i ) {
        fo_f_line_szak_xs[i] = fo_slider_line_k_x + i * kul;
    }
    fo_slider_texts[0] = String.valueOf(1973);
    for ( int i = 1; i < 23; ++i ) {
        fo_slider_texts[i] = String.valueOf((73 + i * 2) % 100);
    }
    fo_slider_texts[23] = String.valueOf(2020);
    fo_f_text_y = fo_slider_line_f_y + 0.015f * win_height;
    fo_a_text_y = fo_slider_line_a_y + 0.015f * win_height;
    fo_slider_start = navbar_f_cont_bx + 0.007 * win_width;
    fo_slider_end = fo_ido_menu_x_al_v - 0.007f * win_width;
    fo_slider_hossz = fo_slider_line_v_x - fo_slider_line_k_x;
    
    fo_agg_f_ty = station1_rect_by + 0.01 * win_height;
    fo_agg_f_by = station1_rect_by + 0.04 * win_height;
    fo_agg_a_ty = station2_rect_by + 0.01 * win_height;
    fo_agg_a_by = station2_rect_by + 0.04 * win_height;
    float tmpfxs = (fo_ido_menu_x_al_v - navbar_f_cont_bx) * 0.1;
    float fo_agg_koz = (fo_ido_menu_x_al_v - navbar_f_cont_bx) * 0.01;
    for ( int i = 0; i < 18; i += 2 ) {
        fo_agg_xs[i] = navbar_f_cont_bx + fo_agg_koz * (i / 2 + 1) + (i / 2) * tmpfxs;
        fo_agg_xs[i + 1] = fo_agg_xs[i] + tmpfxs;
        fo_agg_text_xs[i / 2] = (fo_agg_xs[i] + fo_agg_xs[i + 1]) / 2;
    }
    fo_f_agg_text_y = station1_rect_by + 0.025 * win_height;
    fo_a_agg_text_y = station2_rect_by + 0.025 * win_height;
    
    fo_f_al_month_ty = station1_rect_by + 0.002 * win_height;
    fo_f_al_month_by = station1_rect_by + 0.023 * win_height;
    fo_f_al_day_ty = station1_rect_by + 0.027 * win_height;
    fo_f_al_day_by = station1_rect_by + 0.048 * win_height;
    fo_a_al_month_ty = station2_rect_by + 0.002 * win_height;
    fo_a_al_month_by = station2_rect_by + 0.023 * win_height;
    fo_a_al_day_ty = station2_rect_by + 0.027 * win_height;
    fo_a_al_day_by = station2_rect_by + 0.048 * win_height;
    
    fo_al_text_x = navbar_f_cont_bx + 0.002 * win_width;
    fo_f_al_text_month_y = (fo_f_al_month_ty + fo_f_al_month_by) / 2;
    fo_f_al_text_day_y = (fo_f_al_day_ty + fo_f_al_day_by) / 2;
    fo_a_al_text_month_y = (fo_a_al_month_ty + fo_a_al_month_by) / 2;
    fo_a_al_text_day_y = (fo_a_al_day_ty + fo_a_al_day_by) / 2;
    
    float z = navbar_f_cont_bx + 0.035 * win_width, h = (fo_ido_menu_x_al_v - z - 0.005 * win_width) / 12;
    for ( int i = 0; i < 13; ++i ) {
        fo_al_month_xs[i] = z + i * h;
    }
    for ( int i = 0; i < 12; ++i ) {
        fo_al_month_text_xs[i] = (fo_al_month_xs[i] + fo_al_month_xs[i + 1]) / 2;
    }
    z = navbar_f_cont_bx + 0.02 * win_width; h = (fo_ido_menu_x_al_v - z - 0.0025 * win_width) / 31;
    for ( int i = 0; i < 32; ++i ) {
        fo_al_day_xs[i] = z + i * h;
    }
    for ( int i = 0; i < 31; ++i ) {
        fo_al_day_text_xs[i] = (fo_al_day_xs[i] + fo_al_day_xs[i + 1]) / 2;
    }
    // ---------------------------------------------------------------------------------------
    // fo attributumok
    fo_f_attr_by = station1_rect_by + 0.025 * win_height;
    fo_a_attr_by = station2_rect_by + 0.025 * win_height;
    fo_f_attr_text_y = (station1_rect_by + fo_f_attr_by) / 2 - 0.003 * win_height;
    fo_a_attr_text_y = (station2_rect_by + fo_a_attr_by) / 2 - 0.003 * win_height;
    float attr_len = (fo_ido_menu_x_al_v - navbar_f_cont_bx - 0.01 * win_width) / 13;
    float att_koz = 0.002 * win_width;
    fo_attr_xs[0] = navbar_f_cont_bx;
    fo_attr_xs[1] = fo_attr_xs[0] + attr_len;
    fo_attr_xs[2] = fo_attr_xs[1];
    fo_attr_xs[3] = fo_attr_xs[2] + attr_len;
    fo_attr_xs[4] = fo_attr_xs[3];
    fo_attr_xs[5] = fo_attr_xs[4] + attr_len;
    fo_attr_xs[6] = fo_attr_xs[5];
    fo_attr_xs[7] = fo_attr_xs[6] + attr_len;
    fo_attr_xs[8] = fo_attr_xs[7] + att_koz;
    fo_attr_xs[9] = fo_attr_xs[8] + attr_len;
    fo_attr_xs[10] = fo_attr_xs[9];
    fo_attr_xs[11] = fo_attr_xs[10] + attr_len;
    fo_attr_xs[12] = fo_attr_xs[11];
    fo_attr_xs[13] = fo_attr_xs[12] + attr_len;
    fo_attr_xs[14] = fo_attr_xs[13] + att_koz;
    fo_attr_xs[15] = fo_attr_xs[14] + attr_len;
    fo_attr_xs[16] = fo_attr_xs[15];
    fo_attr_xs[17] = fo_attr_xs[16] + attr_len;
    fo_attr_xs[18] = fo_attr_xs[17] + att_koz;
    fo_attr_xs[19] = fo_attr_xs[18] + attr_len;
    fo_attr_xs[20] = fo_attr_xs[19];
    fo_attr_xs[21] = fo_attr_xs[20] + attr_len;
    fo_attr_xs[22] = fo_attr_xs[21] + att_koz;
    fo_attr_xs[23] = fo_attr_xs[22] + attr_len;
    fo_attr_xs[24] = fo_attr_xs[23] + att_koz;
    fo_attr_xs[25] = fo_attr_xs[24] + attr_len;
    
    fo_attr_text_xs[0] = (fo_attr_xs[0] + fo_attr_xs[1]) / 2;
    fo_attr_text_xs[1] = (fo_attr_xs[2] + fo_attr_xs[3]) / 2;
    fo_attr_text_xs[2] = (fo_attr_xs[4] + fo_attr_xs[5]) / 2;
    fo_attr_text_xs[3] = (fo_attr_xs[6] + fo_attr_xs[7]) / 2;
    fo_attr_text_xs[4] = (fo_attr_xs[8] + fo_attr_xs[9]) / 2;
    fo_attr_text_xs[5] = (fo_attr_xs[10] + fo_attr_xs[11]) / 2;
    fo_attr_text_xs[6] = (fo_attr_xs[12] + fo_attr_xs[13]) / 2;
    fo_attr_text_xs[7] = (fo_attr_xs[14] + fo_attr_xs[15]) / 2;
    fo_attr_text_xs[8] = (fo_attr_xs[16] + fo_attr_xs[17]) / 2;
    fo_attr_text_xs[9] = (fo_attr_xs[18] + fo_attr_xs[19]) / 2;
    fo_attr_text_xs[10] = (fo_attr_xs[20] + fo_attr_xs[21]) / 2;
    fo_attr_text_xs[11] = (fo_attr_xs[22] + fo_attr_xs[23]) / 2;
    fo_attr_text_xs[12] = (fo_attr_xs[24] + fo_attr_xs[25]) / 2;
    // lehetosegek
    chart_munit_bx = navbar_f_cont_bx + 0.02 * win_width;
    chart_munit_text_x = (chart_munit_bx + navbar_f_cont_bx) / 2;
    fo_kisl_x1 = chart_munit_bx + 0.01 * win_width;
    fo_kisl_x2 = chart_munit_bx + 0.02 * win_width;
    fo_kisl_x3 = chart_munit_bx + 0.03 * win_width;
    fo_kisl_x4 = chart_munit_bx + 0.04 * win_width;
    fo_f_lehet_ty = fo_f_attr_by + 0.002 * win_height;
    fo_f_lehet_by = lenyil_f_rect_by - 0.002 * win_height;
    fo_f_lehet_text_y = (fo_f_lehet_ty + fo_f_lehet_by) / 2 - 0.003 * win_height;
    fo_a_lehet_ty = fo_a_attr_by + 0.002 * win_height;
    fo_a_lehet_by = lenyil_a_rect_by - 0.002 * win_height;
    fo_a_lehet_text_y = (fo_a_lehet_ty + fo_a_lehet_by) / 2 - 0.003 * win_height;
    float lehetlen = (fo_ido_menu_x_al_v - fo_kisl_x4 - 0.012 * win_width) / 5;
    float lehetkoz = 0.002 * win_width;
    for ( int i = 0; i < 10; i += 2 ) {
        fo_lehet_xs[i] = fo_kisl_x4 + (i / 2) * lehetlen + (i / 2 + 1) * lehetkoz;
        fo_lehet_xs[i + 1] = fo_lehet_xs[i] + lehetlen;
        fo_lehet_text_xs[i / 2] = (fo_lehet_xs[i] + fo_lehet_xs[i + 1]) / 2;
    }
    fo_kisl_text_x1 = (chart_munit_bx + fo_kisl_x1) / 2;
    fo_kisl_text_x2 = (fo_kisl_x1 + fo_kisl_x2) / 2;
    fo_kisl_text_x3 = (fo_kisl_x2 + fo_kisl_x3) / 2;
    fo_kisl_text_x4 = (fo_kisl_x3 + fo_kisl_x4) / 2;
    fo_f_muv_color_y = fo_f_lehet_by - 0.002 * win_height;
    fo_a_muv_color_y = fo_a_lehet_by - 0.002 * win_height;
    fo_f_attr_color_y = fo_f_attr_by - 0.002 * win_height;
    fo_a_attr_color_y = fo_a_attr_by - 0.002 * win_height;
    // mavi -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
    mavi_xv = draw_map_rect[2]; mavi_xko = mavi_xv / 2;
    mavi_y1 = draw_map_rect[3] + 2; mavi_y2 = mavi_y1 + (win_height - mavi_y1) / 3;
    mavi_y3 = mavi_y1 + 2 * (win_height - mavi_y1) / 3;
    float mavikoz = mavi_xv / 12;
    for ( int i = 0; i < 11; ++i ) {
        mavi_beoszt_xs[i] = (i + 1) * mavikoz;
    }
    mavi_beoszt_yt = mavi_y2 - 0.004 * win_height;
    mavi_beoszt_yb = mavi_y2 + 0.006 * win_height;
    mavi_text_y = (mavi_y3 + win_height) / 2;
    mavi_text_xm = mavi_xko / 2; mavi_text_xv = (mavi_xko + mavi_xv) / 2;
    mavi_draw_unit_w = (mavi_beoszt_xs[10] - mavi_beoszt_xs[0]) / 19f;
    mavi_murect_text_x = mavi_beoszt_xs[10] + 0.015 * win_width;
    mavi_murect_text_y = mavi_y1 + 0.025 * win_height;
    mavi_meas_unit_rect_tx = mavi_beoszt_xs[10] + 0.005 * win_width;
    mavi_meas_unit_rect_bx = mavi_meas_unit_rect_tx + 0.02 * win_width;
    mavi_meas_unit_rect_ty = mavi_y1 + 0.01 * win_height;
    mavi_meas_unit_rect_by = mavi_meas_unit_rect_ty + 0.03 * win_height;
    mavi_lab_rect_ty = mavi_beoszt_yb + 0.002 * win_height;
    mavi_lab_rect_by = mavi_y3 - 0.002 * win_height;
    mav_lab_text_y = mavi_lab_rect_ty + 0.007 * win_height;
    // ---------------------------------------------------------------------------------------
    // chart
    chart_f_y_axis_yt = fo_f_lehet_by + 0.015 * win_height;
    chart_f_y_axis_yb = navbar_f_cont_by - 0.042 * win_height;
    chart_f_x_beoszt_vy = chart_f_y_axis_yb + 0.004 * win_height;
    chart_f_x_labels_y = chart_f_y_axis_yb + 0.008 * win_height;
    
    chart_a_y_axis_yt = fo_a_lehet_by + 0.015 * win_height;
    chart_a_y_axis_yb = 0.958 * win_height;
    chart_a_x_beoszt_vy = chart_a_y_axis_yb + 0.004 * win_height;
    chart_a_x_labels_y = chart_a_y_axis_yb + 0.008 * win_height;
    
    chart_y_axis_x = navbar_f_cont_bx + 0.03 * win_width;
    chart_y_beoszt_kx = chart_y_axis_x - 0.004 * win_width;
    chart_y_labels_xr = chart_y_axis_x - 0.006 * win_width;
    chart_y_axis_len = chart_a_y_axis_yb - chart_a_y_axis_yt;
    chart_x_axis_xr = 0.985 * win_width;
    chart_x_axis_len = chart_x_axis_xr - chart_y_axis_x;
    
    float kd = chart_y_axis_len / 10f, kl = 0.002 * win_height;
    for ( int i = 0; i < 11; ++i ) {
        chart_f_y_beoszt_ys[i] = chart_f_y_axis_yb - i * kd;
        chart_a_y_beoszt_ys[i] = chart_a_y_axis_yb - i * kd;
        chart_f_y_labels_y[i] = chart_f_y_beoszt_ys[i] - kl;
        chart_a_y_labels_y[i] = chart_a_y_beoszt_ys[i] - kl;
    }
    for ( int i = 0; i < 48; ++i ) {
        year_strings[i] = String.valueOf(1973 + i);
        int ci = (73 + i) % 100;
        cutted_year_strings[i] = (ci < 10 ? "0" : "") + String.valueOf(ci) + ".";
        week_strings[i] = String.valueOf(i + 1) + ".";
    }
    for ( int i = 48; i < 52; ++i ) {
        week_strings[i] = String.valueOf(i + 1) + ".";
    }
    int norm_c = 0, day_c = 1, mo_c = 1;
    while ( mo_c != 3 ) {
        normal_year_days[norm_c] = "0" + String.valueOf(mo_c) + (day_c < 10 ? ".0" : ".") + String.valueOf(day_c) + ".";
        szoko_ev_days[norm_c] = normal_year_days[norm_c];
        ++day_c;
        ++norm_c;
        if ( day_c > days_of_months[mo_c - 1] ) {
            day_c = 1;
            ++mo_c;
        }
    }
    szoko_ev_days[norm_c] = "02.29.";
    int szoko_c = norm_c + 1;
    while ( mo_c != 13 ) {
        normal_year_days[norm_c] = (mo_c < 10 ? "0" : "") + String.valueOf(mo_c) + (day_c < 10 ? ".0" : ".") + String.valueOf(day_c) + ".";
        szoko_ev_days[szoko_c] = normal_year_days[norm_c];
        ++day_c;
        ++norm_c;
        ++szoko_c;
        if ( day_c > days_of_months[mo_c - 1] ) {
            day_c = 1;
            ++mo_c;
        }
    }
    
    float csskoz = (win_width - lehetkoz - (fo_lehet_xs[5] + lehetkoz)) / 12;
    for ( int i = 0; i < 13; ++i ) {
        chart_stack_jm_xs[i] = fo_lehet_xs[5] + lehetkoz + i * csskoz;
    }
    // ---------------------------------------------------------------------------------------
    lat_max = 0f; lat_min = 90f; lon_max = -20f; lon_min = 180f;
    for ( int i = 0; i < city_count; ++i ) {
        draw_x[i] = (x_ko[i] / 1085.3909) * map_w + 1;
        draw_y[i] = (y_ko[i] / 701.08234) * map_h + map_eltolas + 1;
        if ( lons[i] < lon_min ) {
            lon_min = lons[i];
        }
        if ( lons[i] > lon_max ) {
            lon_max = lons[i];
        }
        if ( lats[i] < lat_min ) {
            lat_min = lats[i];
        }
        if ( lats[i] > lat_max ) {
            lat_max = lats[i];
        }
    }
    lat_kul = lat_max - lat_min;
    lon_kul = lon_max - lon_min;
    // ---------------------------------------------------------------------------------------
    // int ujg = count - 1;
    // println(x_ko[ujg]);
    // println(y_ko[ujg]);
    // println(country_idx_of_cities[ujg]);
    // println(country_code_of_cities[ujg]);
    // println(lats[ujg]);
    // println(lons[ujg]);
    // println(local_start_dates[ujg]);
    // println(local_end_dates[ujg]);
    // println(telep_texts[ujg]);
    // ---------------------------------------------------------------------------------------
    // general modes
    // textSize(12);
    // textMode(SCREEN);
    // hint(ENABLE_NATIVE_FONTS);
    myFont = createFont("Arial", 13, false);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    rectMode(CORNERS);
    // ---------------------------------------------------------------------------------------
    // Ui_parameters
    ui_instances[0] = new Ui_parameters();
    current_instance = ui_instances[0];
    current_instance.rect_kiv_tx = 0.2 * win_width;
    current_instance.rect_kiv_ty = 0.45 * win_height;
    current_instance.rect_kiv_bx = 0.35 * win_width;
    current_instance.rect_kiv_by = 0.65 * win_height;
    current_instance.lat_1_tx = lat_slider_start;
    current_instance.lat_1_ty = 1.25 * tab_height;
    current_instance.lat_1_bx = lat_slider_start + csuszka_wid;
    current_instance.lat_1_by = 1.75 * tab_height;
    current_instance.lat_2_tx = lat_slider_end - csuszka_wid;
    current_instance.lat_2_ty = 1.25 * tab_height;
    current_instance.lat_2_bx = lat_slider_end;
    current_instance.lat_2_by = 1.75 * tab_height;
    current_instance.lon_1_tx = lon_slider_start;
    current_instance.lon_1_ty = 1.25 * tab_height;
    current_instance.lon_1_bx = lon_slider_start + csuszka_wid;
    current_instance.lon_1_by = 1.75 * tab_height;
    current_instance.lon_2_tx = lon_slider_end - csuszka_wid;
    current_instance.lon_2_ty = 1.25 * tab_height;
    current_instance.lon_2_bx = lon_slider_end;
    current_instance.lon_2_by = 1.75 * tab_height;
    current_instance.act_lat_k = lat_min;
    current_instance.act_lat_v = lat_max;
    current_instance.act_lon_k = lon_min;
    current_instance.act_lon_v = lon_max;

    current_instance.fo_f_slider_k_tx = fo_slider_start;
    current_instance.fo_f_slider_k_bx = current_instance.fo_f_slider_k_tx + csuszka_wid;
    current_instance.fo_f_slider_v_tx = fo_ido_menu_x_al_v - 0.013f * win_width;
    current_instance.fo_f_slider_v_bx = fo_slider_end;

    current_instance.fo_a_slider_k_tx = current_instance.fo_f_slider_k_tx;
    current_instance.fo_a_slider_k_bx = current_instance.fo_f_slider_k_bx;
    current_instance.fo_a_slider_v_tx = current_instance.fo_f_slider_v_tx;
    current_instance.fo_a_slider_v_bx = current_instance.fo_f_slider_v_bx;
    // ---------------------------------------------------------------------------------------
}


void draw() {
    if ( twice_run < 1 ) {
    // map kirajzolas
    if ( dr_map || dr_all ) {
        fill(bc_color);
        noStroke();
        rect(0f, tab_height, draw_map_rect[2], 2 * tab_height);
        fill(50, 50, 50);
        rect(0f, draw_map_rect[1], draw_map_rect[2], draw_map_rect[3]);
        if ( current_instance.fo_f_is_hm_ch ) {
            current_instance.fo_f_is_hm_ch = false;
            if ( current_instance.fo_f_is_hm && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 ) {
                current_instance.is_f_ut_heatmap = true;
                current_instance.is_heatmap_drawed = true;
                // draw heatmap
                Heatmap_f();
                dr_mavtext = true;
            }else {
                current_instance.is_heatmap_drawed = false;
            }
        }else if ( current_instance.fo_a_is_hm_ch ) {
            current_instance.fo_a_is_hm_ch = false;
            if ( current_instance.fo_a_is_hm && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 ) {
                current_instance.is_f_ut_heatmap = false;
                current_instance.is_heatmap_drawed = true;
                // draw heatmap
                Heatmap_a();
                dr_mavtext = true;
            }else {
                current_instance.is_heatmap_drawed = false;
            }
        }
        stroke(245, 245, 245);
        strokeWeight(1);
        noFill();

        for ( int i = 0; i < idx_teruletek.length; ++i ) {
            la1.children[idx_teruletek[i]].draw();
        }
        la1.children[62].children[0].children[0].draw();
        la1.children[62].children[0].children[1].draw();
        la1.children[62].children[1].draw();
        la1.children[66].children[1].draw();
        la1.children[66].children[2].draw();
        // ---------------------------------------------------------------------------------------
        // tavak kirajzolasa
        noStroke();
        RShape tmp_tavak = la1.children[68];
        for ( int i = 0; i < tavak_idx.length; ++i ) {
            tmp_tavak.paths[tavak_idx[i]].draw(g);
        }
        // ---------------------------------------------------------------------------------------
        // varosok kivalasztasa menu
        stroke(0);
        strokeWeight(1);
        // line(0, 2 * tab_height, 0.5f * win_width, 2 * tab_height);
        if ( current_instance.city_choosed == 0 ) {
            fill(bc_color);
        }else {
            fill(220f);
        }
        rect(city_choose_recs[0], city_choose_recs[1], city_choose_recs[2], city_choose_recs[3]);
        if ( current_instance.city_choosed == 1 ) {
            fill(bc_color);
        }else {
            fill(220f);
        }
        rect(city_choose_recs[4], city_choose_recs[5], city_choose_recs[6], city_choose_recs[7]);
        if ( current_instance.city_choosed == 2 ) {
            fill(bc_color);
        }else {
            fill(220f);
        }
        rect(city_choose_recs[8], city_choose_recs[9], city_choose_recs[10], city_choose_recs[11]);
        if ( current_instance.city_choosed == 3 ) {
            fill(bc_color);
        }else {
            fill(220f);
        }
        rect(city_choose_recs[12], city_choose_recs[13], city_choose_recs[14], city_choose_recs[15]);
        textSize(16);
        fill(0f);
        float xtmp = (city_choose_recs[1] + city_choose_recs[3]) / 2;
        text("by city", (city_choose_recs[0] + city_choose_recs[2]) / 2, xtmp);
        text("by country", (city_choose_recs[4] + city_choose_recs[6]) / 2, xtmp);
        text("rect", (city_choose_recs[8] + city_choose_recs[10]) / 2, xtmp);
        // text("lat / lon", (city_choose_recs[12] + city_choose_recs[14]) / 2, (city_choose_recs[13] + city_choose_recs[15]) / 2);
        text("lat:", city_choose_recs[10] + 0.015 * win_width, xtmp);
        text("lon:", city_choose_recs[10] + 0.11 * win_width, xtmp);
        strokeWeight(3);
        xtmp = 0.002 * win_width;
        line(lat_slider_start + xtmp, latlon_y, lat_slider_end - xtmp, latlon_y);
        line(lon_slider_start + xtmp, latlon_y, lon_slider_end - xtmp, latlon_y);
        strokeWeight(1);
        fill(0, 0, 120);
        rect(current_instance.lat_1_tx, current_instance.lat_1_ty, current_instance.lat_1_bx, current_instance.lat_1_by);
        rect(current_instance.lat_2_tx, current_instance.lat_2_ty, current_instance.lat_2_bx, current_instance.lat_2_by);
        rect(current_instance.lon_1_tx, current_instance.lon_1_ty, current_instance.lon_1_bx, current_instance.lon_1_by);
        rect(current_instance.lon_2_tx, current_instance.lon_2_ty, current_instance.lon_2_bx, current_instance.lon_2_by);
        if ( current_instance.city_choosed == 3 ) {
            fill(bc_color);
            noStroke();
            rect(current_instance.lat_1_tx - 0.01 * win_width, latlon_a_szoveg_y - 0.005 * win_height, current_instance.lat_1_bx + 0.01 * win_width, latlon_a_szoveg_y + 0.01 * win_height);
            rect(current_instance.lat_2_tx - 0.01 * win_width, latlon_f_szoveg_y - 0.005 * win_height, current_instance.lat_2_bx + 0.01 * win_width, latlon_f_szoveg_y + 0.01 * win_height);
            rect(current_instance.lon_1_tx - 0.01 * win_width, latlon_a_szoveg_y - 0.005 * win_height, current_instance.lon_1_bx + 0.01 * win_width, latlon_a_szoveg_y + 0.01 * win_height);
            rect(current_instance.lon_2_tx - 0.01 * win_width, latlon_f_szoveg_y - 0.005 * win_height, current_instance.lon_2_bx + 0.01 * win_width, latlon_f_szoveg_y + 0.01 * win_height);
            fill(0f);
            textSize(12);
            text(String.format("%.2f", current_instance.act_lat_k), (current_instance.lat_1_tx + current_instance.lat_1_bx) / 2, latlon_a_szoveg_y);
            text(String.format("%.2f", current_instance.act_lat_v), (current_instance.lat_2_tx + current_instance.lat_2_bx) / 2, latlon_f_szoveg_y);
            text(String.format("%.2f", current_instance.act_lon_k), (current_instance.lon_1_tx + current_instance.lon_1_bx) / 2, latlon_a_szoveg_y);
            text(String.format("%.2f", current_instance.act_lon_v), (current_instance.lon_2_tx + current_instance.lon_2_bx) / 2, latlon_f_szoveg_y);
        }
        
        // ---------------------------------------------------------------------------------------
        // ha rect kiv. akkor a rect kirajzolasa
        if ( current_instance.city_choosed == 2 ) {
            noFill();
            stroke(255, 255, 255);
            strokeWeight(3);
            rect(current_instance.rect_kiv_tx, current_instance.rect_kiv_ty, current_instance.rect_kiv_bx, current_instance.rect_kiv_by);
            rect(current_instance.rect_kiv_tx, current_instance.rect_kiv_ty, current_instance.rect_kiv_bx, current_instance.rect_kiv_ty + rect_kiv_vastag);
            rect(current_instance.rect_kiv_tx, current_instance.rect_kiv_ty, current_instance.rect_kiv_tx + rect_kiv_vastag, current_instance.rect_kiv_by);
            rect(current_instance.rect_kiv_tx, current_instance.rect_kiv_by - rect_kiv_vastag, current_instance.rect_kiv_bx, current_instance.rect_kiv_by);
            rect(current_instance.rect_kiv_bx - rect_kiv_vastag, current_instance.rect_kiv_ty, current_instance.rect_kiv_bx, current_instance.rect_kiv_by);
        }
        // ---------------------------------------------------------------------------------------
        // varos pontok kirajzolasa
        stroke(7, 208, 0);
        strokeWeight(10);
        // point(0.34641 * map_w, 0.55913 * map_h);
        for ( int i = 0; i < city_count; ++i ) {
            if ( !(current_instance.map_kiv_cities[i]) ) {
                point(draw_x[i], draw_y[i]);
            }
        }
        // fill(0);
        // for ( int i = 0; i < city_count; ++i ) {
        //     text(String.valueOf(i), draw_x[i], draw_y[i]);
        // }
        
        // kivalasztott varos pontok
        stroke(255, 145, 0);
        for ( int i = 0; i < city_count; ++i ) {
            if ( current_instance.map_kiv_cities[i] ) {
                point(draw_x[i], draw_y[i]);
            }
        }
        stroke(255f);
        strokeWeight(2);
        if ( current_instance.isFirst ) {
            for ( int i = 0; i < 7; ++i ) {
                if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                    int ktmp = i * 3;
                    fill(kiv_szinek[ktmp], kiv_szinek[ktmp + 1], kiv_szinek[ktmp + 2]);
                    circle(draw_x[current_instance.dia_f_kiv_cities_idx[i]], draw_y[current_instance.dia_f_kiv_cities_idx[i]], 10f);
                }
            }
        }else {
            for ( int i = 0; i < 7; ++i ) {
                if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                    int ktmp = i * 3;
                    fill(kiv_szinek[ktmp], kiv_szinek[ktmp + 1], kiv_szinek[ktmp + 2]);
                    circle(draw_x[current_instance.dia_a_kiv_cities_idx[i]], draw_y[current_instance.dia_a_kiv_cities_idx[i]], 10f);
                }
            }
        }
        // ---------------------------------------------------------------------------------------
        dr_map = false;
    }   
    // ---------------------------------------------------------------------------------------
    // megjelenitett kivalasztott varosok
    if ( dr_city_lists || dr_all ) {
        stroke(0);
        strokeWeight(1);
        fill(220f);
        // nagy rectek
        rect(station1_rect_tx, station1_rect_ty, rect_f_kiv_cities[70], rect_f_kiv_cities[71]);
        rect(station2_rect_tx, station2_rect_ty, rect_a_kiv_cities[70], rect_a_kiv_cities[71]);
        // stationok
        rect(station1_rect_tx, station1_rect_ty, station1_rect_bx, station1_rect_by);
        rect(station2_rect_tx, station2_rect_ty, station2_rect_bx, station2_rect_by);
        
        if ( current_instance.kiv_city_count <= 18 ) {
            fill(bc_color);
            current_instance.megj_f_start = 0;
            current_instance.megj_a_start = 0;
        }else {
            if ( current_instance.kiv_city_count - current_instance.megj_f_start < 18 ) {
                        current_instance.megj_f_start -= 18 - current_instance.kiv_city_count + current_instance.megj_f_start;
            }
            if ( current_instance.kiv_city_count - current_instance.megj_a_start < 18 ) {
                        current_instance.megj_a_start -= 18 - current_instance.kiv_city_count + current_instance.megj_a_start;
            }
            
        }
        rect(navbar_f_cont_tx, navbar_f_cont_ty, navbar_f_cont_bx, navbar_f_cont_by);
        rect(navbar_a_cont_tx, navbar_a_cont_ty, navbar_a_cont_bx, navbar_a_cont_by);
        if ( current_instance.kiv_city_count > 18 ) {
            fill(bc_color);
            rect(navbar_f_cont_tx, navbar_f_cont_ty + ((float)current_instance.megj_f_start / current_instance.kiv_city_count) * navlen, navbar_f_cont_bx, navbar_f_cont_by - ((float)(current_instance.kiv_city_count - 18 - current_instance.megj_f_start) / current_instance.kiv_city_count) * navlen);
            rect(navbar_a_cont_tx, navbar_a_cont_ty + ((float)current_instance.megj_a_start / current_instance.kiv_city_count) * navlen, navbar_a_cont_bx, navbar_a_cont_by - ((float)(current_instance.kiv_city_count - 18 - current_instance.megj_a_start) / current_instance.kiv_city_count) * navlen);
        }
        // items
        textSize(16);
        textAlign(LEFT, CENTER);
        int tmpcount = 0, listcount = 0, listcount2 = 0;
        for ( int i = 0; i < city_count; ++i ) {
            if ( current_instance.map_kiv_cities[i] ) {
                if ( listcount < 18 && tmpcount >= current_instance.megj_f_start ) {
                    current_instance.vis_f_kiv_idx[listcount] = i;
                    if ( current_instance.dia_f_allkiv_cities_idx[i] == -1 ) {
                        fill(bc_color);
                    }else {
                        fill(173, 252, 250);
                    }
                    rect(rect_f_kiv_cities[listcount * 4], rect_f_kiv_cities[listcount * 4 + 1], rect_f_kiv_cities[listcount * 4 + 2], rect_f_kiv_cities[listcount * 4 + 3]);
                    if ( current_instance.dia_f_allkiv_cities_idx[i] != -1 ) {
                        int ktmp = current_instance.dia_f_allkiv_cities_idx[i] * 3;
                        stroke(kiv_szinek[ktmp], kiv_szinek[ktmp + 1], kiv_szinek[ktmp + 2]);
                        strokeWeight(3);
                        line(station1_rect_tx, kiv_f_cities_color_y[listcount], station1_rect_bx, kiv_f_cities_color_y[listcount]);
                        strokeWeight(1);
                        stroke(0);
                    }
                    fill(0f);
                    text(telep_texts[i], text_kiv_cities_x, text_f_kiv_cities_y[listcount]);
                    ++listcount;
                }
                
                if ( listcount2 < 18 && tmpcount >= current_instance.megj_a_start ) {
                    current_instance.vis_a_kiv_idx[listcount2] = i;
                    if ( current_instance.dia_a_allkiv_cities_idx[i] == -1 ) {
                        fill(bc_color);
                    }else {
                        fill(173, 252, 250);
                    }
                    rect(rect_a_kiv_cities[listcount2 * 4], rect_a_kiv_cities[listcount2 * 4 + 1], rect_a_kiv_cities[listcount2 * 4 + 2], rect_a_kiv_cities[listcount2 * 4 + 3]);
                    if ( current_instance.dia_a_allkiv_cities_idx[i] != -1 ) {
                        int ktmp = current_instance.dia_a_allkiv_cities_idx[i] * 3;
                        stroke(kiv_szinek[ktmp], kiv_szinek[ktmp + 1], kiv_szinek[ktmp + 2]);
                        strokeWeight(3);
                        line(station1_rect_tx, kiv_a_cities_color_y[listcount2], station1_rect_bx, kiv_a_cities_color_y[listcount2]);
                        strokeWeight(1);
                        stroke(0);
                    }
                    fill(0f);
                    text(telep_texts[i], text_kiv_cities_x, text_a_kiv_cities_y[listcount2]);
                    ++listcount2;
                }
                
                if ( listcount == 18 && listcount2 == 18 ) {
                    break;
                }
                
                ++tmpcount;
                if ( tmpcount == current_instance.kiv_city_count ) {
                    break;
                }
            }
        }
        textAlign(CENTER, CENTER);
        // texts
        fill(0f);
        text(current_instance.text_f_allnone, (station1_rect_tx + station1_rect_bx) / 2, fo_text_y1);
        text(current_instance.text_a_allnone, (station2_rect_tx + station2_rect_bx) / 2, fo_text_y2);
        // for ( int i = 0; i < 7; ++i ) {
        //     if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
        //         println(telep_texts[current_instance.dia_f_kiv_cities_idx[i]]);
        //     }
        //     if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
        //         println(telep_texts[current_instance.dia_a_kiv_cities_idx[i]]);
        //     }
        // }

        dr_city_lists = false;
    }
    // ---------------------------------------------------------------------------------------
    // foelem 1
    if ( dr_fo_ter_f || dr_all ) {
        dr_fo_ter_f = false;
        stroke(0);
        strokeWeight(1);
        fill(220f);
        rect(fo_ido_menu_x_both_k, station1_rect_ty, fo_ido_menu_x_al_v, station1_rect_by);
        // lenyilo rect
        if ( current_instance.fo_f_ido_menu_kiv == -1 ) {
            fill(100f);
        }else {
            fill(bc_color);
        }
        rect(fo_ido_menu_x_both_k, station1_rect_by, fo_ido_menu_x_al_v, lenyil_f_rect_by);
        line(fo_ido_menu_x_both_v, station1_rect_ty, fo_ido_menu_x_both_v, station1_rect_by);
        if ( current_instance.fo_f_ido_menu_kiv == 2 ) {
            rect(fo_ido_menu_x_both_v, station1_rect_ty, fo_ido_menu_x_to, station1_rect_by);
        }else {
            line(fo_ido_menu_x_to, station1_rect_ty, fo_ido_menu_x_to, station1_rect_by);
        }
        if ( current_instance.fo_f_ido_menu_kiv == 3 ) {
            rect(fo_ido_menu_x_to, station1_rect_ty, fo_ido_menu_x_agg, station1_rect_by);
        }else {
            line(fo_ido_menu_x_agg, station1_rect_ty, fo_ido_menu_x_agg, station1_rect_by);
        }
        if ( current_instance.fo_f_agg_kiv == 0 ){
            if ( current_instance.fo_f_ido_menu_kiv == 4 ) {
                rect(fo_ido_menu_x_agg, station1_rect_ty, fo_ido_menu_x_al_k, station1_rect_by);
            }else {
                line(fo_ido_menu_x_al_k, station1_rect_ty, fo_ido_menu_x_al_k, station1_rect_by);
            }
            if ( current_instance.fo_f_ido_menu_kiv == 5 ) {
                rect(fo_ido_menu_x_al_k, station1_rect_ty, fo_ido_menu_x_al_v, station1_rect_by);
            }else {
                line(fo_ido_menu_x_al_v, station1_rect_ty, fo_ido_menu_x_al_v, station1_rect_by);
            }
        }
        fill(0);
        textSize(16);
        text(fo_text_both, fo_text_x1, fo_text_y1);
        text(current_instance.fo_f_text_from, fo_text_x2, fo_text_y1);
        text(current_instance.fo_f_text_to,   fo_text_x3, fo_text_y1);
        text(current_instance.fo_f_text_agg,  fo_text_x4, fo_text_y1);
        if ( current_instance.fo_f_agg_kiv == 0 ){
            text(current_instance.fo_f_text_al_k, fo_text_x5, fo_text_y1);
            text(current_instance.fo_f_text_al_v, fo_text_x6, fo_text_y1);
        }
        // lenyilo elem
        switch ( current_instance.fo_f_ido_menu_kiv ) {
            case -1:
                stroke(0);
                strokeWeight(1);
                fill(100f);
                rect(navbar_f_cont_bx, station1_rect_by, fo_ido_menu_x_al_v, fo_f_attr_by);
                for ( int i = 0; i < 26; i += 2 ) {
                    if ( current_instance.fo_f_is_attr[i / 2] ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_attr_xs[i], station1_rect_by, fo_attr_xs[i + 1], fo_f_attr_by);
                }
                fill(0);
                textSize(13);
                for ( int i = 0; i < 13; ++i ) {
                    text(fo_attr_texts[i], fo_attr_text_xs[i], fo_f_attr_text_y);
                }
                // szinezes
                if ( current_instance.fo_f_attr_kiv_count > 1 ) {
                    strokeWeight(3);
                    for ( int i = 0; i < 13; ++i ) {
                        if ( current_instance.fo_f_is_attr[i] ) {
                            int cc = i * 3;
                            stroke(fo_attr_colors[cc], fo_attr_colors[cc + 1], fo_attr_colors[cc + 2]);
                            line(fo_attr_xs[i * 2], fo_f_attr_color_y, fo_attr_xs[i * 2 + 1], fo_f_attr_color_y);
                        }
                    }
                }
                
                // lehetosegek
                if ( current_instance.fo_f_attr_kiv_count == 1 ) {
                    stroke(0);
                    strokeWeight(1);
                    fill(bc_color);
                    rect(navbar_f_cont_bx, fo_f_attr_by, chart_munit_bx, lenyil_f_rect_by);
                    if ( current_instance.dia_kiv_f_city_count == 1 && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 && (current_instance.fo_f_is_many_bal || current_instance.fo_f_is_many_jobb) ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(chart_munit_bx, fo_f_attr_by, fo_kisl_x1, lenyil_f_rect_by);
                    if ( current_instance.dia_kiv_f_city_count == 1 && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 && (current_instance.fo_f_is_inter_bal || current_instance.fo_f_is_inter_jobb) ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_kisl_x1, fo_f_attr_by, fo_kisl_x2, lenyil_f_rect_by);
                    if ( current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 && current_instance.fo_f_is_hm ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_kisl_x2, fo_f_attr_by, fo_kisl_x3, lenyil_f_rect_by);
                    if ( current_instance.dia_kiv_f_city_count == 1 && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 && current_instance.fo_f_is_dev ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_kisl_x3, fo_f_attr_by, fo_kisl_x4, lenyil_f_rect_by);
                    int k = current_instance.fo_lehet_f_am_lens[current_instance.fo_f_attr_min_idx] * 2;
                    for ( int i = 0; i < k; i += 2 ) {
                        if ( current_instance.fo_f_is_muv[i / 2] ) {
                            fill(bc_color);
                        }else {
                            fill(220f);
                        }
                        rect(fo_lehet_xs[i], fo_f_lehet_ty, fo_lehet_xs[i + 1], fo_f_lehet_by, 5);
                    }
                    fill(0);
                    textSize(14);
                    text(chart_units_per_group[current_instance.fo_f_group_num], chart_munit_text_x, fo_f_lehet_text_y);
                    k /= 2;
                    for ( int i = 0; i < k; ++i ) {
                        text(fo_lehet_nagy_strings[fo_lehet_attrs_muvs[current_instance.fo_f_attr_min_idx][i]], fo_lehet_text_xs[i], fo_f_lehet_text_y);
                    }
                    text(fo_kisl_m_text, fo_kisl_text_x1, fo_f_lehet_text_y);
                    text(fo_kisl_i_text, fo_kisl_text_x2, fo_f_lehet_text_y);
                    text(fo_kisl_h_text, fo_kisl_text_x3, fo_f_lehet_text_y);
                    text(fo_kisl_s_text, fo_kisl_text_x4, fo_f_lehet_text_y);
                    // szinezes
                    if ( current_instance.fo_f_muv_kiv_count > 1 ) {
                        strokeWeight(3);
                        for ( int i = 0; i < current_instance.fo_lehet_f_am_lens[current_instance.fo_f_attr_min_idx]; ++i ) {
                            if ( current_instance.fo_f_is_muv[i] ) {
                                int cc = fo_lehet_attrs_muvs[current_instance.fo_f_attr_min_idx][i] * 3;
                                stroke(fo_muv_colors[cc], fo_muv_colors[cc + 1], fo_muv_colors[cc + 2]);
                                line(fo_lehet_xs[i * 2], fo_f_muv_color_y, fo_lehet_xs[i * 2 + 1], fo_f_muv_color_y);
                            }
                        }
                    }
                }else if ( current_instance.fo_f_attr_kiv_count > 1 ) {
                    fill(0);
                    textSize(16);
                    text("Average", fo_lehet_text_xs[0], fo_f_lehet_text_y);
                }
                break;
            case 2:
                stroke(0);
                strokeWeight(3);
                line(fo_slider_line_k_x + 0.001f * win_width, fo_slider_line_f_y, fo_slider_line_v_x, fo_slider_line_f_y);
                strokeWeight(2);
                for ( int i = 0; i < 48; ++i ) {
                    line(fo_f_line_szak_xs[i], fo_f_line_szak_y_k, fo_f_line_szak_xs[i], fo_f_line_szak_y_v);
                }
                strokeWeight(1);
                fill(0, 0, 255);
                rect(current_instance.fo_f_slider_k_tx, fo_f_slider_ty, current_instance.fo_f_slider_k_bx, fo_f_slider_by);
                rect(current_instance.fo_f_slider_v_tx, fo_f_slider_ty, current_instance.fo_f_slider_v_bx, fo_f_slider_by);
                fill(0);
                textSize(14);
                for ( int i = 0; i < 23; ++i ) {
                    text(fo_slider_texts[i], fo_f_line_szak_xs[i * 2], fo_f_text_y);
                }
                text(fo_slider_texts[23], fo_f_line_szak_xs[47], fo_f_text_y);
                break;
            case 3:
                stroke(0);
                strokeWeight(1);
                fill(220f);
                for ( int i = 0; i < current_instance.fo_f_agg_count * 2; i += 2 ) {
                    rect(fo_agg_xs[i], fo_agg_f_ty, fo_agg_xs[i + 1], fo_agg_f_by);
                }
                fill(bc_color);
                rect(fo_agg_xs[current_instance.fo_f_agg_kiv * 2], fo_agg_f_ty, fo_agg_xs[current_instance.fo_f_agg_kiv * 2 + 1], fo_agg_f_by);
                fill(0);
                textSize(16);
                for ( int i = 0; i < current_instance.fo_f_agg_count; ++i ) {
                    text(fo_agg_texts[i], fo_agg_text_xs[i], fo_f_agg_text_y);
                }
                break;
            case 4:
                // nagy rectek
                noStroke();
                fill(bc_color);
                rect(fo_al_day_xs[0], fo_f_al_day_ty, fo_al_day_xs[31], fo_f_al_day_by);
                stroke(0);
                strokeWeight(1);
                fill(220f);
                rect(fo_al_month_xs[0], fo_f_al_month_ty, fo_al_month_xs[12], fo_f_al_month_by);
                rect(fo_al_day_xs[0], fo_f_al_day_ty, fo_al_day_xs[current_instance.eddig_f_k], fo_f_al_day_by);
                
                for ( int i = 1; i < 12; ++i ) {
                    line(fo_al_month_xs[i], fo_f_al_month_ty, fo_al_month_xs[i], fo_f_al_month_by);
                }
                for ( int i = 1; i < current_instance.eddig_f_k; ++i ) {
                    line(fo_al_day_xs[i], fo_f_al_day_ty, fo_al_day_xs[i], fo_f_al_day_by);
                }
                fill(bc_color);
                rect(fo_al_month_xs[current_instance.fo_f_al_k_month - 1], fo_f_al_month_ty, fo_al_month_xs[current_instance.fo_f_al_k_month], fo_f_al_month_by);
                rect(fo_al_day_xs[current_instance.fo_f_al_k_day - 1], fo_f_al_day_ty, fo_al_day_xs[current_instance.fo_f_al_k_day], fo_f_al_day_by);
                fill(0);
                textSize(16);
                textAlign(LEFT, CENTER);
                text(fo_al_text_month, fo_al_text_x, fo_f_al_text_month_y);
                text(fo_al_text_day, fo_al_text_x, fo_f_al_text_day_y);
                textAlign(CENTER, CENTER);
                textSize(14);
                for ( int i = 0; i < 12; ++i ) {
                    text(fo_al_month_texts[i], fo_al_month_text_xs[i], fo_f_al_text_month_y);
                }
                for ( int i = 0; i < current_instance.eddig_f_k; ++i ) {
                    text(fo_al_day_texts[i], fo_al_day_text_xs[i], fo_f_al_text_day_y);
                }
                break;
            case 5:
                // nagy rectek
                noStroke();
                fill(bc_color);
                rect(fo_al_day_xs[0], fo_f_al_day_ty, fo_al_day_xs[31], fo_f_al_day_by);
                stroke(0);
                strokeWeight(1);
                fill(220f);
                rect(fo_al_month_xs[0], fo_f_al_month_ty, fo_al_month_xs[12], fo_f_al_month_by);
                rect(fo_al_day_xs[0], fo_f_al_day_ty, fo_al_day_xs[current_instance.eddig_f_v], fo_f_al_day_by);
                
                for ( int i = 1; i < 12; ++i ) {
                    line(fo_al_month_xs[i], fo_f_al_month_ty, fo_al_month_xs[i], fo_f_al_month_by);
                }
                for ( int i = 1; i < current_instance.eddig_f_v; ++i ) {
                    line(fo_al_day_xs[i], fo_f_al_day_ty, fo_al_day_xs[i], fo_f_al_day_by);
                }
                fill(bc_color);
                rect(fo_al_month_xs[current_instance.fo_f_al_v_month - 1], fo_f_al_month_ty, fo_al_month_xs[current_instance.fo_f_al_v_month], fo_f_al_month_by);
                rect(fo_al_day_xs[current_instance.fo_f_al_v_day - 1], fo_f_al_day_ty, fo_al_day_xs[current_instance.fo_f_al_v_day], fo_f_al_day_by);
                fill(0);
                textSize(16);
                textAlign(LEFT, CENTER);
                text(fo_al_text_month, fo_al_text_x, fo_f_al_text_month_y);
                text(fo_al_text_day, fo_al_text_x, fo_f_al_text_day_y);
                textAlign(CENTER, CENTER);
                textSize(14);
                for ( int i = 0; i < 12; ++i ) {
                    text(fo_al_month_texts[i], fo_al_month_text_xs[i], fo_f_al_text_month_y);
                }
                for ( int i = 0; i < current_instance.eddig_f_v; ++i ) {
                    text(fo_al_day_texts[i], fo_al_day_text_xs[i], fo_f_al_text_day_y);
                }
        }
    }
    // ---------------------------------------------------------------------------------------
    // foelem 2
    if ( dr_fo_ter_a || dr_all ) {
        dr_fo_ter_a = false;
        stroke(0);
        strokeWeight(1);
        fill(220f);
        rect(fo_ido_menu_x_both_k, station2_rect_ty, fo_ido_menu_x_al_v, station2_rect_by);
        // lenyilo rect
        if ( current_instance.fo_a_ido_menu_kiv == -1 ) {
            fill(100f);
        }else {
            fill(bc_color);
        }
        rect(fo_ido_menu_x_both_k, station2_rect_by, fo_ido_menu_x_al_v, lenyil_a_rect_by);
        line(fo_ido_menu_x_both_v, station2_rect_ty, fo_ido_menu_x_both_v, station2_rect_by);
        if ( current_instance.fo_a_ido_menu_kiv == 2 ) {
            rect(fo_ido_menu_x_both_v, station2_rect_ty, fo_ido_menu_x_to, station2_rect_by);
        }else {
            line(fo_ido_menu_x_to, station2_rect_ty, fo_ido_menu_x_to, station2_rect_by);
        }
        if ( current_instance.fo_a_ido_menu_kiv == 3 ) {
            rect(fo_ido_menu_x_to, station2_rect_ty, fo_ido_menu_x_agg, station2_rect_by);
        }else {
            line(fo_ido_menu_x_agg, station2_rect_ty, fo_ido_menu_x_agg, station2_rect_by);
        }
        if ( current_instance.fo_a_agg_kiv == 0 ){
            if ( current_instance.fo_a_ido_menu_kiv == 4 ) {
                rect(fo_ido_menu_x_agg, station2_rect_ty, fo_ido_menu_x_al_k, station2_rect_by);
            }else {
                line(fo_ido_menu_x_al_k, station2_rect_ty, fo_ido_menu_x_al_k, station2_rect_by);
            }
            if ( current_instance.fo_a_ido_menu_kiv == 5 ) {
                rect(fo_ido_menu_x_al_k, station2_rect_ty, fo_ido_menu_x_al_v, station2_rect_by);
            }else {
                line(fo_ido_menu_x_al_v, station2_rect_ty, fo_ido_menu_x_al_v, station2_rect_by);
            }
        }
        fill(0);
        textSize(16);
        text(fo_text_both, fo_text_x1, fo_text_y2);
        text(current_instance.fo_a_text_from, fo_text_x2, fo_text_y2);
        text(current_instance.fo_a_text_to,   fo_text_x3, fo_text_y2);
        text(current_instance.fo_a_text_agg,  fo_text_x4, fo_text_y2);
        if ( current_instance.fo_a_agg_kiv == 0 ){
            text(current_instance.fo_a_text_al_k, fo_text_x5, fo_text_y2);
            text(current_instance.fo_a_text_al_v, fo_text_x6, fo_text_y2);
        }
        // lenyilo elem
        switch ( current_instance.fo_a_ido_menu_kiv ) {
            case -1:
                stroke(0);
                strokeWeight(1);
                fill(100f);
                rect(navbar_f_cont_bx, station2_rect_by, fo_ido_menu_x_al_v, fo_a_attr_by);
                fill(220f);
                for ( int i = 0; i < 26; i += 2 ) {
                    if ( current_instance.fo_a_is_attr[i / 2] ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_attr_xs[i], station2_rect_by, fo_attr_xs[i + 1], fo_a_attr_by);
                }
                fill(0);
                textSize(13);
                for ( int i = 0; i < 13; ++i ) {
                    text(fo_attr_texts[i], fo_attr_text_xs[i], fo_a_attr_text_y);
                }
                // szinezes
                if ( current_instance.fo_a_attr_kiv_count > 1 ) {
                    strokeWeight(3);
                    for ( int i = 0; i < 13; ++i ) {
                        if ( current_instance.fo_a_is_attr[i] ) {
                            int cc = i * 3;
                            stroke(fo_attr_colors[cc], fo_attr_colors[cc + 1], fo_attr_colors[cc + 2]);
                            line(fo_attr_xs[i * 2], fo_a_attr_color_y, fo_attr_xs[i * 2 + 1], fo_a_attr_color_y);
                        }
                    }
                }
                
                // lehetosegek
                if ( current_instance.fo_a_attr_kiv_count == 1 ) {
                    stroke(0);
                    strokeWeight(1);
                    fill(bc_color);
                    rect(navbar_f_cont_bx, fo_a_attr_by, chart_munit_bx, lenyil_a_rect_by);
                    if ( current_instance.dia_kiv_a_city_count == 1 && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 && (current_instance.fo_a_is_many_bal || current_instance.fo_a_is_many_jobb) ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(chart_munit_bx, fo_a_attr_by, fo_kisl_x1, lenyil_a_rect_by);
                    if ( current_instance.dia_kiv_a_city_count == 1 && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 && (current_instance.fo_a_is_inter_bal || current_instance.fo_a_is_inter_jobb) ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_kisl_x1, fo_a_attr_by, fo_kisl_x2, lenyil_a_rect_by);
                    if ( current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 && current_instance.fo_a_is_hm ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_kisl_x2, fo_a_attr_by, fo_kisl_x3, lenyil_a_rect_by);
                    if ( current_instance.dia_kiv_a_city_count == 1 && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 && current_instance.fo_a_is_dev ) {
                        fill(bc_color);
                    }else {
                        fill(220f);
                    }
                    rect(fo_kisl_x3, fo_a_attr_by, fo_kisl_x4, lenyil_a_rect_by);
                    int k = current_instance.fo_lehet_a_am_lens[current_instance.fo_a_attr_min_idx] * 2;
                    for ( int i = 0; i < k; i += 2 ) {
                        if ( current_instance.fo_a_is_muv[i / 2] ) {
                            fill(bc_color);
                        }else {
                            fill(220f);
                        }
                        rect(fo_lehet_xs[i], fo_a_lehet_ty, fo_lehet_xs[i + 1], fo_a_lehet_by, 5);
                    }
                    fill(0);
                    textSize(14);
                    text(chart_units_per_group[current_instance.fo_a_group_num], chart_munit_text_x, fo_a_lehet_text_y);
                    k /= 2;
                    for ( int i = 0; i < k; ++i ) {
                        text(fo_lehet_nagy_strings[fo_lehet_attrs_muvs[current_instance.fo_a_attr_min_idx][i]], fo_lehet_text_xs[i], fo_a_lehet_text_y);
                    }
                    text(fo_kisl_m_text, fo_kisl_text_x1, fo_a_lehet_text_y);
                    text(fo_kisl_i_text, fo_kisl_text_x2, fo_a_lehet_text_y);
                    text(fo_kisl_h_text, fo_kisl_text_x3, fo_a_lehet_text_y);
                    text(fo_kisl_s_text, fo_kisl_text_x4, fo_a_lehet_text_y);
                    // szinezes
                    if ( current_instance.fo_a_muv_kiv_count > 1 ) {
                        strokeWeight(3);
                        for ( int i = 0; i < current_instance.fo_lehet_a_am_lens[current_instance.fo_a_attr_min_idx]; ++i ) {
                            if ( current_instance.fo_a_is_muv[i] ) {
                                int cc = fo_lehet_attrs_muvs[current_instance.fo_a_attr_min_idx][i] * 3;
                                stroke(fo_muv_colors[cc], fo_muv_colors[cc + 1], fo_muv_colors[cc + 2]);
                                line(fo_lehet_xs[i * 2], fo_a_muv_color_y, fo_lehet_xs[i * 2 + 1], fo_a_muv_color_y);
                            }
                        }
                    }
                }else if ( current_instance.fo_a_attr_kiv_count > 1 ) {
                    fill(0);
                    textSize(16);
                    text("Average", fo_lehet_text_xs[0], fo_a_lehet_text_y);
                }
                break;
            case 2:
                stroke(0f);
                strokeWeight(3);
                line(fo_slider_line_k_x + 0.001f * win_width, fo_slider_line_a_y, fo_slider_line_v_x, fo_slider_line_a_y);
                strokeWeight(2);
                for ( int i = 0; i < 48; ++i ) {
                    line(fo_f_line_szak_xs[i], fo_a_line_szak_y_k, fo_f_line_szak_xs[i], fo_a_line_szak_y_v);
                }
                strokeWeight(1);
                fill(0, 0, 255);
                rect(current_instance.fo_a_slider_k_tx, fo_a_slider_ty, current_instance.fo_a_slider_k_bx, fo_a_slider_by);
                rect(current_instance.fo_a_slider_v_tx, fo_a_slider_ty, current_instance.fo_a_slider_v_bx, fo_a_slider_by);
                fill(0);
                textSize(14);
                for ( int i = 0; i < 23; ++i ) {
                    text(fo_slider_texts[i], fo_f_line_szak_xs[i * 2], fo_a_text_y);
                }
                text(fo_slider_texts[23], fo_f_line_szak_xs[47], fo_a_text_y);
                break;
            case 3:
                stroke(0);
                strokeWeight(1);
                fill(220f);
                for ( int i = 0; i < current_instance.fo_a_agg_count * 2; i += 2 ) {
                    rect(fo_agg_xs[i], fo_agg_a_ty, fo_agg_xs[i + 1], fo_agg_a_by);
                }
                fill(bc_color);
                rect(fo_agg_xs[current_instance.fo_a_agg_kiv * 2], fo_agg_a_ty, fo_agg_xs[current_instance.fo_a_agg_kiv * 2 + 1], fo_agg_a_by);
                fill(0);
                textSize(16);
                for ( int i = 0; i < current_instance.fo_a_agg_count; ++i ) {
                    text(fo_agg_texts[i], fo_agg_text_xs[i], fo_a_agg_text_y);
                }
                break;
            case 4:
                // nagy rectek
                noStroke();
                fill(bc_color);
                rect(fo_al_day_xs[0], fo_a_al_day_ty, fo_al_day_xs[31], fo_a_al_day_by);
                stroke(0);
                strokeWeight(1);
                fill(220f);
                rect(fo_al_month_xs[0], fo_a_al_month_ty, fo_al_month_xs[12], fo_a_al_month_by);
                rect(fo_al_day_xs[0], fo_a_al_day_ty, fo_al_day_xs[current_instance.eddig_a_k], fo_a_al_day_by);
                
                for ( int i = 1; i < 12; ++i ) {
                    line(fo_al_month_xs[i], fo_a_al_month_ty, fo_al_month_xs[i], fo_a_al_month_by);
                }
                for ( int i = 1; i < current_instance.eddig_a_k; ++i ) {
                    line(fo_al_day_xs[i], fo_a_al_day_ty, fo_al_day_xs[i], fo_a_al_day_by);
                }
                fill(bc_color);
                rect(fo_al_month_xs[current_instance.fo_a_al_k_month - 1], fo_a_al_month_ty, fo_al_month_xs[current_instance.fo_a_al_k_month], fo_a_al_month_by);
                rect(fo_al_day_xs[current_instance.fo_a_al_k_day - 1], fo_a_al_day_ty, fo_al_day_xs[current_instance.fo_a_al_k_day], fo_a_al_day_by);
                fill(0);
                textSize(16);
                textAlign(LEFT, CENTER);
                text(fo_al_text_month, fo_al_text_x, fo_a_al_text_month_y);
                text(fo_al_text_day, fo_al_text_x, fo_a_al_text_day_y);
                textAlign(CENTER, CENTER);
                textSize(14);
                for ( int i = 0; i < 12; ++i ) {
                    text(fo_al_month_texts[i], fo_al_month_text_xs[i], fo_a_al_text_month_y);
                }
                for ( int i = 0; i < current_instance.eddig_a_k; ++i ) {
                    text(fo_al_day_texts[i], fo_al_day_text_xs[i], fo_a_al_text_day_y);
                }
                break;
            case 5:
                // nagy rectek
                noStroke();
                fill(bc_color);
                rect(fo_al_day_xs[0], fo_a_al_day_ty, fo_al_day_xs[31], fo_a_al_day_by);
                stroke(0);
                strokeWeight(1);
                fill(220f);
                rect(fo_al_month_xs[0], fo_a_al_month_ty, fo_al_month_xs[12], fo_a_al_month_by);
                rect(fo_al_day_xs[0], fo_a_al_day_ty, fo_al_day_xs[current_instance.eddig_a_v], fo_a_al_day_by);
                
                for ( int i = 1; i < 12; ++i ) {
                    line(fo_al_month_xs[i], fo_a_al_month_ty, fo_al_month_xs[i], fo_a_al_month_by);
                }
                for ( int i = 1; i < current_instance.eddig_a_v; ++i ) {
                    line(fo_al_day_xs[i], fo_a_al_day_ty, fo_al_day_xs[i], fo_a_al_day_by);
                }
                fill(bc_color);
                rect(fo_al_month_xs[current_instance.fo_a_al_v_month - 1], fo_a_al_month_ty, fo_al_month_xs[current_instance.fo_a_al_v_month], fo_a_al_month_by);
                rect(fo_al_day_xs[current_instance.fo_a_al_v_day - 1], fo_a_al_day_ty, fo_al_day_xs[current_instance.fo_a_al_v_day], fo_a_al_day_by);
                fill(0);
                textSize(16);
                textAlign(LEFT, CENTER);
                text(fo_al_text_month, fo_al_text_x, fo_a_al_text_month_y);
                text(fo_al_text_day, fo_al_text_x, fo_a_al_text_day_y);
                textAlign(CENTER, CENTER);
                textSize(14);
                for ( int i = 0; i < 12; ++i ) {
                    text(fo_al_month_texts[i], fo_al_month_text_xs[i], fo_a_al_text_month_y);
                }
                for ( int i = 0; i < current_instance.eddig_a_v; ++i ) {
                    text(fo_al_day_texts[i], fo_al_day_text_xs[i], fo_a_al_text_day_y);
                }
        }
    }
    // ---------------------------------------------------------------------------------------
    // chart------------------------------------------------------------------------------
    if ( current_instance.fo_f_ido_menu_kiv == -1 && (current_instance.fo_f_exec || current_instance.is_f_calc_years || current_instance.is_f_agg_changed) ) {
        int tmp_s_year = current_instance.chart_f_start_year;
        int tmp_e_year = current_instance.chart_f_end_year;
        if ( current_instance.is_f_calc_years ) {
            current_instance.is_f_calc_years = false;
            current_instance.chart_f_start_year = 4000;
            current_instance.chart_f_end_year = 0;
            for ( int i = 0; i < 7; ++i ) {
                if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                    int ty = local_start_dates[current_instance.dia_f_kiv_cities_idx[i]].getYear();
                    if ( ty >= current_instance.fo_f_k_year && ty < current_instance.chart_f_start_year ) {
                        current_instance.chart_f_start_year = ty;
                    }
                    ty = local_end_dates[current_instance.dia_f_kiv_cities_idx[i]].getYear();
                    if ( ty <= current_instance.fo_f_v_year && ty > current_instance.chart_f_end_year ) {
                        current_instance.chart_f_end_year = ty;
                    }
                }
            }
            if ( current_instance.chart_f_start_year == 4000 ) {
                current_instance.chart_f_start_year = current_instance.fo_f_k_year;
            }
            if ( current_instance.chart_f_end_year == 0 ) {
                current_instance.chart_f_end_year = current_instance.fo_f_v_year;
            }
        }
        // ido beosztas beallitasa ha kell
        if ( tmp_s_year != current_instance.chart_f_start_year || tmp_e_year != current_instance.chart_f_end_year || current_instance.is_f_agg_changed ) {
            if ( current_instance.is_f_agg_changed ) {
                current_instance.is_f_agg_changed = false;
            }
            int beoszt_szama = 0, aggok_szama = 0;
            float beoszt_koz = 0f;
            switch ( current_instance.fo_f_agg_kiv ) {
                case 0:
                    aggok_szama = current_instance.chart_f_end_year - current_instance.chart_f_start_year + 1;
                    break;
                case 1:
                    aggok_szama = (current_instance.chart_f_end_year - current_instance.chart_f_start_year) * 4 + 3;
                    break;
                case 2:
                    aggok_szama = (current_instance.chart_f_end_year - current_instance.chart_f_start_year + 1) * 2;
                    break;
                case 3:
                    aggok_szama = (current_instance.chart_f_end_year - current_instance.chart_f_start_year + 1) * 3;
                    break;
                case 4:
                    aggok_szama = (current_instance.chart_f_end_year - current_instance.chart_f_start_year + 1) * 6;
                    break;
                case 5:
                    aggok_szama = (current_instance.chart_f_end_year - current_instance.chart_f_start_year + 1) * 12;
                    break;
                case 6:
                    aggok_szama = (current_instance.chart_f_end_year - current_instance.chart_f_start_year + 1) * 26;
                    break;
                case 7:
                    aggok_szama = (current_instance.chart_f_end_year - current_instance.chart_f_start_year + 1) * 52;
                    break;
                case 8:
                    aggok_szama = (current_instance.chart_f_end_year % 4 == 0 ? 366 : 365);
            }
            current_instance.kir_f_agg_count = aggok_szama;
            int aggok_szama_min1 = aggok_szama - 1, kk = 1;
            if ( aggok_szama_min1 <= chart_max_beoszt ) {
                beoszt_szama = aggok_szama;
                if ( aggok_szama_min1 == 0 ) {
                    beoszt_koz = 1;
                }else {
                    beoszt_koz = chart_x_axis_len / aggok_szama_min1;
                }
            }else {
                kk = aggok_szama_min1 / chart_max_beoszt;
                if ( aggok_szama_min1 % chart_max_beoszt != 0 ) {
                    ++kk;
                }
                beoszt_szama = aggok_szama_min1 / kk;
                beoszt_koz = chart_x_axis_len * ((float)(beoszt_szama * kk) / aggok_szama_min1) / beoszt_szama;
                ++beoszt_szama;
            }
            String[] zs;
            int kul = current_instance.chart_f_start_year - 1973;
            switch ( current_instance.fo_f_agg_kiv ) {
                case 0:
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = year_strings[kul + i * kk];
                    }
                    break;
                case 1:
                    String[] evszakok = { "sp.", "su.", "au.", "wi." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = cutted_year_strings[kul + (i * kk + 1) / 4] + evszakok[(i * kk) % 4];
                    }
                    break;
                case 2:
                    zs = new String[] { "1.", "2." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = cutted_year_strings[kul + (i * kk) / 2] + zs[(i * kk) % 2];
                    }
                    break;
                case 3:
                    zs = new String[] { "1.", "2.", "3." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = cutted_year_strings[kul + (i * kk) / 3] + zs[(i * kk) % 3];
                    }
                    break;
                case 4:
                    zs = new String[] { "1.", "2.", "3.", "4.", "5.", "6." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = cutted_year_strings[kul + (i * kk) / 6] + zs[(i * kk) % 6];
                    }
                    break;
                case 5:
                    zs = new String[] { "01.", "02.", "03.", "04.", "05.", "06.", "07.", "08.", "09.", "10.", "11.", "12." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = cutted_year_strings[kul + (i * kk) / 12] + zs[(i * kk) % 12];
                    }
                    break;
                case 6:
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = cutted_year_strings[kul + (i * kk) / 26] + week_strings[(i * kk) % 26];
                    }
                    break;
                case 7:
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = cutted_year_strings[kul + (i * kk) / 52] + week_strings[(i * kk) % 52];
                    }
                    break;
                case 8:
                    zs = (current_instance.chart_f_end_year % 4 == 0 ? szoko_ev_days : normal_year_days);
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_f_x_labels[i] = zs[i * kk];
                    }
            }
            for ( int i = 0; i < beoszt_szama; ++i ) {
                current_instance.chart_f_x_beoszt_xs[i] = chart_y_axis_x + i * beoszt_koz;
            }
            current_instance.chart_f_x_beoszt_szama = beoszt_szama;
            current_instance.fo_f_exec = true;
        }
        
        // az adatok kirajzolasa
        if ( current_instance.fo_f_exec ) {
            current_instance.fo_f_exec = false;
            // if chart
            if ( current_instance.dia_kiv_f_city_count > 0 && (current_instance.fo_f_attr_kiv_count > 1 || (current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count > 0)) ) {
                boolean is_alap_draw = true;
                if ( current_instance.dia_kiv_f_city_count > 1 && current_instance.dia_kiv_f_city_count - current_instance.kir_f_elozo_unicount == 1 ) {
                    is_alap_draw = false;
                }else if ( current_instance.fo_f_attr_kiv_count > 2 && current_instance.kir_f_elozo_type == 1 && current_instance.fo_f_attr_kiv_count - current_instance.kir_f_elozo_unicount == 1 ) {
                    is_alap_draw = false;
                }
                if ( is_alap_draw ) {
                    stroke(0);
                    strokeWeight(1);
                    fill(bc_color);
                    rect(navbar_f_cont_bx, fo_f_lehet_by, win_width, navbar_f_cont_by);
                    // chart vaz kirajzolasa idobeosztassal
                    if ( current_instance.fo_f_muv_min_idx != 4 ) {
                        stroke(200f);
                        strokeWeight(2);
                        for ( int i = 1; i < 11; ++i ) {
                            line(chart_y_axis_x, chart_f_y_beoszt_ys[i], chart_x_axis_xr, chart_f_y_beoszt_ys[i]);
                        }
                        for ( int i = 1; i < current_instance.chart_f_x_beoszt_szama; ++i ) {
                            line(current_instance.chart_f_x_beoszt_xs[i], chart_f_y_axis_yb, current_instance.chart_f_x_beoszt_xs[i], chart_f_y_axis_yt);
                        }
                    }
                    stroke(0);
                    strokeWeight(3);
                    line(chart_y_axis_x, chart_f_y_axis_yb, chart_y_axis_x, chart_f_y_axis_yt);
                    line(chart_y_axis_x, chart_f_y_axis_yb, chart_x_axis_xr, chart_f_y_axis_yb);
                    // beosztasok
                    for ( int i = 0; i < 11; ++i ) {
                        line(chart_y_beoszt_kx, chart_f_y_beoszt_ys[i], chart_y_axis_x, chart_f_y_beoszt_ys[i]);
                    }
                    for ( int i = 0; i < current_instance.chart_f_x_beoszt_szama; ++i ) {
                        line(current_instance.chart_f_x_beoszt_xs[i], chart_f_y_axis_yb, current_instance.chart_f_x_beoszt_xs[i], chart_f_x_beoszt_vy);
                    }
                    // texts
                    fill(0);
                    textSize(13);
                    textAlign(RIGHT, CENTER);
                    for ( int i = 0; i < 11; ++i ) {
                        text(current_instance.chart_f_y_labels[i], chart_y_labels_xr, chart_f_y_labels_y[i]);
                    }
                    textAlign(LEFT, CENTER);
                    for ( int i = 0; i < current_instance.chart_f_x_beoszt_szama; ++i ) {
                        pushMatrix();
                        translate(current_instance.chart_f_x_beoszt_xs[i], chart_f_x_labels_y);
                        rotate(piper4);
                        text(current_instance.chart_f_x_labels[i], 0, 0);
                        popMatrix();
                    }
                    textAlign(CENTER, CENTER);
                }
                if ( current_instance.dia_kiv_f_city_count > 1 ) {
                    current_instance.kir_f_elozo_unicount = current_instance.dia_kiv_f_city_count;
                    int tov = 0, curid = 0, tosz = 0;
                    if ( is_alap_draw ) {
                        tov = 7;
                    }else {
                        tov = 1;
                        curid = current_instance.dia_f_kiv_cities_idx[current_instance.dia_f_act_kiv_idx];
                        tosz = current_instance.dia_f_act_kiv_idx * 3;
                    }
                    for ( int i = 0; i < tov; ++i ) {
                        if ( is_alap_draw ) {
                            curid = current_instance.dia_f_kiv_cities_idx[i];
                            tosz = i * 3;
                        }
                        if ( curid != -1 ) {
                            Kir_chart_f(1, curid, kiv_szinek[tosz], kiv_szinek[tosz + 1], kiv_szinek[tosz + 2]);
                        }
                    }
                }else if ( current_instance.fo_f_attr_kiv_count > 1 ) {
                    current_instance.kir_f_elozo_type = 1;
                    current_instance.kir_f_elozo_unicount = current_instance.fo_f_attr_kiv_count;
                    int tov = 0;
                    if ( is_alap_draw ) {
                        tov = 13;
                    }else {
                        tov = 1;
                    }
                    int curid = current_instance.fo_f_attr_min_idx;
                    for ( int i = 0; i < tov; ++i ) {
                        if ( is_alap_draw ) {
                            if ( current_instance.fo_f_is_attr[i] ) {
                                curid = i;
                            }else {
                                curid = -1;
                            }
                        }
                        if ( curid != -1 ) {
                            int tosz = curid * 3;
                            Kir_chart_f(2, curid, fo_attr_colors[tosz], fo_attr_colors[tosz + 1], fo_attr_colors[tosz + 2]);
                        }
                    }
                }else if ( current_instance.fo_f_muv_kiv_count > 1 ) {
                    for ( int i = 0; i < 5; ++i ) {
                        if ( current_instance.fo_f_is_muv[i] ) {
                            int muvid = fo_lehet_attrs_muvs[current_instance.fo_f_attr_min_idx][i];
                            int cmuv = muvid * 3;
                            Kir_chart_f(3, muvid, fo_muv_colors[cmuv], fo_muv_colors[cmuv + 1], fo_muv_colors[cmuv + 2]);
                        }
                    }
                }else {
                    current_instance.kir_f_elozo_unicount = 1;
                    // println("jelen");
                    int jj = 0;
                    for ( int i = 0; i < 7; ++i ) {
                        if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                            jj = i * 3;
                            break;
                        }
                    }
                    Kir_chart_f(0, 0, kiv_szinek[jj], kiv_szinek[jj + 1], kiv_szinek[jj + 2]);
                }
            }
            // if no chart
            else {
                stroke(0);
                strokeWeight(1);
                fill(bc_color);
                rect(navbar_f_cont_bx, fo_f_lehet_by, win_width, navbar_f_cont_by);
                current_instance.kir_f_elozo_type = -1;
                current_instance.kir_f_elozo_unicount = 0;
            }
            // if heatmap
            if ( current_instance.fo_f_is_hm && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 ) {
                current_instance.fo_f_is_hm_ch = true;
                dr_map = true;
            }
        }
    }
    // ---------------------------------------------------------------------------------------
    // chart------------------------------------------------------------------------------
    if ( current_instance.fo_a_ido_menu_kiv == -1 && (current_instance.fo_a_exec || current_instance.is_a_calc_years || current_instance.is_a_agg_changed) ) {
        int tmp_s_year = current_instance.chart_a_start_year;
        int tmp_e_year = current_instance.chart_a_end_year;
        if ( current_instance.is_a_calc_years ) {
            current_instance.is_a_calc_years = false;
            current_instance.chart_a_start_year = 4000;
            current_instance.chart_a_end_year = 0;
            for ( int i = 0; i < 7; ++i ) {
                if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                    int ty = local_start_dates[current_instance.dia_a_kiv_cities_idx[i]].getYear();
                    if ( ty >= current_instance.fo_a_k_year && ty < current_instance.chart_a_start_year ) {
                        current_instance.chart_a_start_year = ty;
                    }
                    ty = local_end_dates[current_instance.dia_a_kiv_cities_idx[i]].getYear();
                    if ( ty <= current_instance.fo_a_v_year && ty > current_instance.chart_a_end_year ) {
                        current_instance.chart_a_end_year = ty;
                    }
                }
            }
            if ( current_instance.chart_a_start_year == 4000 ) {
                current_instance.chart_a_start_year = current_instance.fo_a_k_year;
            }
            if ( current_instance.chart_a_end_year == 0 ) {
                current_instance.chart_a_end_year = current_instance.fo_a_v_year;
            }
        }
        // ido beosztas beallitasa ha kell
        if ( tmp_s_year != current_instance.chart_a_start_year || tmp_e_year != current_instance.chart_a_end_year || current_instance.is_a_agg_changed ) {
            if ( current_instance.is_a_agg_changed ) {
                current_instance.is_a_agg_changed = false;
            }
            int beoszt_szama = 0, aggok_szama = 0;
            float beoszt_koz = 0f;
            switch ( current_instance.fo_a_agg_kiv ) {
                case 0:
                    aggok_szama = current_instance.chart_a_end_year - current_instance.chart_a_start_year + 1;
                    break;
                case 1:
                    aggok_szama = (current_instance.chart_a_end_year - current_instance.chart_a_start_year) * 4 + 3;
                    break;
                case 2:
                    aggok_szama = (current_instance.chart_a_end_year - current_instance.chart_a_start_year + 1) * 2;
                    break;
                case 3:
                    aggok_szama = (current_instance.chart_a_end_year - current_instance.chart_a_start_year + 1) * 3;
                    break;
                case 4:
                    aggok_szama = (current_instance.chart_a_end_year - current_instance.chart_a_start_year + 1) * 6;
                    break;
                case 5:
                    aggok_szama = (current_instance.chart_a_end_year - current_instance.chart_a_start_year + 1) * 12;
                    break;
                case 6:
                    aggok_szama = (current_instance.chart_a_end_year - current_instance.chart_a_start_year + 1) * 26;
                    break;
                case 7:
                    aggok_szama = (current_instance.chart_a_end_year - current_instance.chart_a_start_year + 1) * 52;
                    break;
                case 8:
                    aggok_szama = (current_instance.chart_a_end_year % 4 == 0 ? 366 : 365);
            }
            current_instance.kir_a_agg_count = aggok_szama;
            int aggok_szama_min1 = aggok_szama - 1, kk = 1;
            if ( aggok_szama_min1 <= chart_max_beoszt ) {
                beoszt_szama = aggok_szama;
                if ( aggok_szama_min1 == 0 ) {
                    beoszt_koz = 1;
                }else {
                    beoszt_koz = chart_x_axis_len / aggok_szama_min1;
                }
            }else {
                kk = aggok_szama_min1 / chart_max_beoszt;
                if ( aggok_szama_min1 % chart_max_beoszt != 0 ) {
                    ++kk;
                }
                beoszt_szama = aggok_szama_min1 / kk;
                beoszt_koz = chart_x_axis_len * ((float)(beoszt_szama * kk) / aggok_szama_min1) / beoszt_szama;
                ++beoszt_szama;
            }
            String[] zs;
            int kul = current_instance.chart_a_start_year - 1973;
            switch ( current_instance.fo_a_agg_kiv ) {
                case 0:
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = year_strings[kul + i * kk];
                    }
                    break;
                case 1:
                    String[] evszakok = { "sp.", "su.", "au.", "wi." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = cutted_year_strings[kul + (i * kk + 1) / 4] + evszakok[(i * kk) % 4];
                    }
                    break;
                case 2:
                    zs = new String[] { "1.", "2." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = cutted_year_strings[kul + (i * kk) / 2] + zs[(i * kk) % 2];
                    }
                    break;
                case 3:
                    zs = new String[] { "1.", "2.", "3." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = cutted_year_strings[kul + (i * kk) / 3] + zs[(i * kk) % 3];
                    }
                    break;
                case 4:
                    zs = new String[] { "1.", "2.", "3.", "4.", "5.", "6." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = cutted_year_strings[kul + (i * kk) / 6] + zs[(i * kk) % 6];
                    }
                    break;
                case 5:
                    zs = new String[] { "01.", "02.", "03.", "04.", "05.", "06.", "07.", "08.", "09.", "10.", "11.", "12." };
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = cutted_year_strings[kul + (i * kk) / 12] + zs[(i * kk) % 12];
                    }
                    break;
                case 6:
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = cutted_year_strings[kul + (i * kk) / 26] + week_strings[(i * kk) % 26];
                    }
                    break;
                case 7:
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = cutted_year_strings[kul + (i * kk) / 52] + week_strings[(i * kk) % 52];
                    }
                    break;
                case 8:
                    zs = (current_instance.chart_a_end_year % 4 == 0 ? szoko_ev_days : normal_year_days);
                    for ( int i = 0; i < beoszt_szama; ++i ) {
                        current_instance.chart_a_x_labels[i] = zs[i * kk];
                    }
            }
            for ( int i = 0; i < beoszt_szama; ++i ) {
                current_instance.chart_a_x_beoszt_xs[i] = chart_y_axis_x + i * beoszt_koz;
            }
            current_instance.chart_a_x_beoszt_szama = beoszt_szama;
            current_instance.fo_a_exec = true;
        }
        
        // az adatok kirajzolasa
        if ( current_instance.fo_a_exec ) {
            current_instance.fo_a_exec = false;
            // if chart
            if ( current_instance.dia_kiv_a_city_count > 0 && (current_instance.fo_a_attr_kiv_count > 1 || (current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count > 0)) ) {
                boolean is_alap_draw = true;
                if ( current_instance.dia_kiv_a_city_count > 1 && current_instance.dia_kiv_a_city_count - current_instance.kir_a_elozo_unicount == 1 ) {
                    is_alap_draw = false;
                }else if ( current_instance.fo_a_attr_kiv_count > 2 && current_instance.kir_a_elozo_type == 1 && current_instance.fo_a_attr_kiv_count - current_instance.kir_a_elozo_unicount == 1 ) {
                    is_alap_draw = false;
                }
                if ( is_alap_draw ) {
                    stroke(0);
                    strokeWeight(1);
                    fill(bc_color);
                    rect(navbar_a_cont_bx, fo_a_lehet_by, win_width, navbar_a_cont_by);
                    // chart vaz kirajzolasa idobeosztassal
                    if ( current_instance.fo_a_muv_min_idx != 4 ) {
                        stroke(200f);
                        strokeWeight(2);
                        for ( int i = 1; i < 11; ++i ) {
                            line(chart_y_axis_x, chart_a_y_beoszt_ys[i], chart_x_axis_xr, chart_a_y_beoszt_ys[i]);
                        }
                        for ( int i = 1; i < current_instance.chart_a_x_beoszt_szama; ++i ) {
                            line(current_instance.chart_a_x_beoszt_xs[i], chart_a_y_axis_yb, current_instance.chart_a_x_beoszt_xs[i], chart_a_y_axis_yt);
                        }
                    }
                    stroke(0);
                    strokeWeight(3);
                    line(chart_y_axis_x, chart_a_y_axis_yb, chart_y_axis_x, chart_a_y_axis_yt);
                    line(chart_y_axis_x, chart_a_y_axis_yb, chart_x_axis_xr, chart_a_y_axis_yb);
                    // beosztasok
                    for ( int i = 0; i < 11; ++i ) {
                        line(chart_y_beoszt_kx, chart_a_y_beoszt_ys[i], chart_y_axis_x, chart_a_y_beoszt_ys[i]);
                    }
                    for ( int i = 0; i < current_instance.chart_a_x_beoszt_szama; ++i ) {
                        line(current_instance.chart_a_x_beoszt_xs[i], chart_a_y_axis_yb, current_instance.chart_a_x_beoszt_xs[i], chart_a_x_beoszt_vy);
                    }
                    // texts
                    fill(0);
                    textSize(13);
                    textAlign(RIGHT, CENTER);
                    for ( int i = 0; i < 11; ++i ) {
                        text(current_instance.chart_a_y_labels[i], chart_y_labels_xr, chart_a_y_labels_y[i]);
                    }
                    textAlign(LEFT, CENTER);
                    for ( int i = 0; i < current_instance.chart_a_x_beoszt_szama; ++i ) {
                        pushMatrix();
                        translate(current_instance.chart_a_x_beoszt_xs[i], chart_a_x_labels_y);
                        rotate(piper4);
                        text(current_instance.chart_a_x_labels[i], 0, 0);
                        popMatrix();
                    }
                    textAlign(CENTER, CENTER);
                }
                if ( current_instance.dia_kiv_a_city_count > 1 ) {
                    current_instance.kir_a_elozo_unicount = current_instance.dia_kiv_a_city_count;
                    int tov = 0, curid = 0, tosz = 0;
                    if ( is_alap_draw ) {
                        tov = 7;
                    }else {
                        tov = 1;
                        curid = current_instance.dia_a_kiv_cities_idx[current_instance.dia_a_act_kiv_idx];
                        tosz = current_instance.dia_a_act_kiv_idx * 3;
                    }
                    for ( int i = 0; i < tov; ++i ) {
                        if ( is_alap_draw ) {
                            curid = current_instance.dia_a_kiv_cities_idx[i];
                            tosz = i * 3;
                        }
                        if ( curid != -1 ) {
                            Kir_chart_a(1, curid, kiv_szinek[tosz], kiv_szinek[tosz + 1], kiv_szinek[tosz + 2]);
                        }
                    }
                }else if ( current_instance.fo_a_attr_kiv_count > 1 ) {
                    current_instance.kir_a_elozo_type = 1;
                    current_instance.kir_a_elozo_unicount = current_instance.fo_a_attr_kiv_count;
                    int tov = 0;
                    if ( is_alap_draw ) {
                        tov = 13;
                    }else {
                        tov = 1;
                    }
                    int curid = current_instance.fo_a_attr_min_idx;
                    for ( int i = 0; i < tov; ++i ) {
                        if ( is_alap_draw ) {
                            if ( current_instance.fo_a_is_attr[i] ) {
                                curid = i;
                            }else {
                                curid = -1;
                            }
                        }
                        if ( curid != -1 ) {
                            int tosz = curid * 3;
                            Kir_chart_a(2, curid, fo_attr_colors[tosz], fo_attr_colors[tosz + 1], fo_attr_colors[tosz + 2]);
                        }
                    }
                }else if ( current_instance.fo_a_muv_kiv_count > 1 ) {
                    for ( int i = 0; i < 5; ++i ) {
                        if ( current_instance.fo_a_is_muv[i] ) {
                            int muvid = fo_lehet_attrs_muvs[current_instance.fo_a_attr_min_idx][i];
                            int cmuv = muvid * 3;
                            Kir_chart_a(3, muvid, fo_muv_colors[cmuv], fo_muv_colors[cmuv + 1], fo_muv_colors[cmuv + 2]);
                        }
                    }
                }else {
                    current_instance.kir_a_elozo_unicount = 1;
                    // println("jelen");
                    int jj = 0;
                    for ( int i = 0; i < 7; ++i ) {
                        if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                            jj = i * 3;
                            break;
                        }
                    }
                    Kir_chart_a(0, 0, kiv_szinek[jj], kiv_szinek[jj + 1], kiv_szinek[jj + 2]);
                }
            }
            // if no chart
            else {
                stroke(0);
                strokeWeight(1);
                fill(bc_color);
                rect(navbar_a_cont_bx, fo_a_lehet_by, win_width, navbar_a_cont_by);
                current_instance.kir_a_elozo_type = -1;
                current_instance.kir_a_elozo_unicount = 0;
            }
            // if heatmap
            if ( current_instance.fo_a_is_hm && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 ) {
                current_instance.fo_a_is_hm_ch = true;
                dr_map = true;
            }
        }
    }
    // ---------------------------------------------------------------------------------------
    // tab kirajzolasa
    if ( dr_tab || dr_all ) {
        // teglalapok
        noStroke();
        fill(bc_color);
        rect(0, 0, win_width, tab_height);
        fill(220f);
        for ( int i = 0; i < tab_count; ++i ) {
            rect(i * a_tab_width, 0, (i + 1) * a_tab_width, tab_height);
        }
        fill(bc_color);
        rect(active_tab * a_tab_width, 0, (active_tab + 1) * a_tab_width, tab_height);
        // x-ek
        noFill();
        strokeWeight(1);
        stroke(0);
        for ( int i = 0; i < tab_count * 4; i += 4 ) {
            rect(tab_x_recs[i], tab_x_recs[i + 1], tab_x_recs[i + 2], tab_x_recs[i + 3]);
        }
        // also vonalak
        line(0, tab_height, win_width, tab_height);
        // stroke(bc_color);
        // line(active_tab * a_tab_width, tab_height, (active_tab + 1) * a_tab_width, tab_height);
        // teglalapok kozotti vonalak
        stroke(0);
        for ( int i = 1; i <= tab_count; ++i ) {
            line(i * a_tab_width, tab_height, i * a_tab_width, 0);
        }
        // teglalap szovegek
        fill(0f);
        textSize(16);
        for ( int i = 0; i < tab_count; ++i ) {
            text(tab_strings[tab_texts[i]], (tab_recs[i * 4] + tab_recs[i * 4 + 2]) / 2, (tab_recs[i * 4 + 1] + tab_recs[i * 4 + 3]) / 2);
        }
        textSize(10);
        for ( int i = 0; i < tab_count; ++i ) {
            text("X", (tab_x_recs[i * 4] + tab_x_recs[i * 4 + 2]) / 2, (tab_x_recs[i * 4 + 1] + tab_x_recs[i * 4 + 3]) / 2 - 2);
        }
        // add tab
        textSize(16);
        if ( tab_count != max_tabcount ) {
            line(add_tab_bx, 0, add_tab_bx, tab_height);
            text("+", (add_tab_tx + add_tab_bx) / 2, (add_tab_ty + add_tab_by) / 2 - 3);
        }
        dr_tab = false;
    }
    // ---------------------------------------------------------------------------------------
    // mavi
    if ( dr_mavi || dr_all ) {
        dr_mavi = false;
        noStroke();
        fill(220f);
        rect(0f, mavi_y1, mavi_xv, mavi_y3);
        strokeWeight(1);
        if ( current_instance.mavi_is_magma ) {
            for(int i = 0; i < 19; ++i){
                for(int j = 0; j < mavi_draw_unit_w; ++j){
                    stroke(lerpColor(magma[i], magma[i + 1], (float)j / mavi_draw_unit_w));
                    float kk = mavi_beoszt_xs[0] + i * mavi_draw_unit_w + j;
                    line(kk, mavi_y1, kk, mavi_y2);
                }
            }
        }else {
            for(int i = 0; i < 19; ++i){
                for(int j = 0; j < mavi_draw_unit_w; ++j){
                    stroke(lerpColor(viridis[i], viridis[i + 1], (float)j / mavi_draw_unit_w));
                    float kk = mavi_beoszt_xs[0] + i * mavi_draw_unit_w + j;
                    line(kk, mavi_y1, kk, mavi_y2);
                }
            }
        }
        stroke(0);
        strokeWeight(2);
        for ( int i = 0; i < 11; ++i ) {
            line(mavi_beoszt_xs[i], mavi_beoszt_yt, mavi_beoszt_xs[i], mavi_beoszt_yb);
        }
        strokeWeight(1);
        if ( current_instance.mavi_is_magma ) {
            fill(bc_color);
        }else {
            fill(220f);
        }
        rect(0, mavi_y3, mavi_xko, win_height);
        if ( current_instance.mavi_is_magma ) {
            fill(220f);
        }else {
            fill(bc_color);
        }
        rect(mavi_xko, mavi_y3, mavi_xv, win_height);
        fill(0);
        textSize(16);
        text("magma", mavi_text_xm, mavi_text_y);
        text("viridis", mavi_text_xv, mavi_text_y);
    }
    // ---------------------------------------------------------------------------------------
    // mavtext
    if ( dr_mavtext ) {
        dr_mavtext = false;
        noStroke();
        fill(220f);
        rect(mavi_meas_unit_rect_tx, mavi_meas_unit_rect_ty, mavi_meas_unit_rect_bx, mavi_meas_unit_rect_by);
        rect(0f, mavi_lab_rect_ty, mavi_xv, mavi_lab_rect_by);
        fill(0f);
        textSize(14);
        String[] mavs;
        if ( current_instance.is_f_ut_heatmap ) {
            mavs = current_instance.mav_f_labels;
        }else {
            mavs = current_instance.mav_a_labels;
        }
        for ( int i = 0; i < 11; ++i ) {
            text(mavs[i], mavi_beoszt_xs[i], mav_lab_text_y);
        }
        textSize(16);
        if ( current_instance.is_f_ut_heatmap ) {
            text(chart_units_per_group[current_instance.fo_f_group_num], mavi_murect_text_x, mavi_murect_text_y);
        }else {
            text(chart_units_per_group[current_instance.fo_a_group_num], mavi_murect_text_x, mavi_murect_text_y);
        }
    }
    // ---------------------------------------------------------------------------------------
    
    if ( is_kezdet ) {
        ++twice_run;
        if ( twice_run == 1 ) {
            is_kezdet = false;
            dr_all = false;
            twice_run = 0;
        }
    }else {
        dr_all = false;
    }
    }
}

float Dist(float x, float y, float mx, float my) {
    return (x - mx) * (x - mx) + (y - my) * (y - my);
}

void mousePressed() {
    // println(mouseX, " ", mouseY);
    // for ( int i = 0; i < city_count; ++i ) {
    //     if ( dist(draw_x[i], draw_y[i], mouseX, mouseY) < 16 ) {
    //         fill(0);
    //         text(String.valueOf(i), draw_x[i], draw_y[i]);
    //     }
    // }
    // tabok
    if ( mouseY <= tab_height ) {
        boolean jel = true;
        // active tab kijelolese illetve torlese
        for ( int i = 0; i < tab_count; ++i ) {
            // if ( mouseX >= tab_recs[i * 4] && mouseX <= tab_recs[i * 4 + 2] && mouseY >= tab_recs[i * 4 + 1] && mouseY <= tab_recs[i * 4 + 3] ) {
            if ( mouseX >= tab_recs[i * 4] && mouseX <= tab_recs[i * 4 + 2] ) {
                // ha toroljuk, ha nem, akkor kijeloljuk
                if ( mouseX >= tab_x_recs[i * 4] && mouseX <= tab_x_recs[i * 4 + 2] && mouseY >= tab_x_recs[i * 4 + 1] && mouseY <= tab_x_recs[i * 4 + 3] ) {
                    if ( i <= active_tab ) {
                        --active_tab;
                        if ( active_tab < 0 ) {
                            active_tab = 0;
                        }
                    }
                    --tab_count;
                    if ( tab_count == 0 ) {
                        tab_count = 1;
                    }else {
                        add_tab_tx -= a_tab_width; add_tab_bx -= a_tab_width;
                        tab_strings[tab_texts[i]] = cop_tab_strings[tab_texts[i]];
                        isSzabad_tab_texts[tab_texts[i]] = true;
                        ui_instances[tab_texts[i]] = null;
                        current_instance = ui_instances[tab_texts[i - 1]];
                        for ( int j = i + 1; j <= tab_count; ++j ) {
                            tab_texts[j - 1] = tab_texts[j];
                        }
                    }
                }else {
                    if ( mouseButton != RIGHT ) {
                        active_tab = i;
                        prev_mouseX = mouseX;
                        tab_dragged = i;
                        current_instance = ui_instances[tab_texts[i]];
                    }else {
                        ch_text_id = tab_texts[i];
                        tab_strings[ch_text_id] = "";
                        is_enter_name = true;
                    }
                }
                jel = false;
                dr_all = true;
                break;
            }
        }
        // tab hozzaadasa
        if ( jel ) {
            // if ( mouseX >= add_tab_tx && mouseX <= add_tab_bx && mouseY >= add_tab_ty && mouseY <= add_tab_by ) {
            if ( mouseX >= add_tab_tx && mouseX <= add_tab_bx ) {
                add_tab_tx += a_tab_width; add_tab_bx += a_tab_width;
                active_tab = tab_count;
                for ( int i = 0; i < 10; ++i ) {
                    if ( isSzabad_tab_texts[i] ) {
                        tab_texts[tab_count] = i;
                        isSzabad_tab_texts[i] = false;
                        ui_instances[i] = new Ui_parameters();
                        current_instance = ui_instances[i];
                        current_instance.rect_kiv_tx = 0.2 * win_width;
                        current_instance.rect_kiv_ty = 0.45 * win_height;
                        current_instance.rect_kiv_bx = 0.35 * win_width;
                        current_instance.rect_kiv_by = 0.65 * win_height;
                        current_instance.lat_1_tx = lat_slider_start;
                        current_instance.lat_1_ty = 1.25 * tab_height;
                        current_instance.lat_1_bx = lat_slider_start + csuszka_wid;
                        current_instance.lat_1_by = 1.75 * tab_height;
                        current_instance.lat_2_tx = lat_slider_end - csuszka_wid;
                        current_instance.lat_2_ty = 1.25 * tab_height;
                        current_instance.lat_2_bx = lat_slider_end;
                        current_instance.lat_2_by = 1.75 * tab_height;
                        current_instance.lon_1_tx = lon_slider_start;
                        current_instance.lon_1_ty = 1.25 * tab_height;
                        current_instance.lon_1_bx = lon_slider_start + csuszka_wid;
                        current_instance.lon_1_by = 1.75 * tab_height;
                        current_instance.lon_2_tx = lon_slider_end - csuszka_wid;
                        current_instance.lon_2_ty = 1.25 * tab_height;
                        current_instance.lon_2_bx = lon_slider_end;
                        current_instance.lon_2_by = 1.75 * tab_height;
                        current_instance.act_lat_k = lat_min;
                        current_instance.act_lat_v = lat_max;
                        current_instance.act_lon_k = lon_min;
                        current_instance.act_lon_v = lon_max;
                        
                        current_instance.fo_f_slider_k_tx = fo_slider_start;
                        current_instance.fo_f_slider_k_bx = current_instance.fo_f_slider_k_tx + csuszka_wid;
                        current_instance.fo_f_slider_v_tx = fo_ido_menu_x_al_v - 0.013f * win_width;
                        current_instance.fo_f_slider_v_bx = fo_slider_end;

                        current_instance.fo_a_slider_k_tx = current_instance.fo_f_slider_k_tx;
                        current_instance.fo_a_slider_k_bx = current_instance.fo_f_slider_k_bx;
                        current_instance.fo_a_slider_v_tx = current_instance.fo_f_slider_v_tx;
                        current_instance.fo_a_slider_v_bx = current_instance.fo_f_slider_v_bx;
                        break;
                    }
                }
                ++tab_count;
                dr_all = true;
            }
        }
    }
    // ---------------------------------------------------------------------------------------
    // telepules kivalaszto rectek
    // && mouseY >= city_choose_recs[1] && mouseY <= city_choose_recs[3]
    else if ( mouseY <= map_eltolas && mouseX <= draw_map_rect[2] ){
        if ( mouseX >= city_choose_recs[0] && mouseX <= city_choose_recs[2] ) {
            current_instance.city_choosed = 0;
            dr_map = true;
        }else if ( mouseX >= city_choose_recs[4] && mouseX <= city_choose_recs[6] ) {
            current_instance.city_choosed = 1;
            dr_map = true;
        }else if ( mouseX >= city_choose_recs[8] && mouseX <= city_choose_recs[10] ) {
            current_instance.city_choosed = 2;
            dr_map = true;
        }else if ( mouseX >= city_choose_recs[12] && mouseX <= city_choose_recs[14] ) {
            current_instance.city_choosed = 3;
            if ( mouseX >= current_instance.lat_1_tx && mouseX <= current_instance.lat_1_bx && mouseY >= current_instance.lat_1_ty && mouseY <= current_instance.lat_1_by ) {
                latlon_dragged = 0;
            }else if ( mouseX >= current_instance.lat_2_tx && mouseX <= current_instance.lat_2_bx && mouseY >= current_instance.lat_2_ty && mouseY <= current_instance.lat_2_by ) {
                latlon_dragged = 1;
            }else if ( mouseX >= current_instance.lon_1_tx && mouseX <= current_instance.lon_1_bx && mouseY >= current_instance.lon_1_ty && mouseY <= current_instance.lon_1_by ) {
                latlon_dragged = 2;
            }else if ( mouseX >= current_instance.lon_2_tx && mouseX <= current_instance.lon_2_bx && mouseY >= current_instance.lon_2_ty && mouseY <= current_instance.lon_2_by ) {
                latlon_dragged = 3;
            }
            prev_mouseX = mouseX;
            prev_mouseY = mouseY;
            dr_map = true;
        }
    }
    // ---------------------------------------------------------------------------------------
    // telepules valaszto from map
    else if ( mouseY <= draw_map_rect[3] && mouseX <= draw_map_rect[2] ) {
        if ( mouseButton == RIGHT ) {
            for ( int i = 0; i < city_count; ++i ) {
                current_instance.map_kiv_cities[i] = false;
                current_instance.dia_f_allkiv_cities_idx[i] = -1;
                current_instance.dia_a_allkiv_cities_idx[i] = -1;
            }
            current_instance.kiv_city_count = 0;
            current_instance.dia_kiv_f_city_count = 0;
            current_instance.dia_kiv_a_city_count = 0;
            for ( int i = 0; i < 7; ++i ) {
                current_instance.dia_f_kiv_cities_idx[i] = -1;
                current_instance.dia_a_kiv_cities_idx[i] = -1;
            }
            current_instance.text_f_allnone = text_select_7;
            current_instance.text_a_allnone = text_select_7;
            dr_map = true;
            dr_city_lists = true;
        }else{
        switch ( current_instance.city_choosed ) {
            // by city
            case 0:
                for ( int i = 0; i < city_count; ++i ) {
                    if ( In_distance(mouseX, mouseY, draw_x[i], draw_y[i]) <= sugar2 ) {
                        current_instance.map_kiv_cities[i] = !(current_instance.map_kiv_cities[i]);
                        if ( current_instance.map_kiv_cities[i] ) {
                            ++current_instance.kiv_city_count;
                        }else {
                            --current_instance.kiv_city_count;
                            if ( current_instance.dia_f_allkiv_cities_idx[i] != -1 ) {
                                current_instance.dia_f_allkiv_cities_idx[i] = -1;
                                --(current_instance.dia_kiv_f_city_count);
                                for ( int j = 0; j < 7; ++j ) {
                                    if ( current_instance.dia_f_kiv_cities_idx[j] == i ) {
                                        current_instance.dia_f_kiv_cities_idx[j] = -1;
                                        break;
                                    }
                                }
                            }
                            if ( current_instance.dia_a_allkiv_cities_idx[i] != -1 ) {
                                current_instance.dia_a_allkiv_cities_idx[i] = -1;
                                --(current_instance.dia_kiv_a_city_count);
                                for ( int j = 0; j < 7; ++j ) {
                                    if ( current_instance.dia_a_kiv_cities_idx[j] == i ) {
                                        current_instance.dia_a_kiv_cities_idx[j] = -1;
                                        break;
                                    }
                                }
                            }
                        }
                        break;
                    }
                }
                dr_map = true;
                dr_city_lists = true;
                break;
            // by country
            case 1:
                boolean jel = true;
                for ( int i = 0; i < idx_teruletek.length; ++i ) {
                    RShape x = la1.children[idx_teruletek[i]];
                    if ( x.contains(new RPoint(mouseX, mouseY)) ) {
                        // println(country_names[i]);
                        for ( int j = 0; j < city_count; ++j ) {
                            if ( i == country_idx_of_cities[j] ) {
                                current_instance.map_kiv_cities[j] = !(current_instance.map_kiv_cities[j]);
                                if ( current_instance.map_kiv_cities[j] ) {
                                    ++current_instance.kiv_city_count;
                                }else {
                                    --current_instance.kiv_city_count;
                                    if ( current_instance.dia_f_allkiv_cities_idx[j] != -1 ) {
                                        current_instance.dia_f_allkiv_cities_idx[j] = -1;
                                        --(current_instance.dia_kiv_f_city_count);
                                        for ( int k = 0; k < 7; ++k ) {
                                            if ( current_instance.dia_f_kiv_cities_idx[k] == j ) {
                                                current_instance.dia_f_kiv_cities_idx[k] = -1;
                                                break;
                                            }
                                        }
                                    }
                                    if ( current_instance.dia_a_allkiv_cities_idx[j] != -1 ) {
                                        current_instance.dia_a_allkiv_cities_idx[j] = -1;
                                        --(current_instance.dia_kiv_a_city_count);
                                        for ( int k = 0; k < 7; ++k ) {
                                            if ( current_instance.dia_a_kiv_cities_idx[k] == j ) {
                                                current_instance.dia_a_kiv_cities_idx[k] = -1;
                                                break;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        dr_map = true;
                        dr_city_lists = true;
                        jel = false;
                        break;
                    }
                }
                if ( jel ) {
                    RShape x = la1.children[62].children[0].children[0];
                    if ( x.contains(new RPoint(mouseX, mouseY)) ) {
                        // println(country_names[idx_teruletek.length]);
                        boolean jel2 = false;
                        for ( int j = 0; j < city_count; ++j ) {
                            if ( idx_teruletek.length == country_idx_of_cities[j] ) {
                                current_instance.map_kiv_cities[j] = !(current_instance.map_kiv_cities[j]);
                                if ( current_instance.map_kiv_cities[j] ) {
                                    ++current_instance.kiv_city_count;
                                }else {
                                    --current_instance.kiv_city_count;
                                    if ( current_instance.dia_f_allkiv_cities_idx[j] != -1 ) {
                                        current_instance.dia_f_allkiv_cities_idx[j] = -1;
                                        --(current_instance.dia_kiv_f_city_count);
                                        for ( int k = 0; k < 7; ++k ) {
                                            if ( current_instance.dia_f_kiv_cities_idx[k] == j ) {
                                                current_instance.dia_f_kiv_cities_idx[k] = -1;
                                                break;
                                            }
                                        }
                                    }
                                    if ( current_instance.dia_a_allkiv_cities_idx[j] != -1 ) {
                                        current_instance.dia_a_allkiv_cities_idx[j] = -1;
                                        --(current_instance.dia_kiv_a_city_count);
                                        for ( int k = 0; k < 7; ++k ) {
                                            if ( current_instance.dia_a_kiv_cities_idx[k] == j ) {
                                                current_instance.dia_a_kiv_cities_idx[k] = -1;
                                                break;
                                            }
                                        }
                                    }
                                }
                                jel2 = true;
                            }else if ( jel2 ) {
                                break;
                            }
                        }
                        dr_map = true;
                        dr_city_lists = true;
                        jel = false;
                    }
                    if ( jel ) {
                        x = la1.children[62].children[0].children[1];
                        if ( x.contains(new RPoint(mouseX, mouseY)) ) {
                            // println(country_names[idx_teruletek.length + 1]);
                            boolean jel2 = false;
                            for ( int j = 0; j < city_count; ++j ) {
                                if ( idx_teruletek.length + 1 == country_idx_of_cities[j] ) {
                                    current_instance.map_kiv_cities[j] = !(current_instance.map_kiv_cities[j]);
                                    if ( current_instance.map_kiv_cities[j] ) {
                                        ++current_instance.kiv_city_count;
                                    }else {
                                        --current_instance.kiv_city_count;
                                        if ( current_instance.dia_f_allkiv_cities_idx[j] != -1 ) {
                                            current_instance.dia_f_allkiv_cities_idx[j] = -1;
                                            --(current_instance.dia_kiv_f_city_count);
                                            for ( int k = 0; k < 7; ++k ) {
                                                if ( current_instance.dia_f_kiv_cities_idx[k] == j ) {
                                                    current_instance.dia_f_kiv_cities_idx[k] = -1;
                                                    break;
                                                }
                                            }
                                        }
                                        if ( current_instance.dia_a_allkiv_cities_idx[j] != -1 ) {
                                            current_instance.dia_a_allkiv_cities_idx[j] = -1;
                                            --(current_instance.dia_kiv_a_city_count);
                                            for ( int k = 0; k < 7; ++k ) {
                                                if ( current_instance.dia_a_kiv_cities_idx[k] == j ) {
                                                    current_instance.dia_a_kiv_cities_idx[k] = -1;
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                    jel2 = true;
                                }else if ( jel2 ) {
                                    break;
                                }
                            }
                            dr_map = true;
                            dr_city_lists = true;
                            jel = false;
                        }
                    }
                    if ( jel ) {
                        x = la1.children[62].children[1];
                        if ( x.contains(new RPoint(mouseX, mouseY)) ) {
                            // println(country_names[idx_teruletek.length + 2]);
                            boolean jel2 = false;
                            for ( int j = 0; j < city_count; ++j ) {
                                if ( idx_teruletek.length + 2 == country_idx_of_cities[j] ) {
                                    current_instance.map_kiv_cities[j] = !(current_instance.map_kiv_cities[j]);
                                    if ( current_instance.map_kiv_cities[j] ) {
                                        ++current_instance.kiv_city_count;
                                    }else {
                                        --current_instance.kiv_city_count;
                                        if ( current_instance.dia_f_allkiv_cities_idx[j] != -1 ) {
                                            current_instance.dia_f_allkiv_cities_idx[j] = -1;
                                            --(current_instance.dia_kiv_f_city_count);
                                            for ( int k = 0; k < 7; ++k ) {
                                                if ( current_instance.dia_f_kiv_cities_idx[k] == j ) {
                                                    current_instance.dia_f_kiv_cities_idx[k] = -1;
                                                    break;
                                                }
                                            }
                                        }
                                        if ( current_instance.dia_a_allkiv_cities_idx[j] != -1 ) {
                                            current_instance.dia_a_allkiv_cities_idx[j] = -1;
                                            --(current_instance.dia_kiv_a_city_count);
                                            for ( int k = 0; k < 7; ++k ) {
                                                if ( current_instance.dia_a_kiv_cities_idx[k] == j ) {
                                                    current_instance.dia_a_kiv_cities_idx[k] = -1;
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                    jel2 = true;
                                }else if ( jel2 ) {
                                    break;
                                }
                            }
                            dr_map = true;
                            dr_city_lists = true;
                            jel = false;
                        }
                    }
                    if ( jel ) {
                        x = la1.children[66].children[1];
                        if ( x.contains(new RPoint(mouseX, mouseY)) ) {
                            // println(country_names[idx_teruletek.length + 3]);
                            boolean jel2 = false;
                            for ( int j = 0; j < city_count; ++j ) {
                                if ( idx_teruletek.length + 3 == country_idx_of_cities[j] ) {
                                    current_instance.map_kiv_cities[j] = !(current_instance.map_kiv_cities[j]);
                                    if ( current_instance.map_kiv_cities[j] ) {
                                        ++current_instance.kiv_city_count;
                                    }else {
                                        --current_instance.kiv_city_count;
                                        if ( current_instance.dia_f_allkiv_cities_idx[j] != -1 ) {
                                            current_instance.dia_f_allkiv_cities_idx[j] = -1;
                                            --(current_instance.dia_kiv_f_city_count);
                                            for ( int k = 0; k < 7; ++k ) {
                                                if ( current_instance.dia_f_kiv_cities_idx[k] == j ) {
                                                    current_instance.dia_f_kiv_cities_idx[k] = -1;
                                                    break;
                                                }
                                            }
                                        }
                                        if ( current_instance.dia_a_allkiv_cities_idx[j] != -1 ) {
                                            current_instance.dia_a_allkiv_cities_idx[j] = -1;
                                            --(current_instance.dia_kiv_a_city_count);
                                            for ( int k = 0; k < 7; ++k ) {
                                                if ( current_instance.dia_a_kiv_cities_idx[k] == j ) {
                                                    current_instance.dia_a_kiv_cities_idx[k] = -1;
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                    jel2 = true;
                                }else if ( jel2 ) {
                                    break;
                                }
                            }
                            dr_map = true;
                            dr_city_lists = true;
                        }
                    }
                }
                break;
            // by rect
            case 2:
                if ( mouseY >= current_instance.rect_kiv_ty && mouseY <= current_instance.rect_kiv_ty + rect_kiv_vastag ) {
                    if ( mouseX >= current_instance.rect_kiv_tx && mouseX <= current_instance.rect_kiv_tx + rect_kiv_vastag ) {
                        rectkiv_dragged = 0;
                        prev_mouseX = mouseX;
                        prev_mouseY = mouseY;
                    }else if ( mouseX > current_instance.rect_kiv_tx + rect_kiv_vastag && mouseX < current_instance.rect_kiv_bx - rect_kiv_vastag ) {
                        rectkiv_dragged = 1;
                        prev_mouseY = mouseY;
                    }else if ( mouseX >= current_instance.rect_kiv_bx - rect_kiv_vastag && mouseX <= current_instance.rect_kiv_bx ) {
                        rectkiv_dragged = 2;
                        prev_mouseX = mouseX;
                        prev_mouseY = mouseY;
                    }
                }else if ( mouseY > current_instance.rect_kiv_ty + rect_kiv_vastag && mouseY < current_instance.rect_kiv_by - rect_kiv_vastag ) {
                    if ( mouseX >= current_instance.rect_kiv_tx && mouseX <= current_instance.rect_kiv_tx + rect_kiv_vastag ) {
                        rectkiv_dragged = 3;
                        prev_mouseX = mouseX;
                    }else if ( mouseX >= current_instance.rect_kiv_bx - rect_kiv_vastag && mouseX <= current_instance.rect_kiv_bx ) {
                        rectkiv_dragged = 4;
                        prev_mouseX = mouseX;
                    }
                }else if ( mouseY >= current_instance.rect_kiv_by - rect_kiv_vastag && mouseY <= current_instance.rect_kiv_by ) {
                    if ( mouseX >= current_instance.rect_kiv_tx && mouseX <= current_instance.rect_kiv_tx + rect_kiv_vastag ) {
                        rectkiv_dragged = 5;
                        prev_mouseX = mouseX;
                        prev_mouseY = mouseY;
                    }else if ( mouseX > current_instance.rect_kiv_tx + rect_kiv_vastag && mouseX < current_instance.rect_kiv_bx - rect_kiv_vastag ) {
                        rectkiv_dragged = 6;
                        prev_mouseY = mouseY;
                    }else if ( mouseX >= current_instance.rect_kiv_bx - rect_kiv_vastag && mouseX <= current_instance.rect_kiv_bx ) {
                        rectkiv_dragged = 7;
                        prev_mouseX = mouseX;
                        prev_mouseY = mouseY;
                    }
                }
                // break;
            // by lat / lon
            // case 3:
        }
        }
    }
    // ---------------------------------------------------------------------------------------
    // stations
    else if ( mouseX >= draw_map_rect[2] && mouseX <= navbar_f_cont_bx ) {
        int g = (current_instance.kiv_city_count < 18 ? current_instance.kiv_city_count : 18);
        if ( mouseY >= rect_f_kiv_cities[1] && mouseY <= rect_f_kiv_cities[71] ) {
            if ( mouseX <= rect_f_kiv_cities[2] ){
            for ( int i = 0; i < g; ++i ) {
                int z = i * 4;
                if ( mouseX >= rect_f_kiv_cities[z] && mouseX <= rect_f_kiv_cities[z + 2] && mouseY >= rect_f_kiv_cities[z + 1] && mouseY <= rect_f_kiv_cities[z + 3] ) {
                    if ( mouseButton == RIGHT ) {
                        if ( current_instance.dia_f_allkiv_cities_idx[current_instance.vis_f_kiv_idx[i]] == -1 ) {
                            if ( current_instance.dia_kiv_f_city_count < 7 ) {
                                int jtmp = 0;
                                for ( int j = 0; j <= current_instance.dia_kiv_f_city_count; ++j ) {
                                    if ( current_instance.dia_f_kiv_cities_idx[j] == -1 ) {
                                        current_instance.dia_f_kiv_cities_idx[j] = current_instance.vis_f_kiv_idx[i];
                                        jtmp = j;
                                        break;
                                    }
                                }
                                current_instance.dia_f_allkiv_cities_idx[current_instance.vis_f_kiv_idx[i]] = jtmp;
                                if ( current_instance.dia_kiv_f_city_count == 1 ) {
                                    if ( current_instance.fo_f_attr_kiv_count > 1 ) {
                                        for ( int q = 0; q < 9; ++q ) {
                                            if ( current_instance.fo_f_is_attr[q] ) {
                                                current_instance.fo_f_is_attr[q] = false;
                                            }
                                        }
                                        for ( int q = 0; q < 5; ++q ) {
                                            if ( current_instance.fo_f_is_muv[q] ) {
                                                current_instance.fo_f_is_muv[q] = false;
                                            }
                                        }
                                        current_instance.fo_f_attr_kiv_count = 0;
                                        current_instance.fo_f_muv_kiv_count = 0;
                                        current_instance.fo_f_is_ng_muv = false;
                                        dr_fo_ter_f = true;
                                    }else if ( current_instance.fo_f_muv_kiv_count > 1 || current_instance.fo_f_is_ng_muv ) {
                                        for ( int q = 0; q < 5; ++q ) {
                                            if ( current_instance.fo_f_is_muv[q] ) {
                                                current_instance.fo_f_is_muv[q] = false;
                                            }
                                        }
                                        current_instance.fo_f_muv_kiv_count = 0;
                                        current_instance.fo_f_is_ng_muv = false;
                                        dr_fo_ter_f = true;
                                    }
                                }
                                ++(current_instance.dia_kiv_f_city_count);
                                current_instance.dia_f_act_kiv_idx = jtmp;
                                current_instance.text_f_allnone = text_clear_selects;
                                current_instance.is_f_calc_years = true;
                                current_instance.fo_f_exec = true;
                            }
                        }else {
                            for ( int j = 0; j < 7; ++j ) {
                                if ( current_instance.dia_f_kiv_cities_idx[j] == current_instance.vis_f_kiv_idx[i] ) {
                                    current_instance.dia_f_kiv_cities_idx[j] = -1;
                                    break;
                                }
                            }
                            current_instance.dia_f_allkiv_cities_idx[current_instance.vis_f_kiv_idx[i]] = -1;
                            --(current_instance.dia_kiv_f_city_count);
                            if ( current_instance.dia_kiv_f_city_count == 0 ) {
                                current_instance.text_f_allnone = text_select_7;
                            }
                            current_instance.is_f_calc_years = true;
                            current_instance.fo_f_exec = true;
                        }
                    }else {
                        if ( current_instance.dia_f_allkiv_cities_idx[current_instance.vis_f_kiv_idx[i]] == -1 ) {
                            for ( int j = 0; j < 7; ++j ) {
                                if ( current_instance.dia_f_kiv_cities_idx[j] != -1 ) {
                                    current_instance.dia_f_allkiv_cities_idx[current_instance.dia_f_kiv_cities_idx[j]] = -1;
                                    current_instance.dia_f_kiv_cities_idx[j] = -1;
                                }
                            }
                            current_instance.dia_f_kiv_cities_idx[0] = current_instance.vis_f_kiv_idx[i];
                            current_instance.dia_f_allkiv_cities_idx[current_instance.vis_f_kiv_idx[i]] = 0;
                            current_instance.dia_kiv_f_city_count = 1;
                            current_instance.text_f_allnone = text_clear_selects;
                            current_instance.is_f_calc_years = true;
                            current_instance.fo_f_exec = true;
                        }
                    }
                    break;
                }
            }
            dr_city_lists = true;
            }
            current_instance.isFirst = true;
            dr_map = true;
        }else if ( mouseY >= rect_a_kiv_cities[1] && mouseY <= rect_a_kiv_cities[71] ) {
            if ( mouseX <= rect_a_kiv_cities[2] ){
            for ( int i = 0; i < g; ++i ) {
                int z = i * 4;
                if ( mouseX >= rect_a_kiv_cities[z] && mouseX <= rect_a_kiv_cities[z + 2] && mouseY >= rect_a_kiv_cities[z + 1] && mouseY <= rect_a_kiv_cities[z + 3] ) {
                    if ( mouseButton == RIGHT ) {
                        if ( current_instance.dia_a_allkiv_cities_idx[current_instance.vis_a_kiv_idx[i]] == -1 ) {
                            if ( current_instance.dia_kiv_a_city_count < 7 ) {
                                int jtmp = 0;
                                for ( int j = 0; j <= current_instance.dia_kiv_a_city_count; ++j ) {
                                    if ( current_instance.dia_a_kiv_cities_idx[j] == -1 ) {
                                        current_instance.dia_a_kiv_cities_idx[j] = current_instance.vis_a_kiv_idx[i];
                                        jtmp = j;
                                        break;
                                    }
                                }
                                current_instance.dia_a_allkiv_cities_idx[current_instance.vis_a_kiv_idx[i]] = jtmp;
                                if ( current_instance.dia_kiv_a_city_count == 1 ) {
                                    if ( current_instance.fo_a_attr_kiv_count > 1 ) {
                                        for ( int q = 0; q < 9; ++q ) {
                                            if ( current_instance.fo_a_is_attr[q] ) {
                                                current_instance.fo_a_is_attr[q] = false;
                                            }
                                        }
                                        for ( int q = 0; q < 5; ++q ) {
                                            if ( current_instance.fo_a_is_muv[q] ) {
                                                current_instance.fo_a_is_muv[q] = false;
                                            }
                                        }
                                        current_instance.fo_a_attr_kiv_count = 0;
                                        current_instance.fo_a_muv_kiv_count = 0;
                                        current_instance.fo_a_is_ng_muv = false;
                                        dr_fo_ter_a = true;
                                    }else if ( current_instance.fo_a_muv_kiv_count > 1 || current_instance.fo_a_is_ng_muv ) {
                                        for ( int q = 0; q < 5; ++q ) {
                                            if ( current_instance.fo_a_is_muv[q] ) {
                                                current_instance.fo_a_is_muv[q] = false;
                                            }
                                        }
                                        current_instance.fo_a_muv_kiv_count = 0;
                                        current_instance.fo_a_is_ng_muv = false;
                                        dr_fo_ter_a = true;
                                    }
                                }
                                ++(current_instance.dia_kiv_a_city_count);
                                current_instance.dia_a_act_kiv_idx = jtmp;
                                current_instance.text_a_allnone = text_clear_selects;
                                current_instance.is_a_calc_years = true;
                                current_instance.fo_a_exec = true;
                            }
                        }else {
                            for ( int j = 0; j < 7; ++j ) {
                                if ( current_instance.dia_a_kiv_cities_idx[j] == current_instance.vis_a_kiv_idx[i] ) {
                                    current_instance.dia_a_kiv_cities_idx[j] = -1;
                                    break;
                                }
                            }
                            current_instance.dia_a_allkiv_cities_idx[current_instance.vis_a_kiv_idx[i]] = -1;
                            --(current_instance.dia_kiv_a_city_count);
                            if ( current_instance.dia_kiv_a_city_count == 0 ) {
                                current_instance.text_a_allnone = text_select_7;
                            }
                            current_instance.is_a_calc_years = true;
                            current_instance.fo_a_exec = true;
                        }
                    }else {
                        if ( current_instance.dia_a_allkiv_cities_idx[current_instance.vis_a_kiv_idx[i]] == -1 ) {
                            for ( int j = 0; j < 7; ++j ) {
                                if ( current_instance.dia_a_kiv_cities_idx[j] != -1 ) {
                                    current_instance.dia_a_allkiv_cities_idx[current_instance.dia_a_kiv_cities_idx[j]] = -1;
                                    current_instance.dia_a_kiv_cities_idx[j] = -1;
                                }
                            }
                            current_instance.dia_a_kiv_cities_idx[0] = current_instance.vis_a_kiv_idx[i];
                            current_instance.dia_a_allkiv_cities_idx[current_instance.vis_a_kiv_idx[i]] = 0;
                            current_instance.dia_kiv_a_city_count = 1;
                            current_instance.text_a_allnone = text_clear_selects;
                            current_instance.is_a_calc_years = true;
                            current_instance.fo_a_exec = true;
                        }
                    }
                    break;
                }
            }
            dr_city_lists = true;
            }
            current_instance.isFirst = false;
            dr_map = true;
        }else if ( mouseX <= station1_rect_bx ) {
            if ( mouseY >= station1_rect_ty && mouseY <= station1_rect_by ) {
                if ( current_instance.kiv_city_count > 0 ) {
                    if ( current_instance.dia_kiv_f_city_count == 0 ) {
                        // for ( int i = 0; i < 7; ++i ) {
                        //     if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                        //         current_instance.dia_f_allkiv_cities_idx[current_instance.dia_f_kiv_cities_idx[i]] = -1;
                        //     }
                        // }
                        int kez = (g < 7 ? g : 7);
                        for ( int i = 0; i < kez; ++i ) {
                            current_instance.dia_f_kiv_cities_idx[i] = current_instance.vis_f_kiv_idx[i];
                            current_instance.dia_f_allkiv_cities_idx[current_instance.vis_f_kiv_idx[i]] = i;
                        }
                        for ( int i = kez; i < 7; ++i ) {
                            current_instance.dia_f_kiv_cities_idx[i] = -1;
                        }
                        current_instance.dia_kiv_f_city_count = kez;
                        if ( current_instance.dia_kiv_f_city_count > 1 ) {
                            if ( current_instance.fo_f_attr_kiv_count > 1 ) {
                                for ( int q = 0; q < 9; ++q ) {
                                    if ( current_instance.fo_f_is_attr[q] ) {
                                        current_instance.fo_f_is_attr[q] = false;
                                    }
                                }
                                for ( int q = 0; q < 5; ++q ) {
                                    if ( current_instance.fo_f_is_muv[q] ) {
                                        current_instance.fo_f_is_muv[q] = false;
                                    }
                                }
                                current_instance.fo_f_attr_kiv_count = 0;
                                current_instance.fo_f_muv_kiv_count = 0;
                                current_instance.fo_f_is_ng_muv = false;
                            }else if ( current_instance.fo_f_muv_kiv_count > 1 || current_instance.fo_f_is_ng_muv ) {
                                for ( int q = 0; q < 5; ++q ) {
                                    if ( current_instance.fo_f_is_muv[q] ) {
                                        current_instance.fo_f_is_muv[q] = false;
                                    }
                                }
                                current_instance.fo_f_muv_kiv_count = 0;
                                current_instance.fo_f_is_ng_muv = false;
                            }
                        }
                        current_instance.text_f_allnone = text_clear_selects;
                        dr_fo_ter_f = true;
                    }else {
                        for ( int i = 0; i < 7; ++i ) {
                            if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                                current_instance.dia_f_allkiv_cities_idx[current_instance.dia_f_kiv_cities_idx[i]] = -1;
                                current_instance.dia_f_kiv_cities_idx[i] = -1;
                            }
                        }
                        current_instance.dia_kiv_f_city_count = 0;
                        current_instance.text_f_allnone = text_select_7;
                    }
                    dr_city_lists = true;
                    dr_map = true;
                    current_instance.is_f_calc_years = true;
                    current_instance.fo_f_exec = true;
                }
                current_instance.isFirst = true;
            }else if ( mouseY >= station2_rect_ty && mouseY <= station2_rect_by ) {
                if ( current_instance.kiv_city_count > 0 ) {
                    if ( current_instance.dia_kiv_a_city_count == 0 ) {
                        // for ( int i = 0; i < 7; ++i ) {
                        //     if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                        //         current_instance.dia_a_allkiv_cities_idx[current_instance.dia_a_kiv_cities_idx[i]] = -1;
                        //     }
                        // }
                        int kez = (g < 7 ? g : 7);
                        for ( int i = 0; i < kez; ++i ) {
                            current_instance.dia_a_kiv_cities_idx[i] = current_instance.vis_a_kiv_idx[i];
                            current_instance.dia_a_allkiv_cities_idx[current_instance.vis_a_kiv_idx[i]] = i;
                        }
                        for ( int i = kez; i < 7; ++i ) {
                            current_instance.dia_a_kiv_cities_idx[i] = -1;
                        }
                        current_instance.dia_kiv_a_city_count = kez;
                        if ( current_instance.dia_kiv_a_city_count > 1 ) {
                            if ( current_instance.fo_a_attr_kiv_count > 1 ) {
                                for ( int q = 0; q < 9; ++q ) {
                                    if ( current_instance.fo_a_is_attr[q] ) {
                                        current_instance.fo_a_is_attr[q] = false;
                                    }
                                }
                                for ( int q = 0; q < 5; ++q ) {
                                    if ( current_instance.fo_a_is_muv[q] ) {
                                        current_instance.fo_a_is_muv[q] = false;
                                    }
                                }
                                current_instance.fo_a_attr_kiv_count = 0;
                                current_instance.fo_a_muv_kiv_count = 0;
                                current_instance.fo_a_is_ng_muv = false;
                            }else if ( current_instance.fo_a_muv_kiv_count > 1 || current_instance.fo_a_is_ng_muv ) {
                                for ( int q = 0; q < 5; ++q ) {
                                    if ( current_instance.fo_a_is_muv[q] ) {
                                        current_instance.fo_a_is_muv[q] = false;
                                    }
                                }
                                current_instance.fo_a_muv_kiv_count = 0;
                                current_instance.fo_a_is_ng_muv = false;
                            }
                        }
                        current_instance.text_a_allnone = text_clear_selects;
                        dr_fo_ter_a = true;
                    }else {
                        for ( int i = 0; i < 7; ++i ) {
                            if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                                current_instance.dia_a_allkiv_cities_idx[current_instance.dia_a_kiv_cities_idx[i]] = -1;
                                current_instance.dia_a_kiv_cities_idx[i] = -1;
                            }
                        }
                        current_instance.dia_kiv_a_city_count = 0;
                        current_instance.text_a_allnone = text_select_7;
                    }
                    dr_city_lists = true;
                    dr_map = true;
                    current_instance.is_a_calc_years = true;
                    current_instance.fo_a_exec = true;
                }
                current_instance.isFirst = false;
            }
        }
    }
    // ---------------------------------------------------------------------------------------
    // foelemek
    else if ( mouseX > navbar_f_cont_bx ) {
        if ( mouseY <= lenyil_f_rect_by ) {
            if ( mouseY <= station1_rect_by ) {
                if ( mouseX >= fo_ido_menu_x_both_k && mouseX <= fo_ido_menu_x_both_v ) {
                    current_instance.fo_a_k_year = current_instance.fo_f_k_year;
                    current_instance.fo_a_v_year = current_instance.fo_f_v_year;
                    current_instance.fo_a_agg_kiv = current_instance.fo_f_agg_kiv;
                    current_instance.fo_a_al_k_day = current_instance.fo_f_al_k_day;
                    current_instance.fo_a_al_k_month = current_instance.fo_f_al_k_month;
                    current_instance.fo_a_al_v_day = current_instance.fo_f_al_v_day;
                    current_instance.fo_a_al_v_month = current_instance.fo_f_al_v_month;
                    current_instance.eddig_a_k = current_instance.eddig_f_k;
                    current_instance.eddig_a_v = current_instance.eddig_f_v;
                    current_instance.fo_a_text_from = current_instance.fo_f_text_from;
                    current_instance.fo_a_text_to = current_instance.fo_f_text_to;
                    current_instance.fo_a_text_agg = current_instance.fo_f_text_agg;
                    current_instance.fo_a_text_al_k = current_instance.fo_f_text_al_k;
                    current_instance.fo_a_text_al_v = current_instance.fo_f_text_al_v;
                    current_instance.fo_a_slider_k_tx = current_instance.fo_f_slider_k_tx;
                    current_instance.fo_a_slider_k_bx = current_instance.fo_f_slider_k_bx;
                    current_instance.fo_a_slider_v_tx = current_instance.fo_f_slider_v_tx;
                    current_instance.fo_a_slider_v_bx = current_instance.fo_f_slider_v_bx;
                    current_instance.fo_a_agg_count = current_instance.fo_f_agg_count;
                    current_instance.fo_lehet_a_am_lens[7] = current_instance.fo_lehet_f_am_lens[7];
                    current_instance.fo_lehet_a_am_lens[8] = current_instance.fo_lehet_f_am_lens[8];
                    current_instance.fo_lehet_a_am_lens[12] = current_instance.fo_lehet_f_am_lens[12];
                    dr_fo_ter_a = true;
                }else if ( mouseX >= fo_ido_menu_x_both_v && mouseX <= fo_ido_menu_x_to ) {
                    if ( current_instance.fo_f_ido_menu_kiv != 2 ) {
                        current_instance.fo_f_ido_menu_kiv = 2;
                    }else {
                        current_instance.fo_f_ido_menu_kiv = -1;
                    }
                }else if ( mouseX >= fo_ido_menu_x_to && mouseX <= fo_ido_menu_x_agg ) {
                    if ( current_instance.fo_f_ido_menu_kiv != 3 ) {
                        current_instance.fo_f_ido_menu_kiv = 3;
                    }else {
                        current_instance.fo_f_ido_menu_kiv = -1;
                    }
                }else if ( mouseX >= fo_ido_menu_x_agg && mouseX <= fo_ido_menu_x_al_k ) {
                    if ( current_instance.fo_f_agg_kiv == 0 ){
                        if ( current_instance.fo_f_ido_menu_kiv != 4 ) {
                            current_instance.fo_f_ido_menu_kiv = 4;
                        }else {
                            current_instance.fo_f_ido_menu_kiv = -1;
                        }
                    }
                }else if ( mouseX >= fo_ido_menu_x_al_k && mouseX <= fo_ido_menu_x_al_v ) {
                    if ( current_instance.fo_f_agg_kiv == 0 ){
                        if ( current_instance.fo_f_ido_menu_kiv != 5 ) {
                            current_instance.fo_f_ido_menu_kiv = 5;
                        }else {
                            current_instance.fo_f_ido_menu_kiv = -1;
                        }
                    }
                }
                dr_fo_ter_f = true;
            }else {
                switch ( current_instance.fo_f_ido_menu_kiv ) {
                    case -1:
                        if ( mouseY <= fo_f_attr_by ) {
                            for ( int i = 0; i < 26; i += 2 ) {
                                if ( mouseX >= fo_attr_xs[i] && mouseX <= fo_attr_xs[i + 1] ) {
                                    if ( mouseButton == RIGHT ) {
                                        if ( !(current_instance.fo_f_is_attr[i / 2]) ) {
                                            if ( current_instance.dia_kiv_f_city_count < 2 || current_instance.fo_f_attr_kiv_count == 0 ) {
                                                if ( current_instance.fo_f_attr_kiv_count == 0 || fo_muv_groups[i / 2] == current_instance.fo_f_group_num ) {
                                                    current_instance.fo_f_is_attr[i / 2] = true;
                                                    ++current_instance.fo_f_attr_kiv_count;
                                                    if ( current_instance.fo_f_attr_kiv_count == 1 ) {
                                                        current_instance.fo_f_attr_min_idx = i / 2;
                                                        for ( int j = 0; j < 5; ++j ) {
                                                            current_instance.fo_f_is_muv[j] = false;
                                                        }
                                                        current_instance.fo_f_muv_kiv_count = 0;
                                                    }
                                                    if ( current_instance.fo_f_attr_kiv_count == 1 ) {
                                                        current_instance.fo_f_group_num = fo_muv_groups[i / 2];
                                                    }
                                                    current_instance.fo_f_exec = true;
                                                }
                                            }
                                        }else {
                                            current_instance.fo_f_is_attr[i / 2] = false;
                                            --current_instance.fo_f_attr_kiv_count;
                                            if ( current_instance.fo_f_attr_kiv_count == 1 ) {
                                                for ( int j = 0; j < 13; ++j ) {
                                                    if ( current_instance.fo_f_is_attr[j] ) {
                                                        current_instance.fo_f_attr_min_idx = j;
                                                        break;
                                                    }
                                                }
                                                for ( int j = 0; j < 5; ++j ) {
                                                    current_instance.fo_f_is_muv[j] = false;
                                                }
                                                current_instance.fo_f_muv_kiv_count = 0;
                                            }
                                            current_instance.fo_f_exec = true;
                                        }
                                    }else {
                                        for ( int j = 0; j < 13; ++j ) {
                                            if ( current_instance.fo_f_is_attr[j] ) {
                                                current_instance.fo_f_is_attr[j] = false;
                                            }
                                        }
                                        for ( int j = 0; j < 5; ++j ) {
                                            if ( current_instance.fo_f_is_muv[j] ) {
                                                current_instance.fo_f_is_muv[j] = false;
                                            }
                                        }
                                        current_instance.fo_f_muv_kiv_count = 0;
                                        current_instance.fo_f_is_attr[i / 2] = true;
                                        current_instance.fo_f_attr_kiv_count = 1;
                                        current_instance.fo_f_group_num = fo_muv_groups[i / 2];
                                        current_instance.fo_f_attr_min_idx = i / 2;
                                        current_instance.fo_f_is_ng_muv = false;
                                        current_instance.fo_f_exec = true;
                                    }
                                    dr_fo_ter_f = true;
                                    break;
                                }
                            }
                        }else {
                            if ( current_instance.fo_f_attr_kiv_count == 1 && mouseX >= chart_munit_bx ) {
                                if ( mouseX <= fo_kisl_x1 && current_instance.dia_kiv_f_city_count == 1 && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 ) {
                                    if ( mouseButton == LEFT ) {
                                        current_instance.fo_f_is_many_bal = !(current_instance.fo_f_is_many_bal);
                                    }else {
                                        current_instance.fo_f_is_many_jobb = !(current_instance.fo_f_is_many_jobb);
                                    }
                                    current_instance.fo_f_exec = true;
                                    dr_fo_ter_f = true;
                                }else if ( mouseX <= fo_kisl_x2 && current_instance.dia_kiv_f_city_count == 1 && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 ) {
                                    if ( mouseButton == LEFT ) {
                                        current_instance.fo_f_is_inter_bal = !(current_instance.fo_f_is_inter_bal);
                                    }else {
                                        current_instance.fo_f_is_inter_jobb = !(current_instance.fo_f_is_inter_jobb);
                                    }
                                    current_instance.fo_f_exec = true;
                                    dr_fo_ter_f = true;
                                }else if ( mouseX <= fo_kisl_x3 && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 ) {
                                    current_instance.fo_f_is_hm = !(current_instance.fo_f_is_hm);
                                    current_instance.fo_f_is_hm_ch = true;
                                    dr_map = true;
                                    dr_fo_ter_f = true;
                                }else if ( mouseX <= fo_kisl_x4 && current_instance.dia_kiv_f_city_count == 1 && current_instance.fo_f_attr_kiv_count == 1 && current_instance.fo_f_muv_kiv_count == 1 ) {
                                    current_instance.fo_f_is_dev = !(current_instance.fo_f_is_dev);
                                    current_instance.fo_f_exec = true;
                                    dr_fo_ter_f = true;
                                }else {
                                    int k = current_instance.fo_lehet_f_am_lens[current_instance.fo_f_attr_min_idx] * 2;
                                    for ( int i = 0; i < k; i += 2 ) {
                                        if ( mouseX >= fo_lehet_xs[i] && mouseX <= fo_lehet_xs[i + 1] ) {
                                            if ( mouseButton == RIGHT ) {
                                                if ( !(current_instance.fo_f_is_muv[i / 2]) ) {
                                                    int xx = fo_lehet_attrs_muvs[current_instance.fo_f_attr_min_idx][i / 2];
                                                    if ( current_instance.dia_kiv_f_city_count < 2 || (current_instance.fo_f_muv_kiv_count == 0 && (xx < 4 || xx == 5)) ) {
                                                        if ( ((xx < 4 || xx == 5) && !current_instance.fo_f_is_ng_muv) || current_instance.fo_f_muv_kiv_count == 0 ) {
                                                            if ( !(xx < 4 || xx == 5) ) {
                                                                current_instance.fo_f_is_ng_muv = true;
                                                            }
                                                            current_instance.fo_f_is_muv[i / 2] = true;
                                                            ++current_instance.fo_f_muv_kiv_count;
                                                            if ( current_instance.fo_f_muv_kiv_count == 1 ) {
                                                                current_instance.fo_f_muv_min_idx = xx;
                                                            }
                                                            current_instance.fo_f_exec = true;
                                                        }
                                                    }
                                                }else {
                                                    int xx = fo_lehet_attrs_muvs[current_instance.fo_f_attr_min_idx][i / 2];
                                                    if ( !(xx < 4 || xx == 5) ) {
                                                        current_instance.fo_f_is_ng_muv = false;
                                                    }
                                                    current_instance.fo_f_is_muv[i / 2] = false;
                                                    --current_instance.fo_f_muv_kiv_count;
                                                    if ( current_instance.fo_f_muv_kiv_count == 1 ) {
                                                        for ( int j = 0; j < 5; ++j ) {
                                                            if ( current_instance.fo_f_is_muv[j] ) {
                                                                current_instance.fo_f_muv_min_idx = fo_lehet_attrs_muvs[current_instance.fo_f_attr_min_idx][j];
                                                                break;
                                                            }
                                                        }
                                                    }
                                                    current_instance.fo_f_exec = true;
                                                }
                                            }else {
                                                int xx = fo_lehet_attrs_muvs[current_instance.fo_f_attr_min_idx][i / 2];
                                                if ( current_instance.dia_kiv_f_city_count < 2 || (xx < 4 || xx == 5) ) {
                                                    for ( int j = 0; j < 5; ++j ) {
                                                        if ( current_instance.fo_f_is_muv[j] ) {
                                                            current_instance.fo_f_is_muv[j] = false;
                                                        }
                                                    }
                                                    current_instance.fo_f_is_muv[i / 2] = true;
                                                    current_instance.fo_f_muv_kiv_count = 1;
                                                    current_instance.fo_f_muv_min_idx = xx;
                                                    if ( xx < 4 || xx == 5 ) {
                                                        current_instance.fo_f_is_ng_muv = false;
                                                    }else {
                                                        current_instance.fo_f_is_ng_muv = true;
                                                    }
                                                    current_instance.fo_f_exec = true;
                                                }
                                            }
                                            dr_fo_ter_f = true;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case 2:
                        if ( mouseY >= fo_f_slider_ty && mouseY <= fo_f_slider_by ) {
                            if ( mouseX >= current_instance.fo_f_slider_k_tx && mouseX <= current_instance.fo_f_slider_k_bx ) {
                                fo_f_dragged = 0;
                                prev_mouseX = mouseX;
                            }else if ( mouseX >= current_instance.fo_f_slider_v_tx && mouseX <= current_instance.fo_f_slider_v_bx ) {
                                fo_f_dragged = 1;
                                prev_mouseX = mouseX;
                            }
                        }
                        break;
                    case 3:
                        if ( mouseY >= fo_agg_f_ty && mouseY <= fo_agg_f_by ) {
                            for ( int i = 0; i < current_instance.fo_f_agg_count * 2; i += 2 ) {
                                if ( mouseX >= fo_agg_xs[i] && mouseX <= fo_agg_xs[i + 1] ) {
                                    current_instance.fo_f_agg_kiv = i / 2;
                                    current_instance.fo_f_text_agg = "Agg.: " + fo_agg_texts[current_instance.fo_f_agg_kiv];
                                    if ( current_instance.fo_f_agg_kiv != 0 && current_instance.fo_lehet_f_am_lens[7] == 3 ) {
                                        current_instance.fo_lehet_f_am_lens[7] = 2;
                                        current_instance.fo_lehet_f_am_lens[8] = 2;
                                        current_instance.fo_lehet_f_am_lens[12] = 1;
                                    }else if ( current_instance.fo_f_agg_kiv == 0 && current_instance.fo_lehet_f_am_lens[7] == 2 ) {
                                        current_instance.fo_lehet_f_am_lens[7] = 3;
                                        current_instance.fo_lehet_f_am_lens[8] = 3;
                                        current_instance.fo_lehet_f_am_lens[12] = 2;
                                    }
                                    current_instance.is_f_agg_changed = true;
                                    dr_fo_ter_f = true;
                                    break;
                                }
                            }
                        }
                        break;
                    case 4:
                        if ( mouseY <= fo_f_al_month_by && mouseY >= fo_f_al_month_ty ) {
                            if ( fo_al_month_xs[0] <= mouseX ) {
                                for ( int i = 1; i < 13; ++i ) {
                                    if ( mouseX <= fo_al_month_xs[i] ) {
                                        current_instance.fo_f_al_k_month = i;
                                        current_instance.eddig_f_k = days_of_months[i - 1];
                                        if ( current_instance.fo_f_al_k_day > current_instance.eddig_f_k ) {
                                            current_instance.fo_f_al_k_day = current_instance.eddig_f_k;
                                        }
                                        current_instance.fo_f_text_al_k = "Al. k.: " + (i < 10 ? "0" : "") + String.valueOf(i) + (current_instance.fo_f_al_k_day < 10 ? ".0" : ".") + String.valueOf(current_instance.fo_f_al_k_day) + ".";
                                        dr_fo_ter_f = true;
                                        break;
                                    }
                                }
                            }
                        }else if ( mouseY <= fo_f_al_day_by && mouseY >= fo_f_al_day_ty ){
                            if ( fo_al_day_xs[0] <= mouseX ) {
                                for ( int i = 1; i <= current_instance.eddig_f_k; ++i ) {
                                    if ( mouseX <= fo_al_day_xs[i] ) {
                                        current_instance.fo_f_al_k_day = i;
                                        current_instance.fo_f_text_al_k = "Al. k.: " + (current_instance.fo_f_al_k_month < 10 ? "0" : "") + String.valueOf(current_instance.fo_f_al_k_month) + (i < 10 ? ".0" : ".") + String.valueOf(i) + ".";
                                        dr_fo_ter_f = true;
                                        break;
                                    }
                                }
                            }
                        }
                        break;
                    case 5:
                        if ( mouseY <= fo_f_al_month_by && mouseY >= fo_f_al_month_ty ) {
                            if ( fo_al_month_xs[0] <= mouseX ) {
                                for ( int i = 1; i < 13; ++i ) {
                                    if ( mouseX <= fo_al_month_xs[i] ) {
                                        current_instance.fo_f_al_v_month = i;
                                        current_instance.eddig_f_v = days_of_months[i - 1];
                                        if ( current_instance.fo_f_al_v_day > current_instance.eddig_f_v ) {
                                            current_instance.fo_f_al_v_day = current_instance.eddig_f_v;
                                        }
                                        current_instance.fo_f_text_al_v = "Al. v.: " + (i < 10 ? "0" : "") + String.valueOf(i) + (current_instance.fo_f_al_v_day < 10 ? ".0" : ".") + String.valueOf(current_instance.fo_f_al_v_day) + ".";
                                        dr_fo_ter_f = true;
                                        break;
                                    }
                                }
                            }
                        }else if ( mouseY <= fo_f_al_day_by && mouseY >= fo_f_al_day_ty ){
                            if ( fo_al_day_xs[0] <= mouseX ) {
                                for ( int i = 1; i <= current_instance.eddig_f_v; ++i ) {
                                    if ( mouseX <= fo_al_day_xs[i] ) {
                                        current_instance.fo_f_al_v_day = i;
                                        current_instance.fo_f_text_al_v = "Al. v.: " + (current_instance.fo_f_al_v_month < 10 ? "0" : "") + String.valueOf(current_instance.fo_f_al_v_month) + (i < 10 ? ".0" : ".") + String.valueOf(i) + ".";
                                        dr_fo_ter_f = true;
                                        break;
                                    }
                                }
                            }
                        }
                }
            }
        }else if ( mouseY >= station2_rect_ty && mouseY <= lenyil_a_rect_by ) {
            if ( mouseY <= station2_rect_by ) {
                if ( mouseX >= fo_ido_menu_x_both_k && mouseX <= fo_ido_menu_x_both_v ) {
                    current_instance.fo_f_k_year = current_instance.fo_a_k_year;
                    current_instance.fo_f_v_year = current_instance.fo_a_v_year;
                    current_instance.fo_f_agg_kiv = current_instance.fo_a_agg_kiv;
                    current_instance.fo_f_al_k_day = current_instance.fo_a_al_k_day;
                    current_instance.fo_f_al_k_month = current_instance.fo_a_al_k_month;
                    current_instance.fo_f_al_v_day = current_instance.fo_a_al_v_day;
                    current_instance.fo_f_al_v_month = current_instance.fo_a_al_v_month;
                    current_instance.eddig_f_k = current_instance.eddig_a_k;
                    current_instance.eddig_f_v = current_instance.eddig_a_v;
                    current_instance.fo_f_text_from = current_instance.fo_a_text_from;
                    current_instance.fo_f_text_to = current_instance.fo_a_text_to;
                    current_instance.fo_f_text_agg = current_instance.fo_a_text_agg;
                    current_instance.fo_f_text_al_k = current_instance.fo_a_text_al_k;
                    current_instance.fo_f_text_al_v = current_instance.fo_a_text_al_v;
                    current_instance.fo_f_slider_k_tx = current_instance.fo_a_slider_k_tx;
                    current_instance.fo_f_slider_k_bx = current_instance.fo_a_slider_k_bx;
                    current_instance.fo_f_slider_v_tx = current_instance.fo_a_slider_v_tx;
                    current_instance.fo_f_slider_v_bx = current_instance.fo_a_slider_v_bx;
                    current_instance.fo_f_agg_count = current_instance.fo_a_agg_count;
                    current_instance.fo_lehet_f_am_lens[7] = current_instance.fo_lehet_a_am_lens[7];
                    current_instance.fo_lehet_f_am_lens[8] = current_instance.fo_lehet_a_am_lens[8];
                    current_instance.fo_lehet_f_am_lens[12] = current_instance.fo_lehet_a_am_lens[12];
                    dr_fo_ter_f = true;
                }else if ( mouseX >= fo_ido_menu_x_both_v && mouseX <= fo_ido_menu_x_to ) {
                    if ( current_instance.fo_a_ido_menu_kiv != 2 ) {
                        current_instance.fo_a_ido_menu_kiv = 2;
                    }else {
                        current_instance.fo_a_ido_menu_kiv = -1;
                    }
                }else if ( mouseX >= fo_ido_menu_x_to && mouseX <= fo_ido_menu_x_agg ) {
                    if ( current_instance.fo_a_ido_menu_kiv != 3 ) {
                        current_instance.fo_a_ido_menu_kiv = 3;
                    }else {
                        current_instance.fo_a_ido_menu_kiv = -1;
                    }
                }else if ( mouseX >= fo_ido_menu_x_agg && mouseX <= fo_ido_menu_x_al_k ) {
                    if ( current_instance.fo_a_agg_kiv == 0 ){
                        if ( current_instance.fo_a_ido_menu_kiv != 4 ) {
                            current_instance.fo_a_ido_menu_kiv = 4;
                        }else {
                            current_instance.fo_a_ido_menu_kiv = -1;
                        }
                    }
                }else if ( mouseX >= fo_ido_menu_x_al_k && mouseX <= fo_ido_menu_x_al_v ) {
                    if ( current_instance.fo_a_agg_kiv == 0 ){
                        if ( current_instance.fo_a_ido_menu_kiv != 5 ) {
                            current_instance.fo_a_ido_menu_kiv = 5;
                        }else {
                            current_instance.fo_a_ido_menu_kiv = -1;
                        }
                    }
                }
                dr_fo_ter_a = true;
            }else {
                switch ( current_instance.fo_a_ido_menu_kiv ) {
                    case -1:
                        if ( mouseY <= fo_a_attr_by ) {
                            for ( int i = 0; i < 26; i += 2 ) {
                                if ( mouseX >= fo_attr_xs[i] && mouseX <= fo_attr_xs[i + 1] ) {
                                    if ( mouseButton == RIGHT ) {
                                        if ( !(current_instance.fo_a_is_attr[i / 2]) ) {
                                            if ( current_instance.dia_kiv_a_city_count < 2 || current_instance.fo_a_attr_kiv_count == 0 ) {
                                                if ( current_instance.fo_a_attr_kiv_count == 0 || fo_muv_groups[i / 2] == current_instance.fo_a_group_num ) {
                                                    current_instance.fo_a_is_attr[i / 2] = true;
                                                    ++current_instance.fo_a_attr_kiv_count;
                                                    if ( current_instance.fo_a_attr_kiv_count == 1 ) {
                                                        current_instance.fo_a_attr_min_idx = i / 2;
                                                        for ( int j = 0; j < 5; ++j ) {
                                                            current_instance.fo_a_is_muv[j] = false;
                                                        }
                                                        current_instance.fo_a_muv_kiv_count = 0;
                                                    }
                                                    if ( current_instance.fo_a_attr_kiv_count == 1 ) {
                                                        current_instance.fo_a_group_num = fo_muv_groups[i / 2];
                                                    }
                                                    current_instance.fo_a_exec = true;
                                                }
                                            }
                                        }else {
                                            current_instance.fo_a_is_attr[i / 2] = false;
                                            --current_instance.fo_a_attr_kiv_count;
                                            if ( current_instance.fo_a_attr_kiv_count == 1 ) {
                                                for ( int j = 0; j < 13; ++j ) {
                                                    if ( current_instance.fo_a_is_attr[j] ) {
                                                        current_instance.fo_a_attr_min_idx = j;
                                                        break;
                                                    }
                                                }
                                                for ( int j = 0; j < 5; ++j ) {
                                                    current_instance.fo_a_is_muv[j] = false;
                                                }
                                                current_instance.fo_a_muv_kiv_count = 0;
                                            }
                                            current_instance.fo_a_exec = true;
                                        }
                                    }else {
                                        for ( int j = 0; j < 13; ++j ) {
                                            if ( current_instance.fo_a_is_attr[j] ) {
                                                current_instance.fo_a_is_attr[j] = false;
                                            }
                                        }
                                        for ( int j = 0; j < 5; ++j ) {
                                            if ( current_instance.fo_a_is_muv[j] ) {
                                                current_instance.fo_a_is_muv[j] = false;
                                            }
                                        }
                                        current_instance.fo_a_muv_kiv_count = 0;
                                        current_instance.fo_a_is_attr[i / 2] = true;
                                        current_instance.fo_a_attr_kiv_count = 1;
                                        current_instance.fo_a_group_num = fo_muv_groups[i / 2];
                                        current_instance.fo_a_attr_min_idx = i / 2;
                                        current_instance.fo_a_is_ng_muv = false;
                                        current_instance.fo_a_exec = true;
                                    }
                                    dr_fo_ter_a = true;
                                    break;
                                }
                            }
                        }else {
                            if ( current_instance.fo_a_attr_kiv_count == 1 && mouseX >= chart_munit_bx ) {
                                if ( mouseX <= fo_kisl_x1 && current_instance.dia_kiv_a_city_count == 1 && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 ) {
                                    if ( mouseButton == LEFT ) {
                                        current_instance.fo_a_is_many_bal = !(current_instance.fo_a_is_many_bal);
                                    }else {
                                        current_instance.fo_a_is_many_jobb = !(current_instance.fo_a_is_many_jobb);
                                    }
                                    current_instance.fo_a_exec = true;
                                    dr_fo_ter_a = true;
                                }else if ( mouseX <= fo_kisl_x2 && current_instance.dia_kiv_a_city_count == 1 && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 ) {
                                    if ( mouseButton == LEFT ) {
                                        current_instance.fo_a_is_inter_bal = !(current_instance.fo_a_is_inter_bal);
                                    }else {
                                        current_instance.fo_a_is_inter_jobb = !(current_instance.fo_a_is_inter_jobb);
                                    }
                                    current_instance.fo_a_exec = true;
                                    dr_fo_ter_a = true;
                                }else if ( mouseX <= fo_kisl_x3 && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 ) {
                                    current_instance.fo_a_is_hm = !(current_instance.fo_a_is_hm);
                                    current_instance.fo_a_is_hm_ch = true;
                                    dr_map = true;
                                    dr_fo_ter_a = true;
                                }else if ( mouseX <= fo_kisl_x4 && current_instance.dia_kiv_a_city_count == 1 && current_instance.fo_a_attr_kiv_count == 1 && current_instance.fo_a_muv_kiv_count == 1 ) {
                                    current_instance.fo_a_is_dev = !(current_instance.fo_a_is_dev);
                                    current_instance.fo_a_exec = true;
                                    dr_fo_ter_a = true;
                                }else {
                                    int k = current_instance.fo_lehet_a_am_lens[current_instance.fo_a_attr_min_idx] * 2;
                                    for ( int i = 0; i < k; i += 2 ) {
                                        if ( mouseX >= fo_lehet_xs[i] && mouseX <= fo_lehet_xs[i + 1] ) {
                                            if ( mouseButton == RIGHT ){
                                                if ( !(current_instance.fo_a_is_muv[i / 2]) ) {
                                                    int xx = fo_lehet_attrs_muvs[current_instance.fo_a_attr_min_idx][i / 2];
                                                    if ( current_instance.dia_kiv_a_city_count < 2 || (current_instance.fo_a_muv_kiv_count == 0 && (xx < 4 || xx == 5)) ) {
                                                        if ( ((xx < 4 || xx == 5) && !current_instance.fo_a_is_ng_muv) || current_instance.fo_a_muv_kiv_count == 0 ) {
                                                            if ( !(xx < 4 || xx == 5) ) {
                                                                current_instance.fo_a_is_ng_muv = true;
                                                            }
                                                            current_instance.fo_a_is_muv[i / 2] = true;
                                                            ++current_instance.fo_a_muv_kiv_count;
                                                            if ( current_instance.fo_a_muv_kiv_count == 1 ) {
                                                                current_instance.fo_a_muv_min_idx = xx;
                                                            }
                                                            current_instance.fo_a_exec = true;
                                                        }
                                                    }
                                                }else {
                                                    int xx = fo_lehet_attrs_muvs[current_instance.fo_a_attr_min_idx][i / 2];
                                                    if ( !(xx < 4 || xx == 5) ) {
                                                        current_instance.fo_a_is_ng_muv = false;
                                                    }
                                                    current_instance.fo_a_is_muv[i / 2] = false;
                                                    --current_instance.fo_a_muv_kiv_count;
                                                    if ( current_instance.fo_a_muv_kiv_count == 1 ) {
                                                        for ( int j = 0; j < 5; ++j ) {
                                                            if ( current_instance.fo_a_is_muv[j] ) {
                                                                current_instance.fo_a_muv_min_idx = fo_lehet_attrs_muvs[current_instance.fo_a_attr_min_idx][j];
                                                                break;
                                                            }
                                                        }
                                                    }
                                                    current_instance.fo_a_exec = true;
                                                }
                                            }else {
                                                int xx = fo_lehet_attrs_muvs[current_instance.fo_a_attr_min_idx][i / 2];
                                                if ( current_instance.dia_kiv_a_city_count < 2 || (xx < 4 || xx == 5) ) {
                                                    for ( int j = 0; j < 5; ++j ) {
                                                        if ( current_instance.fo_a_is_muv[j] ) {
                                                            current_instance.fo_a_is_muv[j] = false;
                                                        }
                                                    }
                                                    current_instance.fo_a_is_muv[i / 2] = true;
                                                    current_instance.fo_a_muv_kiv_count = 1;
                                                    current_instance.fo_a_muv_min_idx = xx;
                                                    if ( xx < 4 || xx == 5 ) {
                                                        current_instance.fo_a_is_ng_muv = false;
                                                    }else {
                                                        current_instance.fo_a_is_ng_muv = true;
                                                    }
                                                    current_instance.fo_a_exec = true;
                                                }
                                            }
                                            dr_fo_ter_a = true;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case 2:
                        if ( mouseY >= fo_a_slider_ty && mouseY <= fo_a_slider_by ) {
                            if ( mouseX >= current_instance.fo_a_slider_k_tx && mouseX <= current_instance.fo_a_slider_k_bx ) {
                                fo_a_dragged = 0;
                                prev_mouseX = mouseX;
                            }else if ( mouseX >= current_instance.fo_a_slider_v_tx && mouseX <= current_instance.fo_a_slider_v_bx ) {
                                fo_a_dragged = 1;
                                prev_mouseX = mouseX;
                            }
                        }
                        break;
                    case 3:
                        if ( mouseY >= fo_agg_a_ty && mouseY <= fo_agg_a_by ) {
                            for ( int i = 0; i < current_instance.fo_a_agg_count * 2; i += 2 ) {
                                if ( mouseX >= fo_agg_xs[i] && mouseX <= fo_agg_xs[i + 1] ) {
                                    current_instance.fo_a_agg_kiv = i / 2;
                                    current_instance.fo_a_text_agg = "Agg.: " + fo_agg_texts[current_instance.fo_a_agg_kiv];
                                    if ( current_instance.fo_a_agg_kiv != 0 && current_instance.fo_lehet_a_am_lens[7] == 3 ) {
                                        current_instance.fo_lehet_a_am_lens[7] = 2;
                                        current_instance.fo_lehet_a_am_lens[8] = 2;
                                        current_instance.fo_lehet_a_am_lens[12] = 1;
                                    }else if ( current_instance.fo_a_agg_kiv == 0 && current_instance.fo_lehet_a_am_lens[7] == 2 ) {
                                        current_instance.fo_lehet_a_am_lens[7] = 3;
                                        current_instance.fo_lehet_a_am_lens[8] = 3;
                                        current_instance.fo_lehet_a_am_lens[12] = 2;
                                    }
                                    current_instance.is_a_agg_changed = true;
                                    dr_fo_ter_a = true;
                                    break;
                                }
                            }
                        }
                        break;
                    case 4:
                        if ( mouseY <= fo_a_al_month_by && mouseY >= fo_a_al_month_ty ) {
                            if ( fo_al_month_xs[0] <= mouseX ) {
                                for ( int i = 1; i < 13; ++i ) {
                                    if ( mouseX <= fo_al_month_xs[i] ) {
                                        current_instance.fo_a_al_k_month = i;
                                        current_instance.eddig_a_k = days_of_months[i - 1];
                                        if ( current_instance.fo_a_al_k_day > current_instance.eddig_a_k ) {
                                            current_instance.fo_a_al_k_day = current_instance.eddig_a_k;
                                        }
                                        current_instance.fo_a_text_al_k = "Al. k.: " + (i < 10 ? "0" : "") + String.valueOf(i) + (current_instance.fo_a_al_k_day < 10 ? ".0" : ".") + String.valueOf(current_instance.fo_a_al_k_day) + ".";
                                        dr_fo_ter_a = true;
                                        break;
                                    }
                                }
                            }
                        }else if ( mouseY <= fo_a_al_day_by && mouseY >= fo_a_al_day_ty ){
                            if ( fo_al_day_xs[0] <= mouseX ) {
                                for ( int i = 1; i <= current_instance.eddig_a_k; ++i ) {
                                    if ( mouseX <= fo_al_day_xs[i] ) {
                                        current_instance.fo_a_al_k_day = i;
                                        current_instance.fo_a_text_al_k = "Al. k.: " + (current_instance.fo_a_al_k_month < 10 ? "0" : "") + String.valueOf(current_instance.fo_a_al_k_month) + (i < 10 ? ".0" : ".") + String.valueOf(i) + ".";
                                        dr_fo_ter_a = true;
                                        break;
                                    }
                                }
                            }
                        }
                        break;
                    case 5:
                        if ( mouseY <= fo_a_al_month_by && mouseY >= fo_a_al_month_ty ) {
                            if ( fo_al_month_xs[0] <= mouseX ) {
                                for ( int i = 1; i < 13; ++i ) {
                                    if ( mouseX <= fo_al_month_xs[i] ) {
                                        current_instance.fo_a_al_v_month = i;
                                        current_instance.eddig_a_v = days_of_months[i - 1];
                                        if ( current_instance.fo_a_al_v_day > current_instance.eddig_a_v ) {
                                            current_instance.fo_a_al_v_day = current_instance.eddig_a_v;
                                        }
                                        current_instance.fo_a_text_al_v = "Al. v.: " + (i < 10 ? "0" : "") + String.valueOf(i) + (current_instance.fo_a_al_v_day < 10 ? ".0" : ".") + String.valueOf(current_instance.fo_a_al_v_day) + ".";
                                        dr_fo_ter_a = true;
                                        break;
                                    }
                                }
                            }
                        }else if ( mouseY <= fo_a_al_day_by && mouseY >= fo_a_al_day_ty ){
                            if ( fo_al_day_xs[0] <= mouseX ) {
                                for ( int i = 1; i <= current_instance.eddig_a_v; ++i ) {
                                    if ( mouseX <= fo_al_day_xs[i] ) {
                                        current_instance.fo_a_al_v_day = i;
                                        current_instance.fo_a_text_al_v = "Al. v.: " + (current_instance.fo_a_al_v_month < 10 ? "0" : "") + String.valueOf(current_instance.fo_a_al_v_month) + (i < 10 ? ".0" : ".") + String.valueOf(i) + ".";
                                        dr_fo_ter_a = true;
                                        break;
                                    }
                                }
                            }
                        }
                }
            }
        }else if ( mouseY < station2_rect_ty ) {
            if ( mouseButton == LEFT ) {
                current_instance.fo_f_ido_menu_kiv = -1;
                dr_fo_ter_f = true;
            }else {
                current_instance.isFirst = true;
                if ( current_instance.fo_f_is_hm ) {
                    if ( !current_instance.is_f_ut_heatmap ) {
                        current_instance.fo_f_is_hm_ch = true;
                    }
                }
                dr_map = true;
            }
        }else {
            if ( mouseButton == LEFT ) {
                current_instance.fo_a_ido_menu_kiv = -1;
                dr_fo_ter_a = true;
            }else {
                current_instance.isFirst = false;
                if ( current_instance.fo_a_is_hm ) {
                    if ( current_instance.is_f_ut_heatmap ) {
                        current_instance.fo_a_is_hm_ch = true;
                    }
                }
                dr_map = true;
            }
        }
    }
    // ----------------------------------------------------------------------------
    else if ( mouseY >= mavi_y3 && mouseX <= mavi_xv ) {
        if ( mouseX >= mavi_xko ) {
            current_instance.mavi_is_magma = false;
        }else {
            current_instance.mavi_is_magma = true;
        }
        if ( current_instance.is_heatmap_drawed ) {
            if ( current_instance.is_f_ut_heatmap ) {
                current_instance.fo_f_is_hm_ch = true;
            }else {
                current_instance.fo_a_is_hm_ch = true;
            }
            dr_map = true;
        }
        dr_mavi = true;
    }
}

void mouseReleased() {
    if ( mouseY <= tab_height ) {
        tab_dragged = -1;
    }
    else if ( mouseY <= map_eltolas ) {
        if ( mouseX <= draw_map_rect[2] ) {
            if ( latlon_dragged != -1 ) {
                current_instance.kiv_city_count = 0;
                for ( int i = 0; i < city_count; ++i ) {
                    if ( lons[i] >= current_instance.act_lon_k && lons[i] <= current_instance.act_lon_v && lats[i] >= current_instance.act_lat_k && lats[i] <= current_instance.act_lat_v ) {
                        current_instance.map_kiv_cities[i] = true;
                        ++current_instance.kiv_city_count;
                    }else {
                        current_instance.map_kiv_cities[i] = false;
                        if ( current_instance.dia_f_allkiv_cities_idx[i] != -1 ) {
                            current_instance.dia_f_allkiv_cities_idx[i] = -1;
                            --(current_instance.dia_kiv_f_city_count);
                            for ( int k = 0; k < 7; ++k ) {
                                if ( current_instance.dia_f_kiv_cities_idx[k] == i ) {
                                    current_instance.dia_f_kiv_cities_idx[k] = -1;
                                    break;
                                }
                            }
                        }
                        if ( current_instance.dia_a_allkiv_cities_idx[i] != -1 ) {
                            current_instance.dia_a_allkiv_cities_idx[i] = -1;
                            --(current_instance.dia_kiv_a_city_count);
                            for ( int k = 0; k < 7; ++k ) {
                                if ( current_instance.dia_a_kiv_cities_idx[k] == i ) {
                                    current_instance.dia_a_kiv_cities_idx[k] = -1;
                                    break;
                                }
                            }
                        }
                    }
                }
                dr_map = true;
                dr_city_lists = true;
                latlon_dragged = -1;
            }
        }
    }
    else if ( mouseY <= draw_map_rect[3] ) {
        if ( mouseX <= draw_map_rect[2] ) {
            if ( rectkiv_dragged != -1 ) {
                current_instance.kiv_city_count = 0;
                for ( int i = 0; i < city_count; ++i ) {
                    if ( draw_x[i] >= current_instance.rect_kiv_tx && draw_x[i] <= current_instance.rect_kiv_bx && draw_y[i] >= current_instance.rect_kiv_ty && draw_y[i] <= current_instance.rect_kiv_by ) {
                        current_instance.map_kiv_cities[i] = true;
                        ++current_instance.kiv_city_count;
                    }else {
                        current_instance.map_kiv_cities[i] = false;
                        if ( current_instance.dia_f_allkiv_cities_idx[i] != -1 ) {
                            current_instance.dia_f_allkiv_cities_idx[i] = -1;
                            --(current_instance.dia_kiv_f_city_count);
                            for ( int k = 0; k < 7; ++k ) {
                                if ( current_instance.dia_f_kiv_cities_idx[k] == i ) {
                                    current_instance.dia_f_kiv_cities_idx[k] = -1;
                                    break;
                                }
                            }
                        }
                        if ( current_instance.dia_a_allkiv_cities_idx[i] != -1 ) {
                            current_instance.dia_a_allkiv_cities_idx[i] = -1;
                            --(current_instance.dia_kiv_a_city_count);
                            for ( int k = 0; k < 7; ++k ) {
                                if ( current_instance.dia_a_kiv_cities_idx[k] == i ) {
                                    current_instance.dia_a_kiv_cities_idx[k] = -1;
                                    break;
                                }
                            }
                        }
                    }
                }
                dr_map = true;
                dr_city_lists = true;
                rectkiv_dragged = -1;
            }
        }else {
            fo_f_dragged = -1;
            fo_a_dragged = -1;
        }
    }
}

void mouseDragged() {
    if ( mouseY <= tab_height ) {
        if ( tab_dragged != -1 ) {
            // elore huzas
            // if ( mouseX - prev_mouseX >= a_tab_width && tab_dragged != tab_count - 1 ) {
            if ( mouseX - prev_mouseX > 0 && tab_dragged != tab_count - 1 && mouseX >= tab_kozep_vonalak[tab_dragged + 1] ) {
                int tmp = tab_texts[tab_dragged];
                tab_texts[tab_dragged] = tab_texts[tab_dragged + 1];
                tab_texts[tab_dragged + 1] = tmp;
                ++tab_dragged;
                ++active_tab;
                prev_mouseX = mouseX;
                dr_tab = true;
            }
            // hatra huzas
            // else if ( prev_mouseX - mouseX >= a_tab_width && tab_dragged != 0 ) {
            else if ( tab_dragged != 0 && mouseX <= tab_kozep_vonalak[tab_dragged - 1] ) {
                int tmp = tab_texts[tab_dragged];
                tab_texts[tab_dragged] = tab_texts[tab_dragged - 1];
                tab_texts[tab_dragged - 1] = tmp;
                --tab_dragged;
                --active_tab;
                prev_mouseX = mouseX;
                dr_tab = true;
            }
        }
    }
    else if ( mouseY <= map_eltolas ) {
        if ( mouseX <= draw_map_rect[2] ) {
            if ( latlon_dragged != -1 ) {
                float tmptx;
                switch ( latlon_dragged ) {
                    case 0:
                        tmptx = current_instance.lat_1_tx;
                        current_instance.lat_1_tx += mouseX - prev_mouseX;
                        current_instance.lat_1_bx += mouseX - prev_mouseX;
                        if ( current_instance.lat_1_tx < lat_slider_start ) {
                            current_instance.lat_1_tx = lat_slider_start;
                            current_instance.lat_1_bx = current_instance.lat_1_tx + csuszka_wid;
                        }else if ( current_instance.lat_1_bx > current_instance.lat_2_tx ) {
                            current_instance.lat_1_bx = current_instance.lat_2_tx;
                            current_instance.lat_1_tx = current_instance.lat_1_bx - csuszka_wid;
                        }
                        if ( tmptx != current_instance.lat_1_tx ) {
                            current_instance.act_lat_k = ((current_instance.lat_1_tx - lat_slider_start) / lat_slider_hossz) * lat_kul + lat_min;
                        }
                        break;
                    case 1:
                        tmptx = current_instance.lat_2_tx;
                        current_instance.lat_2_tx += mouseX - prev_mouseX;
                        current_instance.lat_2_bx += mouseX - prev_mouseX;
                        if ( current_instance.lat_2_bx > lat_slider_end ) {
                            current_instance.lat_2_bx = lat_slider_end;
                            current_instance.lat_2_tx = current_instance.lat_2_bx - csuszka_wid;
                        }else if ( current_instance.lat_2_tx < current_instance.lat_1_bx ) {
                            current_instance.lat_2_tx = current_instance.lat_1_bx;
                            current_instance.lat_2_bx = current_instance.lat_2_tx + csuszka_wid;
                        }
                        if ( tmptx != current_instance.lat_2_tx ) {
                            current_instance.act_lat_v = ((current_instance.lat_2_bx - lat_slider_start) / lat_slider_hossz) * lat_kul + lat_min;
                        }
                        break;
                    case 2:
                        tmptx = current_instance.lon_1_tx;
                        current_instance.lon_1_tx += mouseX - prev_mouseX;
                        current_instance.lon_1_bx += mouseX - prev_mouseX;
                        if ( current_instance.lon_1_tx < lon_slider_start ) {
                            current_instance.lon_1_tx = lon_slider_start;
                            current_instance.lon_1_bx = current_instance.lon_1_tx + csuszka_wid;
                        }else if ( current_instance.lon_1_bx > current_instance.lon_2_tx ) {
                            current_instance.lon_1_bx = current_instance.lon_2_tx;
                            current_instance.lon_1_tx = current_instance.lon_1_bx - csuszka_wid;
                        }
                        if ( tmptx != current_instance.lon_1_tx ) {
                            current_instance.act_lon_k = ((current_instance.lon_1_tx - lon_slider_start) / lon_slider_hossz) * lon_kul + lon_min;
                        }
                        break;
                    case 3:
                        tmptx = current_instance.lon_2_tx;
                        current_instance.lon_2_tx += mouseX - prev_mouseX;
                        current_instance.lon_2_bx += mouseX - prev_mouseX;
                        if ( current_instance.lon_2_bx > lon_slider_end ) {
                            current_instance.lon_2_bx = lon_slider_end;
                            current_instance.lon_2_tx = current_instance.lon_2_bx - csuszka_wid;
                        }else if ( current_instance.lon_2_tx < current_instance.lon_1_bx ) {
                            current_instance.lon_2_tx = current_instance.lon_1_bx;
                            current_instance.lon_2_bx = current_instance.lon_2_tx + csuszka_wid;
                        }
                        if ( tmptx != current_instance.lon_2_tx ) {
                            current_instance.act_lon_v = ((current_instance.lon_2_bx - lon_slider_start) / lon_slider_hossz) * lon_kul + lon_min;
                        }
                }
                prev_mouseX = mouseX;
                prev_mouseY = mouseY;
                dr_map = true;
            }
        }
    }
    // map terulet
    else if ( mouseY <= draw_map_rect[3] ) {
        if ( mouseX <= draw_map_rect[2] ) {
            if ( rectkiv_dragged != -1 ) {
                switch ( rectkiv_dragged ) {
                    case 0:
                        current_instance.rect_kiv_tx += mouseX - prev_mouseX;
                        current_instance.rect_kiv_ty += mouseY - prev_mouseY;
                        break;
                    case 1:
                        current_instance.rect_kiv_ty += mouseY - prev_mouseY;
                        break;
                    case 2:
                        current_instance.rect_kiv_ty += mouseY - prev_mouseY;
                        current_instance.rect_kiv_bx += mouseX - prev_mouseX;
                        break;
                    case 3:
                        current_instance.rect_kiv_tx += mouseX - prev_mouseX;
                        break;
                    case 4:
                        current_instance.rect_kiv_bx += mouseX - prev_mouseX;
                        break;
                    case 5:
                        current_instance.rect_kiv_tx += mouseX - prev_mouseX;
                        current_instance.rect_kiv_by += mouseY - prev_mouseY;
                        break;
                    case 6:
                        current_instance.rect_kiv_by += mouseY - prev_mouseY;
                        break;
                    case 7:
                        current_instance.rect_kiv_bx += mouseX - prev_mouseX;
                        current_instance.rect_kiv_by += mouseY - prev_mouseY;
                }
                prev_mouseX = mouseX;
                prev_mouseY = mouseY;
                dr_map = true;
            }
        }else {
            if ( fo_f_dragged != -1 ) {
                if ( fo_f_dragged == 0 ) {
                    float tmptx = current_instance.fo_f_slider_k_tx;
                    current_instance.fo_f_slider_k_tx += mouseX - prev_mouseX;
                    current_instance.fo_f_slider_k_bx += mouseX - prev_mouseX;
                    if ( current_instance.fo_f_slider_k_tx < fo_slider_start ) {
                        current_instance.fo_f_slider_k_tx = fo_slider_start;
                        current_instance.fo_f_slider_k_bx = current_instance.fo_f_slider_k_tx + csuszka_wid;
                    }else if ( current_instance.fo_f_slider_k_bx > current_instance.fo_f_slider_v_tx ){
                        current_instance.fo_f_slider_k_bx = current_instance.fo_f_slider_v_tx;
                        current_instance.fo_f_slider_k_tx = current_instance.fo_f_slider_k_bx - csuszka_wid;
                    }
                    if ( tmptx != current_instance.fo_f_slider_k_tx ) {
                        current_instance.fo_f_k_year = Math.round((((current_instance.fo_f_slider_k_tx + current_instance.fo_f_slider_k_bx) / 2 - fo_slider_line_k_x) / fo_slider_hossz) * 47) + 1973;
                        current_instance.fo_f_text_from = "From: " + String.valueOf(current_instance.fo_f_k_year);
                        int l = current_instance.fo_f_v_year - current_instance.fo_f_k_year + 1;
                        if ( l == 1 ) {
                            current_instance.fo_f_agg_count = 9;
                        }else if ( l < 8 ) {
                            current_instance.fo_f_agg_count = 8;
                        }else if ( l < 15 ){
                            current_instance.fo_f_agg_count = 7;
                        }else {
                            current_instance.fo_f_agg_count = 6;
                        }
                        if ( current_instance.fo_f_agg_kiv >= current_instance.fo_f_agg_count ) {
                            current_instance.fo_f_agg_kiv = 0;
                            current_instance.fo_f_text_agg = "Agg.: " + fo_agg_texts[current_instance.fo_f_agg_kiv];
                        }
                        current_instance.is_f_calc_years = true;
                    }
                }else {
                    float tmptx = current_instance.fo_f_slider_v_tx;
                    current_instance.fo_f_slider_v_tx += mouseX - prev_mouseX;
                    current_instance.fo_f_slider_v_bx += mouseX - prev_mouseX;
                    if ( current_instance.fo_f_slider_v_bx > fo_slider_end ) {
                        current_instance.fo_f_slider_v_bx = fo_slider_end;
                        current_instance.fo_f_slider_v_tx = current_instance.fo_f_slider_v_bx - csuszka_wid;
                    }else if ( current_instance.fo_f_slider_v_tx < current_instance.fo_f_slider_k_bx ){
                        current_instance.fo_f_slider_v_tx = current_instance.fo_f_slider_k_bx;
                        current_instance.fo_f_slider_v_bx = current_instance.fo_f_slider_v_tx + csuszka_wid;
                    }
                    if ( tmptx != current_instance.fo_f_slider_v_tx ) {
                        current_instance.fo_f_v_year = Math.round((((current_instance.fo_f_slider_v_tx + current_instance.fo_f_slider_v_bx) / 2 - fo_slider_line_k_x) / fo_slider_hossz) * 47) + 1973;
                        current_instance.fo_f_text_to = "To: " + String.valueOf(current_instance.fo_f_v_year);
                        int l = current_instance.fo_f_v_year - current_instance.fo_f_k_year + 1;
                        if ( l == 1 ) {
                            current_instance.fo_f_agg_count = 9;
                        }else if ( l < 8 ) {
                            current_instance.fo_f_agg_count = 8;
                        }else if ( l < 15 ){
                            current_instance.fo_f_agg_count = 7;
                        }else {
                            current_instance.fo_f_agg_count = 6;
                        }
                        if ( current_instance.fo_f_agg_kiv >= current_instance.fo_f_agg_count ) {
                            current_instance.fo_f_agg_kiv = 0;
                            current_instance.fo_f_text_agg = "Agg.: " + fo_agg_texts[current_instance.fo_f_agg_kiv];
                        }
                        current_instance.is_f_calc_years = true;
                    }
                }
                prev_mouseX = mouseX;
                dr_fo_ter_f = true;
            }else if ( fo_a_dragged != -1 ) {
                if ( fo_a_dragged == 0 ) {
                    float tmptx = current_instance.fo_a_slider_k_tx;
                    current_instance.fo_a_slider_k_tx += mouseX - prev_mouseX;
                    current_instance.fo_a_slider_k_bx += mouseX - prev_mouseX;
                    if ( current_instance.fo_a_slider_k_tx < fo_slider_start ) {
                        current_instance.fo_a_slider_k_tx = fo_slider_start;
                        current_instance.fo_a_slider_k_bx = current_instance.fo_a_slider_k_tx + csuszka_wid;
                    }else if ( current_instance.fo_a_slider_k_bx > current_instance.fo_a_slider_v_tx ){
                        current_instance.fo_a_slider_k_bx = current_instance.fo_a_slider_v_tx;
                        current_instance.fo_a_slider_k_tx = current_instance.fo_a_slider_k_bx - csuszka_wid;
                    }
                    if ( tmptx != current_instance.fo_a_slider_k_tx ) {
                        current_instance.fo_a_k_year = Math.round((((current_instance.fo_a_slider_k_tx + current_instance.fo_a_slider_k_bx) / 2 - fo_slider_line_k_x) / fo_slider_hossz) * 47) + 1973;
                        current_instance.fo_a_text_from = "From: " + String.valueOf(current_instance.fo_a_k_year);
                        int l = current_instance.fo_a_v_year - current_instance.fo_a_k_year + 1;
                        if ( l == 1 ) {
                            current_instance.fo_a_agg_count = 9;
                        }else if ( l < 8 ) {
                            current_instance.fo_a_agg_count = 8;
                        }else if ( l < 15 ){
                            current_instance.fo_a_agg_count = 7;
                        }else {
                            current_instance.fo_a_agg_count = 6;
                        }
                        if ( current_instance.fo_a_agg_kiv >= current_instance.fo_a_agg_count ) {
                            current_instance.fo_a_agg_kiv = 0;
                            current_instance.fo_a_text_agg = "Agg.: " + fo_agg_texts[current_instance.fo_a_agg_kiv];
                        }
                        current_instance.is_a_calc_years = true;
                    }
                }else {
                    float tmptx = current_instance.fo_a_slider_v_tx;
                    current_instance.fo_a_slider_v_tx += mouseX - prev_mouseX;
                    current_instance.fo_a_slider_v_bx += mouseX - prev_mouseX;
                    if ( current_instance.fo_a_slider_v_bx > fo_slider_end ) {
                        current_instance.fo_a_slider_v_bx = fo_slider_end;
                        current_instance.fo_a_slider_v_tx = current_instance.fo_a_slider_v_bx - csuszka_wid;
                    }else if ( current_instance.fo_a_slider_v_tx < current_instance.fo_a_slider_k_bx ){
                        current_instance.fo_a_slider_v_tx = current_instance.fo_a_slider_k_bx;
                        current_instance.fo_a_slider_v_bx = current_instance.fo_a_slider_v_tx + csuszka_wid;
                    }
                    if ( tmptx != current_instance.fo_a_slider_v_tx ) {
                        current_instance.fo_a_v_year = Math.round((((current_instance.fo_a_slider_v_tx + current_instance.fo_a_slider_v_bx) / 2 - fo_slider_line_k_x) / fo_slider_hossz) * 47) + 1973;
                        current_instance.fo_a_text_to = "To: " + String.valueOf(current_instance.fo_a_v_year);
                        int l = current_instance.fo_a_v_year - current_instance.fo_a_k_year + 1;
                        if ( l == 1 ) {
                            current_instance.fo_a_agg_count = 9;
                        }else if ( l < 8 ) {
                            current_instance.fo_a_agg_count = 8;
                        }else if ( l < 15 ){
                            current_instance.fo_a_agg_count = 7;
                        }else {
                            current_instance.fo_a_agg_count = 6;
                        }
                        if ( current_instance.fo_a_agg_kiv >= current_instance.fo_a_agg_count ) {
                            current_instance.fo_a_agg_kiv = 0;
                            current_instance.fo_a_text_agg = "Agg.: " + fo_agg_texts[current_instance.fo_a_agg_kiv];
                        }
                        current_instance.is_a_calc_years = true;
                    }
                }
                prev_mouseX = mouseX;
                dr_fo_ter_a = true;
            }
        }
    }
}

void mouseWheel(MouseEvent event) {
    if ( mouseX >= rect_f_kiv_cities[0] && mouseX <= rect_f_kiv_cities[2] && mouseY >= rect_f_kiv_cities[1] && mouseY <= rect_f_kiv_cities[71] ) {
        if ( event.getCount() > 0 ) {
            current_instance.megj_f_start += 2;
            if ( current_instance.megj_f_start > current_instance.kiv_city_count - 18 ) {
                current_instance.megj_f_start = current_instance.kiv_city_count - 18;
            }
        }else {
            current_instance.megj_f_start -= 2;
            if ( current_instance.megj_f_start < 0 ) {
                current_instance.megj_f_start = 0;
            }
        }
        dr_city_lists = true;
    }else if ( mouseX >= rect_a_kiv_cities[0] && mouseX <= rect_a_kiv_cities[2] && mouseY >= rect_a_kiv_cities[1] && mouseY <= rect_a_kiv_cities[71] ) {
        if ( event.getCount() > 0 ) {
            current_instance.megj_a_start += 2;
            if ( current_instance.megj_a_start > current_instance.kiv_city_count - 18 ) {
                current_instance.megj_a_start = current_instance.kiv_city_count - 18;
            }
        }else {
            current_instance.megj_a_start -= 2;
            if ( current_instance.megj_a_start < 0 ) {
                current_instance.megj_a_start = 0;
            }
        }
        dr_city_lists = true;
    }
}

void keyPressed() {
    if ( is_enter_name ) {
        if ( Character.isLetterOrDigit(key) ) {
            tab_strings[ch_text_id] += String.valueOf(key);
            dr_tab = true;
        }
        if ( key == 10 ) {
            is_enter_name = false;
        }
    }
}

float In_distance(float mx, float my, float vx, float vy) {
    return (mx - vx) * (mx - vx) + (my - vy) * (my - vy);
}

void Kir_chart_f(int type, int curid, float szin_r, float szin_g, float szin_b ) {
    int c_kiv_city = 0, c_kiv_attr = 0, c_kiv_muv = 0;
    // kezdeti parameterek meghatarozasa
    if ( type == 1 ) {
        c_kiv_city = curid;
        c_kiv_attr = current_instance.fo_f_attr_min_idx;
        c_kiv_muv = current_instance.fo_f_muv_min_idx;
    }else if ( type == 2 ) {
        c_kiv_attr = curid;
        for ( int i = 0; i < 7; ++i ) {
            if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                c_kiv_city = current_instance.dia_f_kiv_cities_idx[i];
                break;
            }
        }
        c_kiv_muv = 0;
    }else if ( type == 3 ) {
        c_kiv_muv = curid;
        for ( int i = 0; i < 7; ++i ) {
            if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                c_kiv_city = current_instance.dia_f_kiv_cities_idx[i];
                break;
            }
        }
        c_kiv_attr = current_instance.fo_f_attr_min_idx;
    }else {
        for ( int i = 0; i < 7; ++i ) {
            if ( current_instance.dia_f_kiv_cities_idx[i] != -1 ) {
                c_kiv_city = current_instance.dia_f_kiv_cities_idx[i];
                break;
            }
        }
        c_kiv_attr = current_instance.fo_f_attr_min_idx;
        c_kiv_muv = current_instance.fo_f_muv_min_idx;
    }
    if ( c_kiv_muv == 4 ) {
        return;
    }
    
    // rajzolando ertekek szamitasa
    float[] y_ertekek = new float[current_instance.kir_f_agg_count];
    float[][] stack_y_ertekek = new float[12][];
    int stack_count = 0, inval_value = -1;
    float[] usearray = new float[3];
    switch ( c_kiv_attr ) {
        case 0:
            usearray = a_temp[c_kiv_city];
            inval_value = 99;
            break;
        case 1:
            usearray = a_tmax[c_kiv_city];
            inval_value = 99;
            break;
        case 2:
            usearray = a_tmin[c_kiv_city];
            inval_value = 99;
            break;
        case 3:
            usearray = a_dewp[c_kiv_city];
            inval_value = 99;
            break;
        case 4:
            usearray = a_wdsp[c_kiv_city];
            inval_value = -1;
            break;
        case 5:
            usearray = a_mxsw[c_kiv_city];
            inval_value = -1;
            break;
        case 6:
            usearray = a_gust[c_kiv_city];
            inval_value = -1;
            break;
        case 7:
            usearray = a_prcp[c_kiv_city];
            inval_value = -1;
            break;
        case 8:
            usearray = a_sndp[c_kiv_city];
            inval_value = -1;
            break;
        case 9:
            usearray = a_slp[c_kiv_city];
            inval_value = -1;
            break;
        case 10:
            usearray = a_stp[c_kiv_city];
            inval_value = -1;
            break;
        case 11:
            usearray = a_visib[c_kiv_city];
            inval_value = -1;
            break;
        case 12:
            usearray = a_frshtt[c_kiv_city];
    }
    int[] aggs_k_idx = new int[576], aggs_v_idx = new int[576];
    LocalDate use_start_date = local_start_dates[c_kiv_city];
    LocalDate use_end_date = local_end_dates[c_kiv_city];
    LocalDate agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1), agg_end_date = agg_start_date;
    boolean jel = false;
    int swagg = 0, stack_ys = 0;
    if ( c_kiv_muv != 6 && c_kiv_muv != 8 ) {
        swagg = current_instance.fo_f_agg_kiv;
        stack_ys = current_instance.kir_f_agg_count;
    }else {
        swagg = 5;
        stack_count = 12;
        stack_ys = current_instance.kir_f_agg_count * stack_count;
        for ( int i = 0; i < stack_count; ++i ) {
            stack_y_ertekek[i] = new float[current_instance.kir_f_agg_count];
        }
    }
    switch ( swagg ) {
        case 0:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, current_instance.fo_f_al_k_month, current_instance.fo_f_al_k_day);
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_k_month, current_instance.fo_f_al_k_day);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_v_month, current_instance.fo_f_al_v_day);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + i, current_instance.fo_f_al_v_month, current_instance.fo_f_al_v_day);
                        if ( agg_end_date.isAfter(use_end_date) ) {
                            break;
                        }
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_v_month, current_instance.fo_f_al_v_day);
                        jel = true;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_k_month, current_instance.fo_f_al_k_day);
                }
            }
            break;
        case 1:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 3, 20);
            int[] seas_mons = { 3, 6, 9, 12 }, seas_days = { 20, 21, 22, 21 };
            int seas_count = 0, sev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++seas_count;
                        if ( seas_count == 4 ) {
                            seas_count = 0;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                        if ( seas_count == 3 ) {
                            ++sev_count;
                        }
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++seas_count;
                    if ( seas_count == 4 ) {
                        seas_count = 0;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                    if ( seas_count == 3 ) {
                        ++sev_count;
                    }
                    agg_end_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                }
            }
            break;
        case 2:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon6_k_mons = { 1, 7 };
            int[] mon6_v_mons = { 6, 12 }, mon6_v_days = { 30, 31 };
            int mon6_count = 0, mon6_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon6_count;
                        if ( mon6_count == 2 ) {
                            mon6_count = 0;
                            ++mon6_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon6_count;
                    if ( mon6_count == 2 ) {
                        mon6_count = 0;
                        ++mon6_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                }
            }
            break;
        case 3:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon4_k_mons = { 1, 5, 9 };
            int[] mon4_v_mons = { 4, 8, 12 }, mon4_v_days = { 30, 31, 31 };
            int mon4_count = 0, mon4_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon4_count;
                        if ( mon4_count == 3 ) {
                            mon4_count = 0;
                            ++mon4_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon4_count;
                    if ( mon4_count == 3 ) {
                        mon4_count = 0;
                        ++mon4_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                }
            }
            break;
        case 4:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon2_k_mons = { 1, 3, 5, 7, 9, 11 };
            int[] mon2_v_mons = { 2, 4, 6, 8, 10, 12 }, mon2_v_days = { 28, 30, 30, 31, 31, 31 };
            int mon2_count = 0, mon2_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon2_count;
                        if ( mon2_count == 6 ) {
                            mon2_count = 0;
                            ++mon2_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                        if ( mon2_count == 0 && (current_instance.chart_f_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon2_count == 0 && (current_instance.chart_f_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon2_count;
                    if ( mon2_count == 6 ) {
                        mon2_count = 0;
                        ++mon2_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                    if ( mon2_count == 0 && (current_instance.chart_f_start_year + mon2_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                    }
                }
            }
            break;
        case 5:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon_mons = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
            int[] mon_v_days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
            int mon_count = 0, mon_ev_count = 0;
            for ( int i = 0; i < stack_ys; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon_count;
                        if ( mon_count == 12 ) {
                            mon_count = 0;
                            ++mon_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 1);
                        if ( mon_count == 1 && (current_instance.chart_f_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon_count == 1 && (current_instance.chart_f_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon_count;
                    if ( mon_count == 12 ) {
                        mon_count = 0;
                        ++mon_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 1);
                    if ( mon_count == 1 && (current_instance.chart_f_start_year + mon_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                    }
                }
            }
            break;
        case 6:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int week2_count = 14, week2_year = current_instance.chart_f_start_year;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                        if ( tmpdate.getYear() > week2_year ) {
                            ++week2_year;
                            agg_start_date = LocalDate.of(week2_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(13);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(13);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(13);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                    if ( tmpdate.getYear() > week2_year ) {
                        ++week2_year;
                        agg_start_date = LocalDate.of(week2_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(13);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(13);
                    }
                }
            }
            break;
        case 7:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int week_count = 7, week_year = current_instance.chart_f_start_year;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week_count);
                        if ( tmpdate.getYear() > week_year ) {
                            ++week_year;
                            agg_start_date = LocalDate.of(week_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(6);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(6);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(6);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week_count);
                    if ( tmpdate.getYear() > week_year ) {
                        ++week_year;
                        agg_start_date = LocalDate.of(week_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(6);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(6);
                    }
                }
            }
            break;
        case 8:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_start_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        agg_start_date = agg_start_date.plusDays(1);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        jel = true;
                    }
                    agg_start_date = agg_start_date.plusDays(1);
                }
            }
    }
    
    // y ertekek szamolasa
    float val_min = 9999f, val_max = -9999f;
    switch ( c_kiv_muv ) {
        case 0:
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        y_ertekek[i] = (float)(osszeg / oc);
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 1:
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float locmax = -9999f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmax != -9999f ) {
                        y_ertekek[i] = locmax;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 2:
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float locmin = 9999f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        y_ertekek[i] = locmin;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 3:
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float locmin = 9999f, locmax = -9999f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        y_ertekek[i] = locmax - locmin;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 5:
            float[] avtemp = a_temp[c_kiv_city];
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    double t_osszeg = 0; int t_oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                        if ( avtemp[j] != inval_value ) {
                            t_osszeg += avtemp[j];
                            ++t_oc;
                        }
                    }
                    if ( oc != 0 && t_oc != 0 ) {
                        y_ertekek[i] = (float)(t_osszeg / t_oc) - (float)(osszeg / oc);
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 6:
            val_min = 0f;
            for ( int i = 0; i < stack_ys; ++i ) {
                int hany = i % stack_count, id_al = i / stack_count;
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        if ( hany != 0 ) {
                            if ( stack_y_ertekek[hany - 1][id_al] != inval_value ) {
                                stack_y_ertekek[hany][id_al] = stack_y_ertekek[hany - 1][id_al] + osszeg;
                            }else {
                                stack_y_ertekek[hany][id_al] = inval_value;
                            }
                        }else {
                            stack_y_ertekek[hany][id_al] = osszeg;
                        }
                        if ( stack_y_ertekek[hany][id_al] != inval_value ) {
                            if ( stack_y_ertekek[hany][id_al] > val_max ) {
                                val_max = stack_y_ertekek[hany][id_al];
                            }
                        }
                    }else {
                        stack_y_ertekek[hany][id_al] = inval_value;
                    }
                }else {
                    stack_y_ertekek[hany][id_al] = inval_value;
                }
            }
            break;
        case 7:
            val_min = 0f;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        osszeg += usearray[j];
                    }
                    y_ertekek[i] = osszeg;
                    if ( y_ertekek[i] > val_max ) {
                        val_max = y_ertekek[i];
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 8:
            val_min = 0f;
            for ( int i = 0; i < stack_ys; ++i ) {
                int hany = i % stack_count, id_al = i / stack_count;
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        osszeg += usearray[j];
                    }
                    if ( hany != 0 ) {
                        if ( stack_y_ertekek[hany - 1][id_al] != inval_value ) {
                            stack_y_ertekek[hany][id_al] = stack_y_ertekek[hany - 1][id_al] + osszeg;
                        }else {
                            stack_y_ertekek[hany][id_al] = inval_value;
                        }
                    }else {
                        stack_y_ertekek[hany][id_al] = osszeg;
                    }
                    if ( stack_y_ertekek[hany][id_al] != inval_value ) {
                        if ( stack_y_ertekek[hany][id_al] > val_max ) {
                            val_max = stack_y_ertekek[hany][id_al];
                        }
                    }
                }else {
                    stack_y_ertekek[hany][id_al] = inval_value;
                }
            }
            break;
        case 9:
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        y_ertekek[i] = osszeg;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
    }
    
    String stform;
    if ( c_kiv_attr == 12 ) {
        stform = "%.0f";
    }else {
        stform = "%.1f";
    }
    
    int terv_max = (int)val_max, terv_min = (int)val_min;
    if ( (float)terv_max < val_max ) {
        ++terv_max;
    }
    if ( (float)terv_min > val_min ) {
        --terv_min;
    }
    int jelenmax = (int)Float.parseFloat(current_instance.chart_f_y_labels[10].replace(',', '.'));
    if ( type != 0 && terv_max < jelenmax) {
        terv_max = jelenmax;
    }
    int jelenmin = (int)Float.parseFloat(current_instance.chart_f_y_labels[0].replace(',', '.'));
    if ( type != 0 && terv_min > jelenmin ) {
        terv_min = jelenmin;
    }
    float y_inter = (terv_max - terv_min), nov = y_inter / 10;
    for ( int i = 0; i < 11; ++i ) {
        current_instance.chart_f_y_labels[i] = String.format(stform, terv_min + i * nov);
    }
    noStroke();
    fill(bc_color);
    rect(navbar_f_cont_bx + 1, fo_f_lehet_by + 1, chart_y_labels_xr, navbar_f_cont_by - 1);
    fill(0);
    textSize(13);
    textAlign(RIGHT, CENTER);
    for ( int i = 0; i < 11; ++i ) {
        text(current_instance.chart_f_y_labels[i], chart_y_labels_xr, chart_f_y_labels_y[i]);
    }
    textAlign(CENTER, CENTER);
    if ( y_inter == 0f ) {
        y_inter = 1f;
    }
    
    if ( c_kiv_muv != 6 && c_kiv_muv != 8 ) {
        for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
            if ( y_ertekek[i] != inval_value ) {
                y_ertekek[i] = chart_f_y_axis_yb - ((y_ertekek[i] - terv_min) / y_inter) * chart_y_axis_len;
            }
        }
    }else {
        for ( int zz = 0; zz < stack_count; ++zz ) {
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( stack_y_ertekek[zz][i] != inval_value ) {
                    stack_y_ertekek[zz][i] = chart_f_y_axis_yb - ((stack_y_ertekek[zz][i] - terv_min) / y_inter) * chart_y_axis_len;
                }
            }
        }
    }
    
    // modositok vizsgalata
    if ( type == 0 ) {
        float many_y = 0f, inter_y = 0f, devhigh_y = 0f, devlow_y = 0f;
        // many years average
        if ( current_instance.fo_f_is_many_bal && c_kiv_muv != 6 && c_kiv_muv != 8 ) {
            
        }
        // interval average
        if ( current_instance.fo_f_is_inter_bal && c_kiv_muv != 6 && c_kiv_muv != 8 ) {
            double ksum = 0; int koc = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( y_ertekek[i] != inval_value ) {
                    ksum += y_ertekek[i];
                    ++koc;
                }
            }
            float kertek = -8888f;
            if ( koc != 0 ) {
                kertek = (float)(ksum / koc);
            }
            if ( kertek != -8888f ) {
                stroke(50f);
                strokeWeight(4);
                line(chart_y_axis_x, kertek, chart_x_axis_xr, kertek);
            }
        }
        // standard deviation
        if ( current_instance.fo_f_is_dev && c_kiv_muv != 6 && c_kiv_muv != 8 ) {
            double ksum = 0; int koc = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( y_ertekek[i] != inval_value ) {
                    ksum += y_ertekek[i];
                    ++koc;
                }
            }
            float kertek = -8888f;
            if ( koc != 0 ) {
                kertek = (float)(ksum / koc);
            }
            if ( kertek != -8888f && koc > 2 ) {
                stroke(50f);
                strokeWeight(4);
                line(chart_y_axis_x, kertek, chart_x_axis_xr, kertek);
                ksum = 0;
                for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                    if ( y_ertekek[i] != inval_value ) {
                        ksum += (y_ertekek[i] - kertek) * (y_ertekek[i] - kertek);
                    }
                }
                devhigh_y = (float)Math.sqrt(ksum / koc);
                devlow_y = kertek - devhigh_y;
                devhigh_y += kertek;
                stroke(200, 200, 0);
                strokeWeight(4);
                line(chart_y_axis_x, devhigh_y, chart_x_axis_xr, devhigh_y);
                line(chart_y_axis_x, devlow_y, chart_x_axis_xr, devlow_y);
            }
        }
    }
    
    // kirajzolas
    float x_koz = chart_x_axis_len / (current_instance.kir_f_agg_count - 1);
    if ( c_kiv_muv < 4 || c_kiv_muv == 5 || c_kiv_muv == 9 ) {
        // println("rajzolas");
        stroke(szin_r, szin_g, szin_b);
        strokeWeight(3);
        int cikv = current_instance.kir_f_agg_count - 1;
        for ( int i = 0; i < cikv; ++i ) {
            if ( y_ertekek[i] != inval_value && y_ertekek[i + 1] != inval_value ) {
                line(chart_y_axis_x + i * x_koz, y_ertekek[i], chart_y_axis_x + (i + 1) * x_koz, y_ertekek[i + 1] );
            }else if ( y_ertekek[i] != inval_value ) {
                point(chart_y_axis_x + i * x_koz, y_ertekek[i]);
            }else if ( y_ertekek[i + 1] != inval_value ) {
                point(chart_y_axis_x + (i + 1) * x_koz, y_ertekek[i + 1]);
            }
        }
    }else if ( c_kiv_muv == 7 && current_instance.kir_f_agg_count > 1 ) {
        int elso_x_i = 0, ut_x_i = 0;
        for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
            if ( y_ertekek[i] != inval_value ) {
                elso_x_i = i;
                break;
            }
        }
        for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
            if ( y_ertekek[i] != inval_value ) {
                ut_x_i = i;
                break;
            }
        }
        noStroke();
        fill(0f, 0f, 128f, 120f);
        beginShape();
        vertex(chart_y_axis_x + ut_x_i * x_koz, chart_f_y_axis_yb);
        vertex(chart_y_axis_x + elso_x_i * x_koz, chart_f_y_axis_yb);
        for ( int i = elso_x_i; i <= ut_x_i; ++i ) {
            if ( y_ertekek[i] != inval_value ) {
                vertex(chart_y_axis_x + i * x_koz, y_ertekek[i] );
            }
        }
        endShape(CLOSE);
        stroke(szin_r, szin_g, szin_b);
        strokeWeight(3);
        for ( int i = elso_x_i; i < ut_x_i; ++i ) {
            if ( y_ertekek[i] != inval_value && y_ertekek[i + 1] != inval_value ) {
                line(chart_y_axis_x + i * x_koz, y_ertekek[i], chart_y_axis_x + (i + 1) * x_koz, y_ertekek[i + 1] );
            }
        }
    }else if( current_instance.kir_f_agg_count > 1 ) {
        noStroke();
        fill(bc_color);
        rect(chart_stack_jm_xs[0], fo_f_attr_by, chart_stack_jm_xs[12], lenyil_f_rect_by - 0.002 * win_height);
        stroke(0);
        strokeWeight(1);
        for ( int i = 0; i < 12; ++i ) {
            int zi = (i % 7) * 3;
            fill(kiv_szinek[zi], kiv_szinek[zi + 1], kiv_szinek[zi + 2], 120f);
            rect(chart_stack_jm_xs[i], fo_f_attr_by, chart_stack_jm_xs[i + 1], lenyil_f_rect_by - 0.002 * win_height);
        }
        fill(0);
        textSize(14);
        for ( int i = 0; i < 12; ++i ) {
            text(chart_stack_jm_ss[i], (chart_stack_jm_xs[i] + chart_stack_jm_xs[i + 1]) / 2, fo_f_lehet_text_y);
        }
        int elso_x_i = 0, ut_x_i = -1;
        for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
            if ( stack_y_ertekek[0][i] != -1 ) {
                elso_x_i = i;
                break;
            }
        }
        for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
            if ( stack_y_ertekek[0][i] != -1 ) {
                ut_x_i = i;
                break;
            }
        }
        noStroke();
        fill(kiv_szinek[0], kiv_szinek[1], kiv_szinek[2], 120f);
        beginShape();
        vertex(chart_y_axis_x + ut_x_i * x_koz, chart_f_y_axis_yb);
        vertex(chart_y_axis_x + elso_x_i * x_koz, chart_f_y_axis_yb);
        for ( int i = elso_x_i; i <= ut_x_i; ++i ) {
            if ( stack_y_ertekek[0][i] != -1 ) {
                vertex(chart_y_axis_x + i * x_koz, stack_y_ertekek[0][i] );
            }
        }
        endShape(CLOSE);
        for ( int j = 1; j < stack_count; ++j ) {
            elso_x_i = 0; ut_x_i = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( stack_y_ertekek[j][i] != -1 ) {
                    elso_x_i = i;
                    break;
                }
            }
            for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( stack_y_ertekek[j][i] != -1 ) {
                    ut_x_i = i;
                    break;
                }
            }
            int aszin = 3 * (j % 7);
            fill(kiv_szinek[aszin], kiv_szinek[aszin + 1], kiv_szinek[aszin + 2], 120f);
            beginShape();
            for ( int i = ut_x_i; i >= elso_x_i; --i ) {
                if ( stack_y_ertekek[j - 1][i] != -1 ) {
                    vertex(chart_y_axis_x + i * x_koz, stack_y_ertekek[j - 1][i] );
                }
            }
            for ( int i = elso_x_i; i <= ut_x_i; ++i ) {
                if ( stack_y_ertekek[j][i] != -1 ) {
                    vertex(chart_y_axis_x + i * x_koz, stack_y_ertekek[j][i] );
                }
            }
            endShape(CLOSE);
        }
    }
}

void Kir_chart_a(int type, int curid, float szin_r, float szin_g, float szin_b ) {
    int c_kiv_city = 0, c_kiv_attr = 0, c_kiv_muv = 0;
    // kezdeti parameterek meghatarozasa
    if ( type == 1 ) {
        c_kiv_city = curid;
        c_kiv_attr = current_instance.fo_a_attr_min_idx;
        c_kiv_muv = current_instance.fo_a_muv_min_idx;
    }else if ( type == 2 ) {
        c_kiv_attr = curid;
        for ( int i = 0; i < 7; ++i ) {
            if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                c_kiv_city = current_instance.dia_a_kiv_cities_idx[i];
                break;
            }
        }
        c_kiv_muv = 0;
    }else if ( type == 3 ) {
        c_kiv_muv = curid;
        for ( int i = 0; i < 7; ++i ) {
            if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                c_kiv_city = current_instance.dia_a_kiv_cities_idx[i];
                break;
            }
        }
        c_kiv_attr = current_instance.fo_a_attr_min_idx;
    }else {
        for ( int i = 0; i < 7; ++i ) {
            if ( current_instance.dia_a_kiv_cities_idx[i] != -1 ) {
                c_kiv_city = current_instance.dia_a_kiv_cities_idx[i];
                break;
            }
        }
        c_kiv_attr = current_instance.fo_a_attr_min_idx;
        c_kiv_muv = current_instance.fo_a_muv_min_idx;
    }
    if ( c_kiv_muv == 4 ) {
        return;
    }
    
    // rajzolando ertekek szamitasa
    float[] y_ertekek = new float[current_instance.kir_a_agg_count];
    float[][] stack_y_ertekek = new float[12][];
    int stack_count = 0, inval_value = -1;
    float[] usearray = new float[3];
    switch ( c_kiv_attr ) {
        case 0:
            usearray = a_temp[c_kiv_city];
            inval_value = 99;
            break;
        case 1:
            usearray = a_tmax[c_kiv_city];
            inval_value = 99;
            break;
        case 2:
            usearray = a_tmin[c_kiv_city];
            inval_value = 99;
            break;
        case 3:
            usearray = a_dewp[c_kiv_city];
            inval_value = 99;
            break;
        case 4:
            usearray = a_wdsp[c_kiv_city];
            inval_value = -1;
            break;
        case 5:
            usearray = a_mxsw[c_kiv_city];
            inval_value = -1;
            break;
        case 6:
            usearray = a_gust[c_kiv_city];
            inval_value = -1;
            break;
        case 7:
            usearray = a_prcp[c_kiv_city];
            inval_value = -1;
            break;
        case 8:
            usearray = a_sndp[c_kiv_city];
            inval_value = -1;
            break;
        case 9:
            usearray = a_slp[c_kiv_city];
            inval_value = -1;
            break;
        case 10:
            usearray = a_stp[c_kiv_city];
            inval_value = -1;
            break;
        case 11:
            usearray = a_visib[c_kiv_city];
            inval_value = -1;
            break;
        case 12:
            usearray = a_frshtt[c_kiv_city];
    }
    int[] aggs_k_idx = new int[576], aggs_v_idx = new int[576];
    LocalDate use_start_date = local_start_dates[c_kiv_city];
    LocalDate use_end_date = local_end_dates[c_kiv_city];
    LocalDate agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1), agg_end_date = agg_start_date;
    boolean jel = false;
    int swagg = 0, stack_ys = 0;
    if ( c_kiv_muv != 6 && c_kiv_muv != 8 ) {
        swagg = current_instance.fo_a_agg_kiv;
        stack_ys = current_instance.kir_a_agg_count;
    }else {
        swagg = 5;
        stack_count = 12;
        stack_ys = current_instance.kir_a_agg_count * stack_count;
        for ( int i = 0; i < stack_count; ++i ) {
            stack_y_ertekek[i] = new float[current_instance.kir_a_agg_count];
        }
    }
    switch ( swagg ) {
        case 0:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, current_instance.fo_a_al_k_month, current_instance.fo_a_al_k_day);
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_k_month, current_instance.fo_a_al_k_day);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_v_month, current_instance.fo_a_al_v_day);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + i, current_instance.fo_a_al_v_month, current_instance.fo_a_al_v_day);
                        if ( agg_end_date.isAfter(use_end_date) ) {
                            break;
                        }
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_v_month, current_instance.fo_a_al_v_day);
                        jel = true;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_k_month, current_instance.fo_a_al_k_day);
                }
            }
            break;
        case 1:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 3, 20);
            int[] seas_mons = { 3, 6, 9, 12 }, seas_days = { 20, 21, 22, 21 };
            int seas_count = 0, sev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++seas_count;
                        if ( seas_count == 4 ) {
                            seas_count = 0;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                        if ( seas_count == 3 ) {
                            ++sev_count;
                        }
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++seas_count;
                    if ( seas_count == 4 ) {
                        seas_count = 0;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                    if ( seas_count == 3 ) {
                        ++sev_count;
                    }
                    agg_end_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                }
            }
            break;
        case 2:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon6_k_mons = { 1, 7 };
            int[] mon6_v_mons = { 6, 12 }, mon6_v_days = { 30, 31 };
            int mon6_count = 0, mon6_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon6_count;
                        if ( mon6_count == 2 ) {
                            mon6_count = 0;
                            ++mon6_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon6_count;
                    if ( mon6_count == 2 ) {
                        mon6_count = 0;
                        ++mon6_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                }
            }
            break;
        case 3:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon4_k_mons = { 1, 5, 9 };
            int[] mon4_v_mons = { 4, 8, 12 }, mon4_v_days = { 30, 31, 31 };
            int mon4_count = 0, mon4_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon4_count;
                        if ( mon4_count == 3 ) {
                            mon4_count = 0;
                            ++mon4_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon4_count;
                    if ( mon4_count == 3 ) {
                        mon4_count = 0;
                        ++mon4_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                }
            }
            break;
        case 4:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon2_k_mons = { 1, 3, 5, 7, 9, 11 };
            int[] mon2_v_mons = { 2, 4, 6, 8, 10, 12 }, mon2_v_days = { 28, 30, 30, 31, 31, 31 };
            int mon2_count = 0, mon2_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon2_count;
                        if ( mon2_count == 6 ) {
                            mon2_count = 0;
                            ++mon2_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                        if ( mon2_count == 0 && (current_instance.chart_a_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon2_count == 0 && (current_instance.chart_a_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon2_count;
                    if ( mon2_count == 6 ) {
                        mon2_count = 0;
                        ++mon2_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                    if ( mon2_count == 0 && (current_instance.chart_a_start_year + mon2_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                    }
                }
            }
            break;
        case 5:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon_mons = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
            int[] mon_v_days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
            int mon_count = 0, mon_ev_count = 0;
            for ( int i = 0; i < stack_ys; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon_count;
                        if ( mon_count == 12 ) {
                            mon_count = 0;
                            ++mon_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 1);
                        if ( mon_count == 1 && (current_instance.chart_a_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon_count == 1 && (current_instance.chart_a_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon_count;
                    if ( mon_count == 12 ) {
                        mon_count = 0;
                        ++mon_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 1);
                    if ( mon_count == 1 && (current_instance.chart_a_start_year + mon_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                    }
                }
            }
            break;
        case 6:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int week2_count = 14, week2_year = current_instance.chart_a_start_year;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                        if ( tmpdate.getYear() > week2_year ) {
                            ++week2_year;
                            agg_start_date = LocalDate.of(week2_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(13);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(13);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(13);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                    if ( tmpdate.getYear() > week2_year ) {
                        ++week2_year;
                        agg_start_date = LocalDate.of(week2_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(13);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(13);
                    }
                }
            }
            break;
        case 7:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int week_count = 7, week_year = current_instance.chart_a_start_year;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week_count);
                        if ( tmpdate.getYear() > week_year ) {
                            ++week_year;
                            agg_start_date = LocalDate.of(week_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(6);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(6);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(6);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week_count);
                    if ( tmpdate.getYear() > week_year ) {
                        ++week_year;
                        agg_start_date = LocalDate.of(week_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(6);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(6);
                    }
                }
            }
            break;
        case 8:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_start_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        agg_start_date = agg_start_date.plusDays(1);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        jel = true;
                    }
                    agg_start_date = agg_start_date.plusDays(1);
                }
            }
    }
    
    // y ertekek szamolasa
    float val_min = 9999f, val_max = -9999f;
    switch ( c_kiv_muv ) {
        case 0:
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        y_ertekek[i] = (float)(osszeg / oc);
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 1:
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float locmax = -9999f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmax != -9999f ) {
                        y_ertekek[i] = locmax;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 2:
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float locmin = 9999f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        y_ertekek[i] = locmin;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 3:
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float locmin = 9999f, locmax = -9999f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        y_ertekek[i] = locmax - locmin;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 5:
            float[] avtemp = a_temp[c_kiv_city];
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    double t_osszeg = 0; int t_oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                        if ( avtemp[j] != inval_value ) {
                            t_osszeg += avtemp[j];
                            ++t_oc;
                        }
                    }
                    if ( oc != 0 && t_oc != 0 ) {
                        y_ertekek[i] = (float)(t_osszeg / t_oc) - (float)(osszeg / oc);
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 6:
            val_min = 0f;
            for ( int i = 0; i < stack_ys; ++i ) {
                int hany = i % stack_count, id_al = i / stack_count;
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        if ( hany != 0 ) {
                            if ( stack_y_ertekek[hany - 1][id_al] != inval_value ) {
                                stack_y_ertekek[hany][id_al] = stack_y_ertekek[hany - 1][id_al] + osszeg;
                            }else {
                                stack_y_ertekek[hany][id_al] = inval_value;
                            }
                        }else {
                            stack_y_ertekek[hany][id_al] = osszeg;
                        }
                        if ( stack_y_ertekek[hany][id_al] != inval_value ) {
                            if ( stack_y_ertekek[hany][id_al] > val_max ) {
                                val_max = stack_y_ertekek[hany][id_al];
                            }
                        }
                    }else {
                        stack_y_ertekek[hany][id_al] = inval_value;
                    }
                }else {
                    stack_y_ertekek[hany][id_al] = inval_value;
                }
            }
            break;
        case 7:
            val_min = 0f;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        osszeg += usearray[j];
                    }
                    y_ertekek[i] = osszeg;
                    if ( y_ertekek[i] > val_max ) {
                        val_max = y_ertekek[i];
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
            break;
        case 8:
            val_min = 0f;
            for ( int i = 0; i < stack_ys; ++i ) {
                int hany = i % stack_count, id_al = i / stack_count;
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        osszeg += usearray[j];
                    }
                    if ( hany != 0 ) {
                        if ( stack_y_ertekek[hany - 1][id_al] != inval_value ) {
                            stack_y_ertekek[hany][id_al] = stack_y_ertekek[hany - 1][id_al] + osszeg;
                        }else {
                            stack_y_ertekek[hany][id_al] = inval_value;
                        }
                    }else {
                        stack_y_ertekek[hany][id_al] = osszeg;
                    }
                    if ( stack_y_ertekek[hany][id_al] != inval_value ) {
                        if ( stack_y_ertekek[hany][id_al] > val_max ) {
                            val_max = stack_y_ertekek[hany][id_al];
                        }
                    }
                }else {
                    stack_y_ertekek[hany][id_al] = inval_value;
                }
            }
            break;
        case 9:
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[i] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[i]; j <= aggs_v_idx[i]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        y_ertekek[i] = osszeg;
                        if ( y_ertekek[i] > val_max ) {
                            val_max = y_ertekek[i];
                        }
                        if ( y_ertekek[i] < val_min ) {
                            val_min = y_ertekek[i];
                        }
                    }else {
                        y_ertekek[i] = inval_value;
                    }
                }else {
                    y_ertekek[i] = inval_value;
                }
            }
    }
    
    String stform;
    if ( c_kiv_attr == 12 ) {
        stform = "%.0f";
    }else {
        stform = "%.1f";
    }
    
    int terv_max = (int)val_max, terv_min = (int)val_min;
    if ( (float)terv_max < val_max ) {
        ++terv_max;
    }
    if ( (float)terv_min > val_min ) {
        --terv_min;
    }
    int jelenmax = (int)Float.parseFloat(current_instance.chart_a_y_labels[10].replace(',', '.'));
    if ( type != 0 && terv_max < jelenmax) {
        terv_max = jelenmax;
    }
    int jelenmin = (int)Float.parseFloat(current_instance.chart_a_y_labels[0].replace(',', '.'));
    if ( type != 0 && terv_min > jelenmin ) {
        terv_min = jelenmin;
    }
    float y_inter = (terv_max - terv_min), nov = y_inter / 10;
    for ( int i = 0; i < 11; ++i ) {
        current_instance.chart_a_y_labels[i] = String.format(stform, terv_min + i * nov);
    }
    noStroke();
    fill(bc_color);
    rect(navbar_a_cont_bx + 1, fo_a_lehet_by + 1, chart_y_labels_xr, navbar_a_cont_by - 1);
    fill(0);
    textSize(13);
    textAlign(RIGHT, CENTER);
    for ( int i = 0; i < 11; ++i ) {
        text(current_instance.chart_a_y_labels[i], chart_y_labels_xr, chart_a_y_labels_y[i]);
    }
    textAlign(CENTER, CENTER);
    if ( y_inter == 0f ) {
        y_inter = 1f;
    }
    
    if ( c_kiv_muv != 6 && c_kiv_muv != 8 ) {
        for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
            if ( y_ertekek[i] != inval_value ) {
                y_ertekek[i] = chart_a_y_axis_yb - ((y_ertekek[i] - terv_min) / y_inter) * chart_y_axis_len;
            }
        }
    }else {
        for ( int zz = 0; zz < stack_count; ++zz ) {
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( stack_y_ertekek[zz][i] != inval_value ) {
                    stack_y_ertekek[zz][i] = chart_a_y_axis_yb - ((stack_y_ertekek[zz][i] - terv_min) / y_inter) * chart_y_axis_len;
                }
            }
        }
    }
    
    // modositok vizsgalata
    if ( type == 0 ) {
        float many_y = 0f, inter_y = 0f, devhigh_y = 0f, devlow_y = 0f;
        // many years average
        if ( current_instance.fo_a_is_many_bal && c_kiv_muv != 6 && c_kiv_muv != 8 ) {
            
        }
        // interval average
        if ( current_instance.fo_a_is_inter_bal && c_kiv_muv != 6 && c_kiv_muv != 8 ) {
            double ksum = 0; int koc = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( y_ertekek[i] != inval_value ) {
                    ksum += y_ertekek[i];
                    ++koc;
                }
            }
            float kertek = -8888f;
            if ( koc != 0 ) {
                kertek = (float)(ksum / koc);
            }
            if ( kertek != -8888f ) {
                stroke(50f);
                strokeWeight(4);
                line(chart_y_axis_x, kertek, chart_x_axis_xr, kertek);
            }
        }
        // standard deviation
        if ( current_instance.fo_a_is_dev && c_kiv_muv != 6 && c_kiv_muv != 8 ) {
            double ksum = 0; int koc = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( y_ertekek[i] != inval_value ) {
                    ksum += y_ertekek[i];
                    ++koc;
                }
            }
            float kertek = -8888f;
            if ( koc != 0 ) {
                kertek = (float)(ksum / koc);
            }
            if ( kertek != -8888f && koc > 2 ) {
                stroke(50f);
                strokeWeight(4);
                line(chart_y_axis_x, kertek, chart_x_axis_xr, kertek);
                ksum = 0;
                for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                    if ( y_ertekek[i] != inval_value ) {
                        ksum += (y_ertekek[i] - kertek) * (y_ertekek[i] - kertek);
                    }
                }
                devhigh_y = (float)Math.sqrt(ksum / koc);
                devlow_y = kertek - devhigh_y;
                devhigh_y += kertek;
                stroke(200, 200, 0);
                strokeWeight(4);
                line(chart_y_axis_x, devhigh_y, chart_x_axis_xr, devhigh_y);
                line(chart_y_axis_x, devlow_y, chart_x_axis_xr, devlow_y);
            }
        }
    }
    
    // kirajzolas
    float x_koz = chart_x_axis_len / (current_instance.kir_a_agg_count - 1);
    if ( c_kiv_muv < 4 || c_kiv_muv == 5 || c_kiv_muv == 9 ) {
        // println("rajzolas");
        stroke(szin_r, szin_g, szin_b);
        strokeWeight(3);
        int cikv = current_instance.kir_a_agg_count - 1;
        for ( int i = 0; i < cikv; ++i ) {
            if ( y_ertekek[i] != inval_value && y_ertekek[i + 1] != inval_value ) {
                line(chart_y_axis_x + i * x_koz, y_ertekek[i], chart_y_axis_x + (i + 1) * x_koz, y_ertekek[i + 1] );
            }else if ( y_ertekek[i] != inval_value ) {
                point(chart_y_axis_x + i * x_koz, y_ertekek[i]);
            }else if ( y_ertekek[i + 1] != inval_value ) {
                point(chart_y_axis_x + (i + 1) * x_koz, y_ertekek[i + 1]);
            }
        }
    }else if ( c_kiv_muv == 7 && current_instance.kir_a_agg_count > 1 ) {
        int elso_x_i = 0, ut_x_i = 0;
        for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
            if ( y_ertekek[i] != inval_value ) {
                elso_x_i = i;
                break;
            }
        }
        for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
            if ( y_ertekek[i] != inval_value ) {
                ut_x_i = i;
                break;
            }
        }
        noStroke();
        fill(0f, 0f, 128f, 120f);
        beginShape();
        vertex(chart_y_axis_x + ut_x_i * x_koz, chart_a_y_axis_yb);
        vertex(chart_y_axis_x + elso_x_i * x_koz, chart_a_y_axis_yb);
        for ( int i = elso_x_i; i <= ut_x_i; ++i ) {
            if ( y_ertekek[i] != inval_value ) {
                vertex(chart_y_axis_x + i * x_koz, y_ertekek[i] );
            }
        }
        endShape(CLOSE);
        stroke(szin_r, szin_g, szin_b);
        strokeWeight(3);
        for ( int i = elso_x_i; i < ut_x_i; ++i ) {
            if ( y_ertekek[i] != inval_value && y_ertekek[i + 1] != inval_value ) {
                line(chart_y_axis_x + i * x_koz, y_ertekek[i], chart_y_axis_x + (i + 1) * x_koz, y_ertekek[i + 1] );
            }
        }
    }else if( current_instance.kir_a_agg_count > 1 ) {
        noStroke();
        fill(bc_color);
        rect(chart_stack_jm_xs[0], fo_a_attr_by, chart_stack_jm_xs[12], lenyil_a_rect_by - 0.002 * win_height);
        stroke(0);
        strokeWeight(1);
        for ( int i = 0; i < 12; ++i ) {
            int zi = (i % 7) * 3;
            fill(kiv_szinek[zi], kiv_szinek[zi + 1], kiv_szinek[zi + 2], 120f);
            rect(chart_stack_jm_xs[i], fo_a_attr_by, chart_stack_jm_xs[i + 1], lenyil_a_rect_by - 0.002 * win_height);
        }
        fill(0);
        textSize(14);
        for ( int i = 0; i < 12; ++i ) {
            text(chart_stack_jm_ss[i], (chart_stack_jm_xs[i] + chart_stack_jm_xs[i + 1]) / 2, fo_a_lehet_text_y);
        }
        int elso_x_i = 0, ut_x_i = -1;
        for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
            if ( stack_y_ertekek[0][i] != -1 ) {
                elso_x_i = i;
                break;
            }
        }
        for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
            if ( stack_y_ertekek[0][i] != -1 ) {
                ut_x_i = i;
                break;
            }
        }
        noStroke();
        fill(kiv_szinek[0], kiv_szinek[1], kiv_szinek[2], 120f);
        beginShape();
        vertex(chart_y_axis_x + ut_x_i * x_koz, chart_a_y_axis_yb);
        vertex(chart_y_axis_x + elso_x_i * x_koz, chart_a_y_axis_yb);
        for ( int i = elso_x_i; i <= ut_x_i; ++i ) {
            if ( stack_y_ertekek[0][i] != -1 ) {
                vertex(chart_y_axis_x + i * x_koz, stack_y_ertekek[0][i] );
            }
        }
        endShape(CLOSE);
        for ( int j = 1; j < stack_count; ++j ) {
            elso_x_i = 0; ut_x_i = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( stack_y_ertekek[j][i] != -1 ) {
                    elso_x_i = i;
                    break;
                }
            }
            for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( stack_y_ertekek[j][i] != -1 ) {
                    ut_x_i = i;
                    break;
                }
            }
            int aszin = 3 * (j % 7);
            fill(kiv_szinek[aszin], kiv_szinek[aszin + 1], kiv_szinek[aszin + 2], 120f);
            beginShape();
            for ( int i = ut_x_i; i >= elso_x_i; --i ) {
                if ( stack_y_ertekek[j - 1][i] != -1 ) {
                    vertex(chart_y_axis_x + i * x_koz, stack_y_ertekek[j - 1][i] );
                }
            }
            for ( int i = elso_x_i; i <= ut_x_i; ++i ) {
                if ( stack_y_ertekek[j][i] != -1 ) {
                    vertex(chart_y_axis_x + i * x_koz, stack_y_ertekek[j][i] );
                }
            }
            endShape(CLOSE);
        }
    }
}

void Heatmap_f() {
    int c_kiv_attr = 0, c_kiv_muv = 0;
    c_kiv_attr = current_instance.fo_f_attr_min_idx;
    c_kiv_muv = current_instance.fo_f_muv_min_idx;
    float[] y_ertekek = new float[city_count];
    float val_min = 9999f, val_max = -9999f;
    
    int inval_value = -1;
    if ( c_kiv_attr < 4 ) {
        inval_value = 99;
    }
    
    for ( int uu = 0; uu < city_count; ++uu ) {
    int[] aggs_k_idx = new int[576], aggs_v_idx = new int[576];
    LocalDate use_start_date = local_start_dates[uu];
    LocalDate use_end_date = local_end_dates[uu];
    LocalDate agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1), agg_end_date = agg_start_date;
    boolean jel = false;
    switch ( current_instance.fo_f_agg_kiv ) {
        case 0:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, current_instance.fo_f_al_k_month, current_instance.fo_f_al_k_day);
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_k_month, current_instance.fo_f_al_k_day);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_v_month, current_instance.fo_f_al_v_day);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + i, current_instance.fo_f_al_v_month, current_instance.fo_f_al_v_day);
                        if ( agg_end_date.isAfter(use_end_date) ) {
                            break;
                        }
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_v_month, current_instance.fo_f_al_v_day);
                        jel = true;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + i + 1, current_instance.fo_f_al_k_month, current_instance.fo_f_al_k_day);
                }
            }
            break;
        case 1:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 3, 20);
            int[] seas_mons = { 3, 6, 9, 12 }, seas_days = { 20, 21, 22, 21 };
            int seas_count = 0, sev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++seas_count;
                        if ( seas_count == 4 ) {
                            seas_count = 0;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                        if ( seas_count == 3 ) {
                            ++sev_count;
                        }
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++seas_count;
                    if ( seas_count == 4 ) {
                        seas_count = 0;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                    if ( seas_count == 3 ) {
                        ++sev_count;
                    }
                    agg_end_date = LocalDate.of(current_instance.chart_f_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                }
            }
            break;
        case 2:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon6_k_mons = { 1, 7 };
            int[] mon6_v_mons = { 6, 12 }, mon6_v_days = { 30, 31 };
            int mon6_count = 0, mon6_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon6_count;
                        if ( mon6_count == 2 ) {
                            mon6_count = 0;
                            ++mon6_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon6_count;
                    if ( mon6_count == 2 ) {
                        mon6_count = 0;
                        ++mon6_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                }
            }
            break;
        case 3:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon4_k_mons = { 1, 5, 9 };
            int[] mon4_v_mons = { 4, 8, 12 }, mon4_v_days = { 30, 31, 31 };
            int mon4_count = 0, mon4_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon4_count;
                        if ( mon4_count == 3 ) {
                            mon4_count = 0;
                            ++mon4_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon4_count;
                    if ( mon4_count == 3 ) {
                        mon4_count = 0;
                        ++mon4_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                }
            }
            break;
        case 4:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon2_k_mons = { 1, 3, 5, 7, 9, 11 };
            int[] mon2_v_mons = { 2, 4, 6, 8, 10, 12 }, mon2_v_days = { 28, 30, 30, 31, 31, 31 };
            int mon2_count = 0, mon2_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon2_count;
                        if ( mon2_count == 6 ) {
                            mon2_count = 0;
                            ++mon2_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                        if ( mon2_count == 0 && (current_instance.chart_f_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon2_count == 0 && (current_instance.chart_f_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon2_count;
                    if ( mon2_count == 6 ) {
                        mon2_count = 0;
                        ++mon2_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                    if ( mon2_count == 0 && (current_instance.chart_f_start_year + mon2_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                    }
                }
            }
            break;
        case 5:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int[] mon_mons = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
            int[] mon_v_days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
            int mon_count = 0, mon_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon_count;
                        if ( mon_count == 12 ) {
                            mon_count = 0;
                            ++mon_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 1);
                        if ( mon_count == 1 && (current_instance.chart_f_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon_count == 1 && (current_instance.chart_f_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon_count;
                    if ( mon_count == 12 ) {
                        mon_count = 0;
                        ++mon_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 1);
                    if ( mon_count == 1 && (current_instance.chart_f_start_year + mon_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_f_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                    }
                }
            }
            break;
        case 6:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int week2_count = 14, week2_year = current_instance.chart_f_start_year;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                        if ( tmpdate.getYear() > week2_year ) {
                            ++week2_year;
                            agg_start_date = LocalDate.of(week2_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(13);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(13);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(13);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                    if ( tmpdate.getYear() > week2_year ) {
                        ++week2_year;
                        agg_start_date = LocalDate.of(week2_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(13);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(13);
                    }
                }
            }
            break;
        case 7:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            int week_count = 7, week_year = current_instance.chart_f_start_year;
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week_count);
                        if ( tmpdate.getYear() > week_year ) {
                            ++week_year;
                            agg_start_date = LocalDate.of(week_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(6);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(6);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(6);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week_count);
                    if ( tmpdate.getYear() > week_year ) {
                        ++week_year;
                        agg_start_date = LocalDate.of(week_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(6);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(6);
                    }
                }
            }
            break;
        case 8:
            agg_start_date = LocalDate.of(current_instance.chart_f_start_year, 1, 1);
            for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_start_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        agg_start_date = agg_start_date.plusDays(1);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        jel = true;
                    }
                    agg_start_date = agg_start_date.plusDays(1);
                }
            }
    }
    
    // rajzolando ertekek szamitasa
    float[] usearray = new float[3];
    switch ( c_kiv_attr ) {
        case 0:
            usearray = a_temp[uu];
            break;
        case 1:
            usearray = a_tmax[uu];
            break;
        case 2:
            usearray = a_tmin[uu];
            break;
        case 3:
            usearray = a_dewp[uu];
            break;
        case 4:
            usearray = a_wdsp[uu];
            break;
        case 5:
            usearray = a_mxsw[uu];
            break;
        case 6:
            usearray = a_gust[uu];
            break;
        case 7:
            usearray = a_prcp[uu];
            break;
        case 8:
            usearray = a_sndp[uu];
            break;
        case 9:
            usearray = a_slp[uu];
            break;
        case 10:
            usearray = a_stp[uu];
            break;
        case 11:
            usearray = a_visib[uu];
            break;
        case 12:
            usearray = a_frshtt[uu];
    }
    float kezvalue = inval_value, vegvalue = inval_value;
    
    switch ( c_kiv_muv ) {
        case 0:
            // for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        kezvalue = (float)(osszeg / oc);
                    }
                }
            // }
            // for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_f_agg_count - 1] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[current_instance.kir_f_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_f_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        vegvalue = (float)(osszeg / oc);
                    }
                }
            // }
            break;
        case 1:
            // for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float locmax = -9999f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmax != -9999f ) {
                        kezvalue = locmax;
                    }
                }
            // }
            // for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_f_agg_count - 1] != -1 ) {
                    float locmax = -9999f;
                    for ( int j = aggs_k_idx[current_instance.kir_f_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_f_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmax != -9999f ) {
                        vegvalue = locmax;
                    }
                }
            // }
            break;
        case 2:
            // for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float locmin = 9999f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        kezvalue = locmin;
                    }
                }
            // }
            // for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_f_agg_count - 1] != -1 ) {
                    float locmin = 9999f;
                    for ( int j = aggs_k_idx[current_instance.kir_f_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_f_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        vegvalue = locmin;
                    }
                }
            // }
            break;
        case 3:
            // for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float locmin = 9999f, locmax = -9999f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        kezvalue = locmax - locmin;
                    }
                }
            // }
            // for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_f_agg_count - 1] != -1 ) {
                    float locmin = 9999f, locmax = -9999f;
                    for ( int j = aggs_k_idx[current_instance.kir_f_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_f_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        vegvalue = locmax - locmin;
                    }
                }
            // }
            break;
        case 5:
            float[] avtemp = a_temp[uu];
            // for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    double t_osszeg = 0; int t_oc = 0;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                        if ( avtemp[j] != inval_value ) {
                            t_osszeg += avtemp[j];
                            ++t_oc;
                        }
                    }
                    if ( oc != 0 && t_oc != 0 ) {
                        kezvalue = (float)(t_osszeg / t_oc) - (float)(osszeg / oc);
                    }
                }
            // }
            // for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_f_agg_count - 1] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    double t_osszeg = 0; int t_oc = 0;
                    for ( int j = aggs_k_idx[current_instance.kir_f_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_f_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                        if ( avtemp[j] != inval_value ) {
                            t_osszeg += avtemp[j];
                            ++t_oc;
                        }
                    }
                    if ( oc != 0 && t_oc != 0 ) {
                        vegvalue = (float)(t_osszeg / t_oc) - (float)(osszeg / oc);
                    }
                }
            // }
            break;
        case 7:
            // for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        osszeg += usearray[j];
                    }
                    kezvalue = osszeg;
                }
            // }
            // for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_f_agg_count - 1] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[current_instance.kir_f_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_f_agg_count - 1]; ++j ) {
                        osszeg += usearray[j];
                    }
                    vegvalue = osszeg;
                }
            // }
            break;
        case 9:
            // for ( int i = 0; i < current_instance.kir_f_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        kezvalue = osszeg;
                    }
                }
            // }
            // for ( int i = current_instance.kir_f_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_f_agg_count - 1] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[current_instance.kir_f_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_f_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        vegvalue = osszeg;
                    }
                }
            // }
    }
    if ( vegvalue != inval_value && kezvalue != inval_value ) {
        y_ertekek[uu] = vegvalue - kezvalue;
        if ( y_ertekek[uu] < val_min ) {
            val_min = y_ertekek[uu];
        }
        if ( y_ertekek[uu] > val_max ) {
            val_max = y_ertekek[uu];
        }
    }else {
        y_ertekek[uu] = inval_value;
    }
    }
    
    // println(val_max);
    // println(val_min);
    // for ( int i = 0; i < city_count; ++i ) {
    //     if ( y_ertekek[i] != inval_value ) {
    //         println(y_ertekek[i]);
    //     }else {
    //         println("inv");
    //     }
    // }
    
    float tarkul = val_max - val_min, tarkoz = tarkul / 19f;
    float strkoz = tarkul / 10;
    for ( int i = 0; i < 11; ++i ) {
        current_instance.mav_f_labels[i] = String.format("%.1f", val_min + i * strkoz);
    }
    if ( tarkoz == 0f ) {
        return;
    }
    float[] tarhatars = new float[19];
    for ( int i = 0; i < 19; ++i ) {
        tarhatars[i] = val_min + i * tarkoz;
        // println(tarhatars[i]);
    }
    noStroke();
    for ( int i = 0; i < haromszogek.length; i += 3 ) {
        float ty0 = y_ertekek[heat_city_idx[haromszogek[i]]];
        float ty1 = y_ertekek[heat_city_idx[haromszogek[i + 1]]];
        float ty2 = y_ertekek[heat_city_idx[haromszogek[i + 2]]];
        if ( ty0 == inval_value || ty1 == inval_value || ty2 == inval_value ) {
            continue;
        }
        beginShape();
        int cj = 0;
        for ( int j = 18; j >= 0; --j ) {
            if ( ty0 >= tarhatars[j] ) {
                cj = j;
                break;
            }
        }
        ty0 = (ty0 - tarhatars[cj]) / tarkoz;
        if ( current_instance.mavi_is_magma ) {
            fill(lerpColor(magma[cj], magma[cj + 1], ty0));
        }else {
            fill(lerpColor(viridis[cj], viridis[cj + 1], ty0));
        }
        vertex(draw_x[heat_city_idx[haromszogek[i]]], draw_y[heat_city_idx[haromszogek[i]]]);
        cj = 0;
        for ( int j = 18; j >= 0; --j ) {
            if ( ty1 >= tarhatars[j] ) {
                cj = j;
                break;
            }
        }
        ty1 = (ty1 - tarhatars[cj]) / tarkoz;
        if ( current_instance.mavi_is_magma ) {
            fill(lerpColor(magma[cj], magma[cj + 1], ty1));
        }else {
            fill(lerpColor(viridis[cj], viridis[cj + 1], ty1));
        }
        vertex(draw_x[heat_city_idx[haromszogek[i + 1]]], draw_y[heat_city_idx[haromszogek[i + 1]]]);
        cj = 0;
        for ( int j = 18; j >= 0; --j ) {
            if ( ty2 >= tarhatars[j] ) {
                cj = j;
                break;
            }
        }
        ty2 = (ty2 - tarhatars[cj]) / tarkoz;
        if ( current_instance.mavi_is_magma ) {
            fill(lerpColor(magma[cj], magma[cj + 1], ty2));
        }else {
            fill(lerpColor(viridis[cj], viridis[cj + 1], ty2));
        }
        vertex(draw_x[heat_city_idx[haromszogek[i + 2]]], draw_y[heat_city_idx[haromszogek[i + 2]]]);
        endShape(CLOSE);
    }
}

void Heatmap_a() {
    int c_kiv_attr = 0, c_kiv_muv = 0;
    c_kiv_attr = current_instance.fo_a_attr_min_idx;
    c_kiv_muv = current_instance.fo_a_muv_min_idx;
    float[] y_ertekek = new float[city_count];
    float val_min = 9999f, val_max = -9999f;
    
    int inval_value = -1;
    if ( c_kiv_attr < 4 ) {
        inval_value = 99;
    }
    
    for ( int uu = 0; uu < city_count; ++uu ) {
    int[] aggs_k_idx = new int[576], aggs_v_idx = new int[576];
    LocalDate use_start_date = local_start_dates[uu];
    LocalDate use_end_date = local_end_dates[uu];
    LocalDate agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1), agg_end_date = agg_start_date;
    boolean jel = false;
    switch ( current_instance.fo_a_agg_kiv ) {
        case 0:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, current_instance.fo_a_al_k_month, current_instance.fo_a_al_k_day);
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_k_month, current_instance.fo_a_al_k_day);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_v_month, current_instance.fo_a_al_v_day);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + i, current_instance.fo_a_al_v_month, current_instance.fo_a_al_v_day);
                        if ( agg_end_date.isAfter(use_end_date) ) {
                            break;
                        }
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_v_month, current_instance.fo_a_al_v_day);
                        jel = true;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + i + 1, current_instance.fo_a_al_k_month, current_instance.fo_a_al_k_day);
                }
            }
            break;
        case 1:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 3, 20);
            int[] seas_mons = { 3, 6, 9, 12 }, seas_days = { 20, 21, 22, 21 };
            int seas_count = 0, sev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++seas_count;
                        if ( seas_count == 4 ) {
                            seas_count = 0;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                        if ( seas_count == 3 ) {
                            ++sev_count;
                        }
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++seas_count;
                    if ( seas_count == 4 ) {
                        seas_count = 0;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[seas_count], seas_days[seas_count]);
                    if ( seas_count == 3 ) {
                        ++sev_count;
                    }
                    agg_end_date = LocalDate.of(current_instance.chart_a_start_year + sev_count, seas_mons[(seas_count + 1) % 4], seas_days[(seas_count + 1) % 4]);
                }
            }
            break;
        case 2:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon6_k_mons = { 1, 7 };
            int[] mon6_v_mons = { 6, 12 }, mon6_v_days = { 30, 31 };
            int mon6_count = 0, mon6_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon6_count;
                        if ( mon6_count == 2 ) {
                            mon6_count = 0;
                            ++mon6_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon6_count;
                    if ( mon6_count == 2 ) {
                        mon6_count = 0;
                        ++mon6_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_k_mons[mon6_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon6_ev_count, mon6_v_mons[mon6_count], mon6_v_days[mon6_count]);
                }
            }
            break;
        case 3:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon4_k_mons = { 1, 5, 9 };
            int[] mon4_v_mons = { 4, 8, 12 }, mon4_v_days = { 30, 31, 31 };
            int mon4_count = 0, mon4_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon4_count;
                        if ( mon4_count == 3 ) {
                            mon4_count = 0;
                            ++mon4_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon4_count;
                    if ( mon4_count == 3 ) {
                        mon4_count = 0;
                        ++mon4_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_k_mons[mon4_count], 1);
                    agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon4_ev_count, mon4_v_mons[mon4_count], mon4_v_days[mon4_count]);
                }
            }
            break;
        case 4:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon2_k_mons = { 1, 3, 5, 7, 9, 11 };
            int[] mon2_v_mons = { 2, 4, 6, 8, 10, 12 }, mon2_v_days = { 28, 30, 30, 31, 31, 31 };
            int mon2_count = 0, mon2_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon2_count;
                        if ( mon2_count == 6 ) {
                            mon2_count = 0;
                            ++mon2_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                        if ( mon2_count == 0 && (current_instance.chart_a_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon2_count == 0 && (current_instance.chart_a_start_year + mon2_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon2_count;
                    if ( mon2_count == 6 ) {
                        mon2_count = 0;
                        ++mon2_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_k_mons[mon2_count], 1);
                    if ( mon2_count == 0 && (current_instance.chart_a_start_year + mon2_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon2_ev_count, mon2_v_mons[mon2_count], mon2_v_days[mon2_count]);
                    }
                }
            }
            break;
        case 5:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int[] mon_mons = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
            int[] mon_v_days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
            int mon_count = 0, mon_ev_count = 0;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        ++mon_count;
                        if ( mon_count == 12 ) {
                            mon_count = 0;
                            ++mon_ev_count;
                        }
                        agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 1);
                        if ( mon_count == 1 && (current_instance.chart_a_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        if ( mon_count == 1 && (current_instance.chart_a_start_year + mon_ev_count) % 4 == 0 ) {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 29);
                        }else {
                            agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                        }
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    ++mon_count;
                    if ( mon_count == 12 ) {
                        mon_count = 0;
                        ++mon_ev_count;
                    }
                    agg_start_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 1);
                    if ( mon_count == 1 && (current_instance.chart_a_start_year + mon_ev_count) % 4 == 0 ) {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], 29);
                    }else {
                        agg_end_date = LocalDate.of(current_instance.chart_a_start_year + mon_ev_count, mon_mons[mon_count], mon_v_days[mon_count]);
                    }
                }
            }
            break;
        case 6:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int week2_count = 14, week2_year = current_instance.chart_a_start_year;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                        if ( tmpdate.getYear() > week2_year ) {
                            ++week2_year;
                            agg_start_date = LocalDate.of(week2_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(13);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(13);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(13);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week2_count);
                    if ( tmpdate.getYear() > week2_year ) {
                        ++week2_year;
                        agg_start_date = LocalDate.of(week2_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(13);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(13);
                    }
                }
            }
            break;
        case 7:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            int week_count = 7, week_year = current_instance.chart_a_start_year;
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_end_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        LocalDate tmpdate = agg_end_date.plusDays(week_count);
                        if ( tmpdate.getYear() > week_year ) {
                            ++week_year;
                            agg_start_date = LocalDate.of(week_year, 1, 1);
                            agg_end_date = agg_start_date.plusDays(6);
                        }else {
                            agg_end_date = tmpdate;
                            agg_start_date = agg_end_date.minusDays(6);
                        }
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        agg_end_date = agg_start_date.plusDays(6);
                        aggs_v_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_end_date);
                        jel = true;
                    }
                    LocalDate tmpdate = agg_end_date.plusDays(week_count);
                    if ( tmpdate.getYear() > week_year ) {
                        ++week_year;
                        agg_start_date = LocalDate.of(week_year, 1, 1);
                        agg_end_date = agg_start_date.plusDays(6);
                    }else {
                        agg_end_date = tmpdate;
                        agg_start_date = agg_end_date.minusDays(6);
                    }
                }
            }
            break;
        case 8:
            agg_start_date = LocalDate.of(current_instance.chart_a_start_year, 1, 1);
            for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( jel ) {
                    if ( !agg_start_date.isAfter(use_end_date) ) {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        agg_start_date = agg_start_date.plusDays(1);
                    }else {
                        aggs_k_idx[i] = -1;
                    }
                }else {
                    if ( agg_start_date.isBefore(use_start_date) ) {
                        aggs_k_idx[i] = -1;
                    }else {
                        aggs_k_idx[i] = (int)ChronoUnit.DAYS.between(use_start_date, agg_start_date);
                        aggs_v_idx[i] = aggs_k_idx[i];
                        jel = true;
                    }
                    agg_start_date = agg_start_date.plusDays(1);
                }
            }
    }
    
    // rajzolando ertekek szamitasa
    float[] usearray = new float[3];
    switch ( c_kiv_attr ) {
        case 0:
            usearray = a_temp[uu];
            break;
        case 1:
            usearray = a_tmax[uu];
            break;
        case 2:
            usearray = a_tmin[uu];
            break;
        case 3:
            usearray = a_dewp[uu];
            break;
        case 4:
            usearray = a_wdsp[uu];
            break;
        case 5:
            usearray = a_mxsw[uu];
            break;
        case 6:
            usearray = a_gust[uu];
            break;
        case 7:
            usearray = a_prcp[uu];
            break;
        case 8:
            usearray = a_sndp[uu];
            break;
        case 9:
            usearray = a_slp[uu];
            break;
        case 10:
            usearray = a_stp[uu];
            break;
        case 11:
            usearray = a_visib[uu];
            break;
        case 12:
            usearray = a_frshtt[uu];
    }
    float kezvalue = inval_value, vegvalue = inval_value;
    
    switch ( c_kiv_muv ) {
        case 0:
            // for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        kezvalue = (float)(osszeg / oc);
                    }
                }
            // }
            // for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_a_agg_count - 1] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[current_instance.kir_a_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_a_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        vegvalue = (float)(osszeg / oc);
                    }
                }
            // }
            break;
        case 1:
            // for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float locmax = -9999f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmax != -9999f ) {
                        kezvalue = locmax;
                    }
                }
            // }
            // for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_a_agg_count - 1] != -1 ) {
                    float locmax = -9999f;
                    for ( int j = aggs_k_idx[current_instance.kir_a_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_a_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmax != -9999f ) {
                        vegvalue = locmax;
                    }
                }
            // }
            break;
        case 2:
            // for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float locmin = 9999f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        kezvalue = locmin;
                    }
                }
            // }
            // for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_a_agg_count - 1] != -1 ) {
                    float locmin = 9999f;
                    for ( int j = aggs_k_idx[current_instance.kir_a_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_a_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        vegvalue = locmin;
                    }
                }
            // }
            break;
        case 3:
            // for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float locmin = 9999f, locmax = -9999f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        kezvalue = locmax - locmin;
                    }
                }
            // }
            // for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_a_agg_count - 1] != -1 ) {
                    float locmin = 9999f, locmax = -9999f;
                    for ( int j = aggs_k_idx[current_instance.kir_a_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_a_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            if ( usearray[j] < locmin ) {
                                locmin = usearray[j];
                            }
                            if ( usearray[j] > locmax ) {
                                locmax = usearray[j];
                            }
                        }
                    }
                    if ( locmin != 9999f ) {
                        vegvalue = locmax - locmin;
                    }
                }
            // }
            break;
        case 5:
            float[] avtemp = a_temp[uu];
            // for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    double t_osszeg = 0; int t_oc = 0;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                        if ( avtemp[j] != inval_value ) {
                            t_osszeg += avtemp[j];
                            ++t_oc;
                        }
                    }
                    if ( oc != 0 && t_oc != 0 ) {
                        kezvalue = (float)(t_osszeg / t_oc) - (float)(osszeg / oc);
                    }
                }
            // }
            // for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_a_agg_count - 1] != -1 ) {
                    double osszeg = 0; int oc = 0;
                    double t_osszeg = 0; int t_oc = 0;
                    for ( int j = aggs_k_idx[current_instance.kir_a_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_a_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                        if ( avtemp[j] != inval_value ) {
                            t_osszeg += avtemp[j];
                            ++t_oc;
                        }
                    }
                    if ( oc != 0 && t_oc != 0 ) {
                        vegvalue = (float)(t_osszeg / t_oc) - (float)(osszeg / oc);
                    }
                }
            // }
            break;
        case 7:
            // for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        osszeg += usearray[j];
                    }
                    kezvalue = osszeg;
                }
            // }
            // for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_a_agg_count - 1] != -1 ) {
                    float osszeg = 0f;
                    for ( int j = aggs_k_idx[current_instance.kir_a_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_a_agg_count - 1]; ++j ) {
                        osszeg += usearray[j];
                    }
                    vegvalue = osszeg;
                }
            // }
            break;
        case 9:
            // for ( int i = 0; i < current_instance.kir_a_agg_count; ++i ) {
                if ( aggs_k_idx[0] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[0]; j <= aggs_v_idx[0]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        kezvalue = osszeg;
                    }
                }
            // }
            // for ( int i = current_instance.kir_a_agg_count - 1; i >= 0; --i ) {
                if ( aggs_k_idx[current_instance.kir_a_agg_count - 1] != -1 ) {
                    float osszeg = 0; int oc = 0;
                    for ( int j = aggs_k_idx[current_instance.kir_a_agg_count - 1]; j <= aggs_v_idx[current_instance.kir_a_agg_count - 1]; ++j ) {
                        if ( usearray[j] != inval_value ) {
                            osszeg += usearray[j];
                            ++oc;
                        }
                    }
                    if ( oc != 0 ) {
                        vegvalue = osszeg;
                    }
                }
            // }
    }
    if ( vegvalue != inval_value && kezvalue != inval_value ) {
        y_ertekek[uu] = vegvalue - kezvalue;
        if ( y_ertekek[uu] < val_min ) {
            val_min = y_ertekek[uu];
        }
        if ( y_ertekek[uu] > val_max ) {
            val_max = y_ertekek[uu];
        }
    }else {
        y_ertekek[uu] = inval_value;
    }
    }
    
    // println(val_max);
    // println(val_min);
    // for ( int i = 0; i < city_count; ++i ) {
    //     if ( y_ertekek[i] != inval_value ) {
    //         println(y_ertekek[i]);
    //     }else {
    //         println("inv");
    //     }
    // }
    
    float tarkul = val_max - val_min, tarkoz = tarkul / 19f;
    float strkoz = tarkul / 10;
    for ( int i = 0; i < 11; ++i ) {
        current_instance.mav_a_labels[i] = String.format("%.1f", val_min + i * strkoz);
    }
    if ( tarkoz == 0f ) {
        return;
    }
    float[] tarhatars = new float[19];
    for ( int i = 0; i < 19; ++i ) {
        tarhatars[i] = val_min + i * tarkoz;
        // println(tarhatars[i]);
    }
    noStroke();
    for ( int i = 0; i < haromszogek.length; i += 3 ) {
        float ty0 = y_ertekek[heat_city_idx[haromszogek[i]]];
        float ty1 = y_ertekek[heat_city_idx[haromszogek[i + 1]]];
        float ty2 = y_ertekek[heat_city_idx[haromszogek[i + 2]]];
        if ( ty0 == inval_value || ty1 == inval_value || ty2 == inval_value ) {
            continue;
        }
        beginShape();
        int cj = 0;
        for ( int j = 18; j >= 0; --j ) {
            if ( ty0 >= tarhatars[j] ) {
                cj = j;
                break;
            }
        }
        ty0 = (ty0 - tarhatars[cj]) / tarkoz;
        if ( current_instance.mavi_is_magma ) {
            fill(lerpColor(magma[cj], magma[cj + 1], ty0));
        }else {
            fill(lerpColor(viridis[cj], viridis[cj + 1], ty0));
        }
        vertex(draw_x[heat_city_idx[haromszogek[i]]], draw_y[heat_city_idx[haromszogek[i]]]);
        cj = 0;
        for ( int j = 18; j >= 0; --j ) {
            if ( ty1 >= tarhatars[j] ) {
                cj = j;
                break;
            }
        }
        ty1 = (ty1 - tarhatars[cj]) / tarkoz;
        if ( current_instance.mavi_is_magma ) {
            fill(lerpColor(magma[cj], magma[cj + 1], ty1));
        }else {
            fill(lerpColor(viridis[cj], viridis[cj + 1], ty1));
        }
        vertex(draw_x[heat_city_idx[haromszogek[i + 1]]], draw_y[heat_city_idx[haromszogek[i + 1]]]);
        cj = 0;
        for ( int j = 18; j >= 0; --j ) {
            if ( ty2 >= tarhatars[j] ) {
                cj = j;
                break;
            }
        }
        ty2 = (ty2 - tarhatars[cj]) / tarkoz;
        if ( current_instance.mavi_is_magma ) {
            fill(lerpColor(magma[cj], magma[cj + 1], ty2));
        }else {
            fill(lerpColor(viridis[cj], viridis[cj + 1], ty2));
        }
        vertex(draw_x[heat_city_idx[haromszogek[i + 2]]], draw_y[heat_city_idx[haromszogek[i + 2]]]);
        endShape(CLOSE);
    }
}