`timescale 1ns / 10ps

module rom2(wb_clk_i, wb_rst_i, wb_adr_i, wb_dat_i, wb_dat_o, wb_we_i,
  wb_stb_i, wb_cyc_i, wb_ack_o);

  input  wb_clk_i;
  input  wb_rst_i;
  input [1:0] wb_adr_i;
  input [7:0] wb_dat_i;
  input  wb_we_i;
  input  wb_stb_i;
  input  wb_cyc_i;
  output [7:0] wb_dat_o;
  output  wb_ack_o;
  reg [7:0] wb_dat_o;
  wire [7:0] zero;
  wire [7:0] one;
  wire [7:0] two;
  wire [7:0] three;

   assign zero  = 8'd65;
   assign one   = 8'd66;
   assign two   = 8'd67;
   assign three = 8'd10;

  assign wb_ack_o = wb_cyc_i && wb_stb_i;
  always @(wb_adr_i or zero or one or two or three)
    case (wb_adr_i)
      0: wb_dat_o = zero;
      1: wb_dat_o = one;
      2: wb_dat_o = two;
      3: wb_dat_o = three;
      default: wb_dat_o = 0;
    endcase

endmodule
