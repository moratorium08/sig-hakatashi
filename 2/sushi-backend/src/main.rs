#![feature(proc_macro_hygiene, decl_macro)]
#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;
#[macro_use]
extern crate serde_derive;

#[macro_use]
extern crate lazy_static;

use rocket_contrib::json::{Json, JsonValue};
use std::sync::Mutex;

#[derive(Serialize, Deserialize)]
struct Speed {
    speed: u64,
}

lazy_static! {
    static ref SPEED: Mutex<u64> = Mutex::new(1);
}

#[post("/speed", data = "<data>")]
fn update_speed(data: Json<Speed>) -> JsonValue {
    if data.speed == 0 || data.speed > 100 {
        return json!({"result": "fail"});
    }
    *SPEED.lock().unwrap() = data.speed;
    json!({"result": "ok"})
}

#[get("/speed")]
fn get_speed() -> JsonValue {
    let x = *SPEED.lock().unwrap();
    json!({ "speed": x })
}

fn main() {
    rocket::ignite()
        .mount("/", routes![get_speed, update_speed])
        .launch();
}
