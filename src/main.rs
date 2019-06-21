#![feature(proc_macro_hygiene, decl_macro)]

use rocket_contrib::serve::StaticFiles;

fn get_directory() -> &'static str {
    if cfg!(debug_assertions) {
        return "./static";
    } else {
        return "/static";
    }
}

fn main() {
    rocket::ignite()
        .mount("/", StaticFiles::from(get_directory()))
        .launch();
}
