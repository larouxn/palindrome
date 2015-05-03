use std::env;

fn is_palindrome(input: &str) -> bool {
    let ch_vec: Vec<&str> = input.split("").collect();

    let mut front_vec: Vec<&str> = vec![];
    let mut back_vec: Vec<&str> = vec![];
    return true;
}

fn main() {
    let args: Vec<_> = env::args().collect();
    let input = &args[1];
    let is_pal = is_palindrome(input);
    println!("Is {} a palindrome? {}", input, is_pal);
}
