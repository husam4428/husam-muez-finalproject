import os
from flask import Flask, render_template, jsonify

# تحديد مسار المجلد الحالي بدقة لضمان قراءة المجلدات داخل الحاوية
base_dir = os.path.dirname(os.path.abspath(__file__))
app = Flask(__name__, template_folder=os.path.join(base_dir, 'templates'))

# 1. المسار الرئيسي لعرض واجهة الـ HTML
@app.route('/')
def home():
    try:
        return render_template('index.html')
    except Exception as e:
        return f"Template Error: {str(e)}", 500

# 2. مسار الـ /health المطلوب لفحص سلامة الحاويات في Kubernetes
@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

