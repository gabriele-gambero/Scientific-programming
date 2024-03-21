import socket # Import socket module
import sys  # for command line arguments

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

message = b''

n = len(sys.argv)
if (n == 1):
    print("No message to server provided on the command line; ending program\n")
    exit(0)
else:
    for i in range(1, n):
        message += sys.argv[i].encode('UTF-8')
        if (i != n-1):
            message += b' '

    message += End

print('Sending message to server: ' + message.decode('UTF-8') + '\n')

s = socket.socket() # Create a socket object
host = socket.gethostname() # Get local machine name ( here ; usually host of server !)
port = 12345 # Port of the server to be contacted

s.connect((host, port)) # Establish a connection to the server

s.sendall(message)

print(recv_end(s)) # Receive the response and print it
s.close()
