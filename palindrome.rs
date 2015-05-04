use std::env;

fn is_palindrome(input: &str) -> bool {
    let mut ch_vec: Vec<&str> = input.split("").collect();
    let ch_vec_2 = ch_vec.to_vec();
    ch_vec.reverse();
    return (ch_vec == ch_vec_2);
}

fn main() {
    let args: Vec<_> = env::args().collect();
    let input = &args[1];
    let is_pal = is_palindrome(input);
    println!("Is {} a palindrome? {}", input, is_pal);
}
