# Function to perform Vigenère decryption
sub vigenere_decrypt {
    my ($ciphertext, $keyword) = @_;
    my $plaintext = "";
    $keyword = uc $keyword;  # Convert the keyword to uppercase
    my $key_index = 0;

    # Iterate through each character in the ciphertext
    for my $i (0 .. length($ciphertext) - 1) {
        my $char = substr($ciphertext, $i, 1);
        if ($char =~ /[a-zA-Z]/) {  # Check if the character is alphabetic
            my $char_code = ord(uc $char) - 65;  # Convert character to ASCII code
            my $key_code = ord(substr($keyword, $key_index, 1)) - 65;  # Convert key character to ASCII code
            my $plain_char = chr((($char_code - $key_code) % 26) + 65);  # Perform Vigenère decryption
            $plain_char = lc $plain_char if lc $char eq $char;  # Preserve case of the original character
            $plaintext .= $plain_char;  # Append decrypted character to plaintext
            $key_index = ($key_index + 1) % length($keyword);  # Move to the next character in the keyword
        } else {
            $plaintext .= $char;  # Append non-alphabetic character to plaintext
        }
    }

    return $plaintext;  
}

# Ciphertext to decrypt
my $ciphertext = "KRRRPR{memlbrjvuxxrfa}";
# Key used for decryption
my $keyword = "idonotknow";

# Decrypt the ciphertext using the provided key
my $plaintext = vigenere_decrypt($ciphertext, $keyword);


print "$plaintext\n";
