// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Jun 17 12:59:09 2024
// Host        : NP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_num_font_sim_netlist.v
// Design      : blk_mem_num_font
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_num_font,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27776)
`pragma protect data_block
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
N6MLG7PNVllFokr2fjBs9b0=
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
