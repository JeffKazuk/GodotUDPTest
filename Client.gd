extends Node

var IP_SERVER = "255.255.255.255" #"34.202.96.244"
var PORT_SERVER = 1507
var PORT_CLIENT = 1509
var socketUDP = PacketPeerUDP.new()
var cron_send = 0

func _ready():
    start_client()

func _process(delta):
    if cron_send > 0:
        cron_send -= delta
    if cron_send <= 0:
        if socketUDP.is_listening():
            socketUDP.set_dest_address(IP_SERVER, PORT_SERVER)
            var stg = "hi server!"
            var pac = stg.to_ascii()
            socketUDP.put_packet(pac)
            print("send!")
            cron_send = 3

    if socketUDP.get_available_packet_count() > 0:
        var array_bytes = socketUDP.get_packet()
        printt("msg server: " + array_bytes.get_string_from_ascii())

func start_client():
    if (socketUDP.listen(PORT_CLIENT, IP_SERVER) != OK):
        printt("Error listening on port: " + str(PORT_CLIENT) + " in server: " + IP_SERVER)
    else:
        printt("Listening on port: " + str(PORT_CLIENT) + " in server: " + IP_SERVER)

func _exit_tree():
    socketUDP.close()