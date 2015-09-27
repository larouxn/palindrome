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
    let mut map: HashMap<&char, i32> = HashMap::new();
    for ch in split.iter() {
        if !map.contains_key(ch) {
            map.insert(ch, 1);
        } else if let Some(n) = map.get_mut(ch) {
            *n = *n + 1;
        }
    }

    let mut evens_map: HashMap<&char, i32> = HashMap::new();
    let mut odds_map: HashMap<&char, i32> = HashMap::new();
    for (k, v) in map {
        if v % 2 == 0 {
            evens_map.insert(k, v);
        } else {
            odds_map.insert(k, v);
        }
    }

    if odds_map.len() > 1 {
        println!("{} cannot be made into a palindrome", input);
    } else {
        let mut build_str = String::new();
        for (k, v) in evens_map {
            for i in 0..(v / 2) {
                build_str.push(k.to_owned());
            }
        }

        let mut single = 'x';
        for (k, v) in odds_map {
            if v > 1 {
                for i in 0..(v / 2) {
                    build_str.push(k.to_owned());
                }
            } else {
                single = k.to_owned();
            }
        }

        let mut str_rev_chs: Vec<char> = build_str.chars().collect();
        str_rev_chs.reverse();
        let mut final_str = build_str;
        final_str.push(single);
        for ch in str_rev_chs {
            final_str.push(ch);
        }
        println!("A palindromic form of {} is {}", input, final_str);
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
