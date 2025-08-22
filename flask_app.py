
# A very simple Flask Hello World app for you to get started with...

from flask import Flask

app = Flask(__name__)

@app.route('/')
def main():
    return 'Hello from Flask! It''s Me!'

if __name__ == '__main__':
    app.run(debug=True)
