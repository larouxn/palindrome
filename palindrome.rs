use std::env;

fn is_palindrome(input: &str) -> bool {
    
    return true;
}

fn main() {
    let args: Vec<_> = env::args().collect();
    let input = &args[1];
    let is_pal = is_palindrome(input);
    println!("Is {} a palindrome? {}", input, is_pal);
}
