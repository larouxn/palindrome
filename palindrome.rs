use std::env;

fn is_palindrome(ch_vec: Vec<&str>) -> bool {
    let ch_vec_2 = ch_vec.to_vec();
    ch_vec.reverse();
    return (ch_vec == ch_vec_2);
}

fn main() {
    let args: Vec<_> = env::args().collect();
    let input = &args[1];
    let ch_vec: Vec<&str> = input.split("").collect();
    let is_pal = is_palindrome(ch_vec);
    println!("Is {} a palindrome? {}", input, is_pal);
    // if is_pal {
    //     for combo in ch_vec.permutations() {
    //         if is_palindrome(combo) {
    //             let combo_str =
    //             println!("A palindromic form of {} is {}", input, combo);
    //             break;
    //         }
    //     }
    // }
}
