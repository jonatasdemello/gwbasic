import os
import shutil

base_dir = r".\bas"

for filename in os.listdir(base_dir):
    file_path = os.path.join(base_dir, filename)

    # Skip directories
    if not os.path.isfile(file_path):
        continue

    if not filename[0].isalpha():
        continue

    # Get first letter (uppercase)
    first_letter = filename[0].upper()

    # Create destination folder
    dest_dir = os.path.join(base_dir, first_letter)
    os.makedirs(dest_dir, exist_ok=True)

    # Move file
    dest_path = os.path.join(dest_dir, filename)
    shutil.move(file_path, dest_path)

    print(f"Moved {filename} → {first_letter}/")
