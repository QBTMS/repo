//package validator;
//
//import model.Vehicle;
//import org.springframework.stereotype.Component;
//import org.springframework.validation.Errors;
//import org.springframework.validation.Validator;
//
///**
// * Created by prasad on 4/30/14.
// */
//
//@Component("VehicleValidator")
//public class VehicleValidator implements Validator {
//    @Override
//    public boolean supports(Class<?> aClass) {
//        return false;
//    }
//
//    @Override
//    public void validate(Object o, Errors errors) {
//        Vehicle vehicle = (Vehicle) o;
//
//        if(vehicle.getVehicleNumber().isEmpty()){
//            errors.rejectValue("vehicleNumber", "vehicle.number.empty");
//        }
//
//        if(vehicle.getVehicleType().isEmpty()){
//            errors.rejectValue("vehicleType", "vehicle.type.empty");
//        }
//    }
//}
