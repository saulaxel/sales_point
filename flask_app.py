
# A very simple Flask Hello World app for you to get started with...

from flask import Flask

from routes.web import web_bp
from routes.api import api_bp

app = Flask(__name__)

# Register blueprints
app.register_blueprint(web_bp)
app.register_blueprint(api_bp, url_prefix='/api')


if __name__ == '__main__':
    app.run(debug=True)
