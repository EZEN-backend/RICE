package kr.co.rice.vo;

public class ProductVo {
    private int id, price, views, subcategory_id, category_id, spicylevel_id, reviews_amount, cart_products_amount, wish_count;
    private String title, name, size, body, code, extra_detail, category_name, subcategory_name, spicylevel, image_url;

    public int getWish_count() {
        return wish_count;
    }

    public void setWish_count(int wish_count) {
        this.wish_count = wish_count;
    }

    public int getReviews_amount() {
        return reviews_amount;
    }

    public void setReviews_amount(int reviews_amount) {
        this.reviews_amount = reviews_amount;
    }

    public int getCart_products_amount() {
        return cart_products_amount;
    }

    public void setCart_products_amount(int cart_products_amount) {
        this.cart_products_amount = cart_products_amount;
    }

    public int getSpicylevel_id() {
        return spicylevel_id;
    }

    public void setSpicylevel_id(int spicylevel_id) {
        this.spicylevel_id = spicylevel_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getSubcategory_id() {
        return subcategory_id;
    }

    public void setSubcategory_id(int subcategory_id) {
        this.subcategory_id = subcategory_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getExtra_detail() {
        return extra_detail;
    }

    public void setExtra_detail(String extra_detail) {
        this.extra_detail = extra_detail;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getSubcategory_name() {
        return subcategory_name;
    }

    public void setSubcategory_name(String subcategory_name) {
        this.subcategory_name = subcategory_name;
    }

    public String getSpicylevel() {
        return spicylevel;
    }

    public void setSpicylevel(String spicylevel) {
        this.spicylevel = spicylevel;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
