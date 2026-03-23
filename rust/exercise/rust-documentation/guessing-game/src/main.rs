use std::io;

fn main() {
	println!("Enter a number (1 and 100): ");
	
	let mut guess = String::new();
	io::stdin()
		.read_line(&mut guess)
		.expect("Failed to read line");
		
	println!("You guess: {guess}");
}
