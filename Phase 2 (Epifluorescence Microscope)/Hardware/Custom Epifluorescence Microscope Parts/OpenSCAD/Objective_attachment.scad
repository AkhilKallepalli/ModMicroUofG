use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/microscope_parameters.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/lib_optics.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/optics_configurations.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>


//These parameters can be overwritten here or from command line with -D
OPTICS = "rms_f50d13";
BEAMSPLITTER = false;
CAMERA = "picamera_2";

difference(){
    optics_module();
    translate([0,0,-20])cube([50,50,50],center=true);
}



module optics_module(){
difference(){
    configurable_optics_module(OPTICS, CAMERA, BEAMSPLITTER);
    translate([0,0,-25])cube([40,40,30],center=true);
}
}


//optics_module();


module configurable_optics_module(optics, camera_type, beamsplitter){
    params = default_params();

    // Note calling the optics module rms inside each if statment
    // to avoid nested ternaries
    if (optics=="rms_f50d13"){
        optics_config = rms_f50d13_config(camera_type=camera_type, beamsplitter=beamsplitter);
        optics_module_rms(params, optics_config);
    }
    else if(optics=="rms_infinity_f50d13"){
        optics_config = rms_infinity_f50d13_config(camera_type=camera_type, beamsplitter=beamsplitter);
        optics_module_rms(params, optics_config);
    }
    else{
        assert(false, "Unknown optics configuration specified");
    }

}



function rms_f50d13_config(camera_type = "picamera_2", beamsplitter=false) = let(
    config_dict = [["optics_type", "RMS"],
                   ["camera_type", camera_type],
                   ["tube_lens_ffd", 47],
                   ["tube_lens_f", 70],
                   ["tube_lens_r", 12.7/2+0.1],
                   ["objective_parfocal_distance", 45],
                   ["beamsplitter", beamsplitter],
                   ["gripper_t", 1],
                   ["is_finite_conjugate", true],
                   ["objective_mechanical_tube_length", 160],
                   ["lens_objective_distance", 8.5],
                   ["camera_rotation", 0],
                   ["beamsplitter_rotation", 0]]
) config_dict;

function rms_infinity_f50d13_config(camera_type = "picamera_2", beamsplitter=false) = let(
    finite_config = rms_f50d13_config(camera_type, beamsplitter),
    replacements = [["is_finite_conjugate", false]]
) replace_multiple_values(replacements, finite_config);

function pilens_config(camera_type = "picamera_2") = let(
    config_dict = [["optics_type", "spacer"],
                   ["camera_type", camera_type],
                   ["lens_r", 3],
                   ["parfocal_distance", 6],
                   ["lens_h", 2.5],
                   ["lens_spacing", 17]]
) config_dict;
