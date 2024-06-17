module blk_mem_sim();
    reg clk = 0;
    reg [14:0] addra = 17'b0;
    wire out;
    blk_mem_num_font uut(
        .clka(clk),
        .wea(1'b0),
        .addra(addra),
        .dina(32'b0),
        .douta(out)
    );
    always begin
        clk = ~clk;
        #5;
    end
    always begin
        #19;
        addra = addra + 17'b1;
    end
endmodule