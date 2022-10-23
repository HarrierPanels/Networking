EPAM  University  Programs  DevOps  external  course

Module  –  Linux  Networking

The  practical  part  of  the  Linux  Networking  module  involves  creating  means Virtual  Box  network  shown  in  Figure  1

Figure  1

Host  is  the  computer  on  which  Virtual  Box  is  running;

Server\_1  –  A  virtual  machine  on  which  the  Linux  OS  is  deployed.  Int1  of  this  machine  in  "Network  bridge"  mode  is  connected  to  the  Net1  network,  that  is,  it  is  in  the  address  space  of  the  home  network.  The  IP  address  of  Int1  is  set  statically  according  to  the  address  space,  for  example  192.168.1.200/24.  Interfaces  Int2  and  Int3  are  respectively  connected  in  "Internal  network"  mode  to  networks  Net2  and  Net3.

Client\_1  and  Client\_2  –  Virtual  machines  running  Linux  (preferably  different  distributions  such  as  Ubuntu  and  CentOS).  The  interfaces  are  connected  in  "Internal  network"  mode  to  Net2,  Net3  and  Net4  networks  as  shown  in  Figure  1.

The  Net2  network  address  is  10.YD0/24

The  address  of  the  Net3  network  is  10.MY0/24. The  Net4  network  address  is  172.16.D.0/24.

**WARNING!**  If  the  Net2,  Net3,  or  Net4  address  space  overlaps  with  the  Net1  address  space,  the  corresponding  address  can  be  changed  at  your  discretion.

1. Configure  static  addresses  on  all  interfaces  on  Server\_1.
1. Configure  the  DHCP  service  on  Server\_1,  which  will  configure  the  Int1  addresses  of  Client\_1  and  Client\_2
1. Using  the  ping  and  traceroute  commands,  check  the  connection  between  the  virtual  ones cars  Explain  the  result.

**WARNING!**  In  order  for  packets  to  pass  from  Client\_1  and  Client\_2  to  the  Internet  (more  precisely,  to  return  from  the  Internet  to  Client\_1  and  Client\_2),  the  Wi-Fi  Router  must configure  static  routes  for  Net2  and  Net3  networks.  If  there  is  no  such  possibility,  put  the  Int1  interface  on  Server\_1  into  NAT  mode.

4. On  the  virtual  interface  lo  Client\_1,  assign  two  IP  addresses  according  to  the  following  rule:  172.17.D+10.1/24  and  172.17.D+20.1/24.  Configure  routing  so  that  traffic  from  Client\_2  to  172.17.D+10.1  goes  through  Server\_1,  and  to  172.17.D+20.1  through  Net4.  To  check,  use  traceroute.
4. Calculate  the  common  address  and  mask  (summarizing)  addresses  172.17.D+10.1  and  172.17.D+20.1,  and  the  prefix  should  be  as  large  as  possible.  Delete  the  routes  set  in  the  previous  step  and  replace  them  with  the  combined  route  that  should  go  through  Server\_1.
4. Configure  the  SSH  service  so  that  Client\_1  and  Client\_2  can

connect  to  Server\_1  and  each  other.  7.  

Configure  the  firewall  on  Server\_1  as  follows:

`   `Allowed  to  connect  via  SSH  from  Client\_1  and  forbidden  from  Client\_2

`   `From  Client\_2  to  172.17.D+10.1  the  ping  was  successful,  but  to  172.17.D+20.1  it  was  not  successful

\8.  If  the  routing  for  Client\_1  and  Client\_2  access  to  the  Internet  was  configured  in  point  3,  delete  the  corresponding  entries.  Configure  NAT  on  Server\_1 service  in  such  a  way  that  Client\_1  and  Client\_2  ping  the  Internet
