require_relative 'caesar_cipher'

describe '#caesar_cipher' do
  it 'returns the correct ciphered message with positive shift' do
    expect(caesar_cipher("Hello, World!", 5)).to eq("Mjqqt, Btwqi!")
  end

  it 'returns the correct ciphered message with negative shift' do
    expect(caesar_cipher("Hello, World!", -3)).to eq("Ebiil, Tloia!")
  end

  it 'returns the correct ciphered message with zero shift' do
    expect(caesar_cipher("Hello, World!", 0)).to eq("Hello, World!")
  end

  it 'returns the correct ciphered message with large positive shift' do
    expect(caesar_cipher("Hello, World!", 26)).to eq("Hello, World!")
  end

  it 'returns the correct ciphered message with large negative shift' do
    expect(caesar_cipher("Hello, World!", -26)).to eq("Hello, World!")
  end

  it 'returns the correct ciphered message with mixed case' do
    expect(caesar_cipher("Hello, World!", 10)).to eq("Rovvy, Gybvn!")
  end

  it 'returns the correct ciphered message with non-alphabetic characters' do
    expect(caesar_cipher("Hello, World! 123", 5)).to eq("Mjqqt, Btwqi! 123")
  end
end
