use std::env;
use std::collections::HashMap;

fn is_palindrome(input: &str) -> bool {
    let forward: Vec<char> = input.chars().collect();
    let mut reverse: Vec<char> = input.chars().collect();
    reverse.reverse();
    forward == reverse
}

fn build_palindrome(input: &str) {
    let split: Vec<char> = input.chars().collect();
    println!("{}", split.len());
    let mut map: HashMap<&char, i32> = HashMap::new();
    for ch in split.iter() {
        if !map.contains_key(ch) {
            map.insert(ch, 1);
        } else if let Some(n) = map.get_mut(ch) {
            *n = *n + 1;
        }
    }
    for (k, v) in map.iter() {
        println!("key = {}, val = {}", *k, *v);
    }
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
