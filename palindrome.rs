use std::env;
use std::collections::HashMap;

fn is_palindrome(ch_vec: Vec<&str>) -> bool {
    let mut ch_vec_1 = ch_vec.to_vec();
    let ch_vec_2 = ch_vec.to_vec();
    ch_vec_1.reverse();
    return ch_vec_1 == ch_vec_2;
}

fn main() {
    let args: Vec<_> = env::args().collect();
    let input = &args[1];
    let ch_vec: Vec<&str> = input.split("").collect();
    let is_pal = is_palindrome(ch_vec);
    println!("Is {} a palindrome? {}", input, is_pal);
    if !is_pal {
        let mut map: HashMap<&str, i32> = HashMap::new();
        for c in ch_vec.to_vec() {
            if let Some(n) = map.get(c) {
                map.insert(c, n+1);
            } else {
                map.insert(c, 1);
            }
        }
        // stuff here, will do later
    }
}
