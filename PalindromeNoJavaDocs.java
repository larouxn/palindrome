import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class Palindrome {
	public static String mkString(char[] chs) {
		StringBuilder sb = new StringBuilder();
		for (char c : chs)
			sb.append(c);
		return sb.toString();
	}

	public static char[] reverse(char[] orig) {
		char[] rev = new char[orig.length];
		int up = 0;
		int down = orig.length - 1;
		while(up < orig.length) {
			rev[down] = orig[up];
			down--;
			up++;
		}
		return rev;
	}

	public static boolean isPalindrome(char[] chs) {
		return Arrays.equals(chs, reverse(chs));
	}

	public static HashMap<Character, Integer> getFrequencies(char[] chs) {
		HashMap<Character, Integer> frequencies = new HashMap<Character, Integer>();
		for (char c : chs) {
			if (frequencies.containsKey(c))
				frequencies.put(c, frequencies.get(c) + 1);
			else
				frequencies.put(c, 1);
		}
		return frequencies;
	}

	public static HashMap<Character, Integer> getParityFreqs(HashMap<Character, Integer> f, boolean isOdds) {
		HashMap<Character, Integer> parityFreqs = new HashMap<Character, Integer>();
		for (Map.Entry<Character, Integer> e : f.entrySet()) {
			if (isOdds) {
				if (e.getValue() % 2 != 0)
					parityFreqs.put(e.getKey(), e.getValue());
			} else {
				if (e.getValue() % 2 == 0)
					parityFreqs.put(e.getKey(), e.getValue());
			}
		}
		return parityFreqs;
	}

	public static String createPalindromeIfPossible(char[] chs) {
		HashMap<Character, Integer> freqs = getFrequencies(chs);
		HashMap<Character, Integer> odds  = getParityFreqs(freqs, true);
		HashMap<Character, Integer> evens = getParityFreqs(freqs, false);
		if (odds.size() > 1)
			return mkString(chs) + " cannot be made into a palindrome";

		StringBuilder evenpal = new StringBuilder();
		for (Map.Entry<Character, Integer> e : evens.entrySet())
			for (int i = 0; i < e.getValue() / 2; i++)
				evenpal.append(e.getKey());

		char single = '\u0000';
		StringBuilder oddpal = new StringBuilder();
		for (Map.Entry<Character, Integer> e : odds.entrySet()) {
			if (e.getValue() > 1) {
				for (int i = 0; i < e.getValue() / 2; i++)
					oddpal.append(e.getKey());
			} else
				single = e.getKey();
		}

		StringBuilder fullpal = new StringBuilder();
		fullpal.append(evenpal.toString());
		fullpal.append(single);
		fullpal.append(oddpal);
		fullpal.append(mkString(reverse(evenpal.toString().toCharArray())));
		return "A palindromic form of " + mkString(chs) + " is " + fullpal.toString();
	}

	public static void main(String[] args) {
		char[] split = args[0].toCharArray();
		if (isPalindrome(split))
			System.out.println(args[0] + " is a palindrome");
		else
			System.out.println(createPalindromeIfPossible(split));
	}
}
