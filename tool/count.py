from collections import Counter

with open("files.txt", "r") as f:
    first_letters = [line.strip()[0].upper() for line in f if line.strip()]

counts = Counter(first_letters)

for letter, count in sorted(counts.items()):
    print(f"{letter} = {count}")
