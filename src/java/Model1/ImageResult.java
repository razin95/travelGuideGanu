package Model1;

public class ImageResult {

    private String url;
    private String photographer;

    public ImageResult(String url, String photographer) {
        this.url = url;
        this.photographer = photographer;
    }

    public String getUrl() {
        return url;
    }

    public String getPhotographer() {
        return photographer;
    }
}
