import socket # Import socket module
import time
from datetime import datetime


# We need a function to safely receive the client request!
End=b'\0'
def recv_end(conn):
    total_data=[]; data=''
    while True:
        data=conn.recv(1024)
        if End in data:
            total_data.append(data[:data.find(End)])
            break
        total_data.append(data)
    return b''.join(total_data)

s = socket.socket() # Create a socket object
host = socket.gethostname() # Get local machine name
port = 12345 # Reserve a port for your service .
s.bind((host, port)) # Bind to the port

s.listen(5) # Now wait for client connection .
while True:
    conn, addr = s.accept() # Establish connection with client .
    print('Got connection from ', addr)

    data = recv_end(conn)

    print('Received request: ', data)

    time.sleep(5)

    if data == b'time':
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")
        conn.sendall(current_time.encode('utf-8') + b'\0')
    elif data == b'nuqneH?':
        conn.sendall(b'Qapla\'!\0')
    else:
        conn.sendall(data + b'\0')

    conn.close() # Close the connection
