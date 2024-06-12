module vga_sim();
    reg clk, rst;
    wire h_sync, v_sync;
    wire [11:0] pixel_data;
    vga_test_top uut(
        .sys_clk(clk),
        .sys_rst(rst),
        .h_sync(h_sync),
        .v_sync(v_sync),
        .pixel_data(pixel_data)
    );
    initial begin
        clk = 0;
        rst = 0;
        #50;
        rst = 1;
        #50;
        rst = 0;
    end
    always begin
        clk = ~clk;
        #5;
    end

endmodule