/**
*   WagonR class
**/
class WagonR extends Car {
    int mileage;
    public WagonR(int m) {
        super(false, ""+4);
        mileage = m;
    }
    
    public String getMileage() {
        return ""+mileage+" kmpl";
    }
}
/**
*   HondaCity class
**/
class HondaCity extends Car {
    int mileage;
    public HondaCity(int m) {
        super(true, ""+4);
        mileage = m;
    }
    public String getMileage() {
        return ""+mileage+" kmpl";
    }
}
/**
*   InnovaCrysta class
**/
class InnovaCrysta extends Car {
    int mileage;
    public InnovaCrysta(int m) {
        super(false, ""+6);
        mileage = m;
    }
    
    public String getMileage() {
        return ""+mileage+" kmpl";
    }
}

