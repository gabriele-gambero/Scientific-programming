import socket # Import socket module

s = socket.socket() # Create a socket object
host = socket.gethostname() # Get local machine name ( here ; usually host of server !)
port = 12345 # Port of the server to be contacted

s.connect((host, port)) # Establish a connection to the server
print(s.recv(1024)) # Receive the response and print it
s.close()
