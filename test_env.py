from dotenv import load_dotenv
import os

load_dotenv()

print("TOKEN:", os.getenv("MOTHERDUCK_TOKEN"))
print("DB:", os.getenv("MOTHERDUCK_DATABASE"))
