use std::env;
//use std::collections::HashMap;

fn is_palindrome(input: &str) -> bool {
    let forward: Vec<&str> = input.split("").collect();
    let reverse: Vec<&str> = input.rsplit("").collect();
    forward == reverse
}

fn build_palindrome(input: &str) {
    println!("can't do it son");
}

fn main() {
    let args: Vec<_> = env::args().collect();
    let input = &args[1];
    let is_pal = is_palindrome(&input);

    match is_pal {
        true => println!("{} is a palindrome", input),
        _    => build_palindrome(&input),
    }
}
