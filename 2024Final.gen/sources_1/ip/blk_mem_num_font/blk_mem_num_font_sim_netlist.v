// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Jun 17 12:59:10 2024
// Host        : NP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/LDFEXP/2024Final/2024Final.gen/sources_1/ip/blk_mem_num_font/blk_mem_num_font_sim_netlist.v
// Design      : blk_mem_num_font
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_num_font,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_num_font
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [14:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [0:0]douta;

  wire [14:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [0:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "15" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.329074 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_num_font.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_num_font.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "20480" *) 
  (* C_READ_DEPTH_B = "640" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "1" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "640" *) 
  (* C_WRITE_DEPTH_B = "640" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_num_font_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27792)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
