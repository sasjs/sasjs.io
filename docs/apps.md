Apps
====================

Below are a collection of Apps and Tools that can be deployed on either / both SAS 9 and SAS Viya platforms.

## Fun and Games

### Sonic the Hedgehog
A SASjs wrapper for this remake of the sega classic!  Works on SAS 9 only (due to default CSP settings on Viya).  

Source: [https://github.com/allanbowe/sonic](https://github.com/allanbowe/sonic)

Deployment:

```
filename playme url "https://raw.githubusercontent.com/allanbowe/sonic/master/sonic.sas";
%inc playme;
```

### RockRoller
Dodge trees to see how far you can roll this rock in this infinite game!  Works on both SAS 9 and Viya.

Source: [https://github.com/macropeople/rockroller](https://github.com/macropeople/rockroller)

This game was set up to demonstrate 


### SAS Streamed SAS Rap
Run the code below (SAS9 or Viya), and open the link in a browser to hear a SAS streamed [SAS Rap](https://www.youtube.com/watch?v=FtTAoYV9HS8&feature=youtu.be) by [Thiago De Souza](https://www.linkedin.com/in/thiago-de-souza/) 

```
filename playme url "https://sasjs.io/rap.sas";
%inc playme;
```

source: [https://github.com/allanbowe/sasrap](https://github.com/allanbowe/sasrap)