#!/usr/bin/env python3
"""
简单的HTTP服务器，用于运行Three.js项目
解决CORS问题，让GLB模型文件能够正确加载
自动寻找可用端口
"""

import http.server
import socketserver
import os
import sys
import socket

def find_free_port(start_port=8000, max_attempts=10):
    """
    寻找可用端口
    """
    for port in range(start_port, start_port + max_attempts):
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.bind(('', port))
                return port
        except OSError:
            continue
    return None

# 寻找可用端口
PORT = find_free_port()
if PORT is None:
    print("❌ 无法找到可用端口，请手动指定端口")
    sys.exit(1)

# 切换到项目目录
os.chdir(os.path.dirname(os.path.abspath(__file__)))

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # 添加CORS头，允许跨域访问
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

    def do_OPTIONS(self):
        # 处理预检请求
        self.send_response(200)
        self.end_headers()

if __name__ == "__main__":
    try:
        with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
            print(f"🐟 鱼群模拟服务器启动成功！")
            print(f"🌐 请在浏览器中访问: http://localhost:{PORT}")
            print(f"⏹️  按 Ctrl+C 停止服务器")
            print(f"📊 服务器信息: 端口 {PORT}")
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n🛑 服务器已停止")
        sys.exit(0)
    except OSError as e:
        print(f"❌ 启动服务器时出错: {e}")
        print("💡 提示: 尝试运行 'lsof -ti:8000 | xargs kill -9' 释放端口")
        sys.exit(1)
