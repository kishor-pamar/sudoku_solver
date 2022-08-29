`timescale 1ns / 1ns
module candidate(
    input clk,reset,pl,
    output reg [1:4*3]out_put
);
reg [1:81*4]in;
reg [1:10]pr[1:81];//1-9 indicates number,10th indicates 0
reg [1:4]ar[1:81];
reg [3:1]state,next_state=0;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;
integer j,k,c,m,l,q,w;
integer i=1,zx=1,px=1;

initial begin
 for(m=1;m<=81;m=m+1)begin
      pr[m]=10'b0000000000;
 end
end

always@(posedge clk)
begin
    state=next_state;
    case(state)
    s0:begin
        state=s0;
        if(reset==1)begin
          next_state=s1;
          k=0;
          c=0;
          in=324'h380900205000008730060300980000003501910507023703100000035001090074600000801002067;
         end
    end
    s1:begin
        {ar[1],ar[2],ar[3],ar[4],ar[5],ar[6],ar[7],ar[8],ar[9]}=in[1:4*9];
        {ar[10],ar[11],ar[12],ar[13],ar[14],ar[15],ar[16],ar[17],ar[18]}=in[9*4+1:4*18];
        {ar[19],ar[20],ar[21],ar[22],ar[23],ar[24],ar[25],ar[26],ar[27]}=in[18*4+1:4*27];
        {ar[28],ar[29],ar[30],ar[31],ar[32],ar[33],ar[34],ar[35],ar[36]}=in[4*27+1:4*36];
        {ar[37],ar[38],ar[39],ar[40],ar[41],ar[42],ar[43],ar[44],ar[45]}=in[4*36+1:4*45];
        {ar[46],ar[47],ar[48],ar[49],ar[50],ar[51],ar[52],ar[53],ar[54]}=in[4*45+1:4*54];
        {ar[55],ar[56],ar[57],ar[58],ar[59],ar[60],ar[61],ar[62],ar[63]}=in[4*54+1:4*63];
        {ar[64],ar[65],ar[66],ar[67],ar[68],ar[69],ar[70],ar[71],ar[72]}=in[4*63+1:4*72];
        {ar[73],ar[74],ar[75],ar[76],ar[77],ar[78],ar[79],ar[80],ar[81]}=in[4*72+1:4*81];
        next_state=s2;
    end
    s2:begin
        if(ar[i][1]==0 && ar[i][2]==0 && ar[i][3]==0 && ar[i][4]==0)begin
           pr[i][10]=1;
        end
        else begin
            //rows
            pr[i][10]=0;
            if(i<=9)begin
               {pr[1][ar[i]],pr[2][ar[i]],pr[3][ar[i]],pr[4][ar[i]],pr[5][ar[i]],pr[6][ar[i]],pr[7][ar[i]],pr[8][ar[i]],pr[9][ar[i]]}=9'b111111111;
            end
            else if(i>9 && i<=18)begin
               {pr[10][ar[i]],pr[11][ar[i]],pr[12][ar[i]],pr[13][ar[i]],pr[14][ar[i]],pr[15][ar[i]],pr[16][ar[i]],pr[17][ar[i]],pr[18][ar[i]]}=9'b111111111;
            end
            else if(i>18 && i<=27)begin
               {pr[19][ar[i]],pr[20][ar[i]],pr[21][ar[i]],pr[22][ar[i]],pr[23][ar[i]],pr[24][ar[i]],pr[25][ar[i]],pr[26][ar[i]],pr[27][ar[i]]}=9'b111111111;
            end
            else if(i>27 && i<=36)begin
               {pr[28][ar[i]],pr[29][ar[i]],pr[30][ar[i]],pr[31][ar[i]],pr[32][ar[i]],pr[33][ar[i]],pr[34][ar[i]],pr[35][ar[i]],pr[36][ar[i]]}=9'b111111111;
            end
            else if(i>36 && i<=45)begin
               {pr[37][ar[i]],pr[38][ar[i]],pr[39][ar[i]],pr[40][ar[i]],pr[41][ar[i]],pr[42][ar[i]],pr[43][ar[i]],pr[44][ar[i]],pr[45][ar[i]]}=9'b111111111;
            end
            else if(i>45 && i<=54)begin
               {pr[46][ar[i]],pr[47][ar[i]],pr[48][ar[i]],pr[49][ar[i]],pr[50][ar[i]],pr[51][ar[i]],pr[52][ar[i]],pr[53][ar[i]],pr[54][ar[i]]}=9'b111111111;
            end
            else if(i>54 && i<=63)begin
                {pr[55][ar[i]],pr[56][ar[i]],pr[57][ar[i]],pr[58][ar[i]],pr[59][ar[i]],pr[60][ar[i]],pr[61][ar[i]],pr[62][ar[i]],pr[63][ar[i]]}=9'b111111111;
            end
            else if(i>63 && i<=72)begin
                {pr[64][ar[i]],pr[65][ar[i]],pr[66][ar[i]],pr[67][ar[i]],pr[68][ar[i]],pr[69][ar[i]],pr[70][ar[i]],pr[71][ar[i]],pr[72][ar[i]]}=9'b111111111;
            end
            else if(i>72 && i<=81)begin
                {pr[73][ar[i]],pr[74][ar[i]],pr[75][ar[i]],pr[76][ar[i]],pr[77][ar[i]],pr[78][ar[i]],pr[79][ar[i]],pr[80][ar[i]],pr[81][ar[i]]}=9'b111111111;
            end
        end
        if(i==81)begin
          next_state=s3;
          i=1;
        end
        else begin
            next_state=s2;
            i=i+1;
        end
    end
    s3:begin
        //column
        if(ar[i]!=0)begin
            if(i<=9)begin
                {pr[i+9][ar[i]],pr[i+9*2][ar[i]],pr[i+9*3][ar[i]],pr[i+9*4][ar[i]],pr[i+9*5][ar[i]],pr[i+9*6][ar[i]],pr[i+9*7][ar[i]],pr[i+9*8][ar[i]]}=9'b111111111;
            end
            else if(i>9 && i<=18)begin
                {pr[i-9][ar[i]],pr[i+9][ar[i]],pr[i+9*2][ar[i]],pr[i+9*3][ar[i]],pr[i+9*4][ar[i]],pr[i+9*5][ar[i]],pr[i+9*6][ar[i]],pr[i+9*7][ar[i]]}=9'b111111111;
            end
            else if(i>18 && i<=27)begin
                 {pr[i-9*2][ar[i]],pr[i-9][ar[i]],pr[i+9][ar[i]],pr[i+9*2][ar[i]],pr[i+9*3][ar[i]],pr[i+9*4][ar[i]],pr[i+9*5][ar[i]],pr[i+9*6][ar[i]]}=9'b111111111;
            end
            else if(i>27 && i<=36)begin
                 {pr[i-9*3][ar[i]],pr[i-9*2][ar[i]],pr[i-9][ar[i]],pr[i+9][ar[i]],pr[i+9*2][ar[i]],pr[i+9*3][ar[i]],pr[i+9*4][ar[i]],pr[i+9*5][ar[i]]}=9'b111111111;
            end
            else if(i>36 && i<=45)begin
                 {pr[i-9*4][ar[i]],pr[i-9*3][ar[i]],pr[i-9*2][ar[i]],pr[i-9][ar[i]],pr[i+9][ar[i]],pr[i+9*2][ar[i]],pr[i+9*3][ar[i]],pr[i+9*4][ar[i]]}=9'b111111111;
            end
            else if(i>45 && i<=54)begin
                 {pr[i-9*5][ar[i]],pr[i-9*4][ar[i]],pr[i-9*3][ar[i]],pr[i-9*2][ar[i]],pr[i-9][ar[i]],pr[i+9][ar[i]],pr[i+9*2][ar[i]],pr[i+9*3][ar[i]]}=9'b111111111;
            end
            else if(i>54 && i<=63)begin
                 {pr[i-9*6][ar[i]],pr[i-9*5][ar[i]],pr[i-9*4][ar[i]],pr[i-9*3][ar[i]],pr[i-9*2][ar[i]],pr[i-9][ar[i]],pr[i+9][ar[i]],pr[i+9*2][ar[i]]}=9'b111111111;
            end
            else if(i>63 && i<=72)begin
                 {pr[i-9*7][ar[i]],pr[i-9*6][ar[i]],pr[i-9*5][ar[i]],pr[i-9*4][ar[i]],pr[i-9*3][ar[i]],pr[i-9*2][ar[i]],pr[i-9][ar[i]],pr[i+9][ar[i]]}=9'b111111111;
            end
            else if(i>72 && i<=81)begin
                 {pr[i-9*8][ar[i]],pr[i-9*7][ar[i]],pr[i-9*6][ar[i]],pr[i-9*5][ar[i]],pr[i-9*4][ar[i]],pr[i-9*3][ar[i]],pr[i-9*2][ar[i]],pr[i-9][ar[i]]}=9'b111111111;
            end
        end
        if(i==81)begin
          next_state=s4;
          i=1;
        end
        else begin
            next_state=s3;
            i=i+1;
        end
    end
    s4:begin
        //box
        if(ar[i]!=0)begin
            if(i<3 || (i>9 && i<=12) || (i>18 && i<=21))begin
                {pr[1][ar[i]],pr[2][ar[i]],pr[3][ar[i]],pr[10][ar[i]],pr[11][ar[i]],pr[12][ar[i]],pr[19][ar[i]],pr[20][ar[i]],pr[21][ar[i]]}=9'b111111111;
            end
            else if(i>3 && i<=6)begin
                {pr[4][ar[i]],pr[5][ar[i]],pr[6][ar[i]],pr[13][ar[i]],pr[14][ar[i]],pr[15][ar[i]],pr[22][ar[i]],pr[23][ar[i]],pr[24][ar[i]]}=9'b111111111;
            end
            else if(i>6 && i<=9)begin
                {pr[7][ar[i]],pr[8][ar[i]],pr[9][ar[i]],pr[16][ar[i]],pr[17][ar[i]],pr[18][ar[i]],pr[25][ar[i]],pr[26][ar[i]],pr[27][ar[i]]}=9'b111111111;
            end
            else if(i>27 && i<=30)begin
                {pr[28][ar[i]],pr[29][ar[i]],pr[30][ar[i]],pr[37][ar[i]],pr[38][ar[i]],pr[39][ar[i]],pr[46][ar[i]],pr[47][ar[i]],pr[48][ar[i]]}=9'b111111111;
            end
            else if(i>30 && i<=33)begin
                {pr[31][ar[i]],pr[32][ar[i]],pr[33][ar[i]],pr[40][ar[i]],pr[41][ar[i]],pr[42][ar[i]],pr[49][ar[i]],pr[50][ar[i]],pr[51][ar[i]]}=9'b111111111;
            end
            else if(i>33 && i<=36)begin
                {pr[34][ar[i]],pr[35][ar[i]],pr[36][ar[i]],pr[43][ar[i]],pr[44][ar[i]],pr[45][ar[i]],pr[52][ar[i]],pr[53][ar[i]],pr[54][ar[i]]}=9'b111111111;
            end
            else if(i>54 && i<=57)begin
                {pr[55][ar[i]],pr[56][ar[i]],pr[57][ar[i]],pr[64][ar[i]],pr[65][ar[i]],pr[66][ar[i]],pr[73][ar[i]],pr[74][ar[i]],pr[75][ar[i]]}=9'b111111111;
            end
            else if(i>57 && i<=60)begin
                {pr[58][ar[i]],pr[59][ar[i]],pr[60][ar[i]],pr[67][ar[i]],pr[68][ar[i]],pr[69][ar[i]],pr[76][ar[i]],pr[77][ar[i]],pr[78][ar[i]]}=9'b111111111;
            end
            else if(i>60 && i<=63)begin
                {pr[61][ar[i]],pr[62][ar[i]],pr[63][ar[i]],pr[70][ar[i]],pr[71][ar[i]],pr[72][ar[i]],pr[79][ar[i]],pr[80][ar[i]],pr[81][ar[i]]}=9'b111111111;
            end
        end
        if(i==63)begin
            next_state=s5;
            i=1;
            w=0;
        end
        else begin
          i=i+1;
          next_state=s4;
        end
    end
    s5:begin
        if(pr[i][10]==1)begin
           for(j=1;j<10;j=j+1)begin
               if(pr[i][j]==0)begin
                 c=c+1;
                 k=j;
               end
           end
           if(c==1)begin
               ar[i]=k;
           end
        end
        if(i==81)begin
            for(q=1;q<=81;q=q+1)begin
                if(ar[q]==0)begin
                    w=w+1;
                end
            end
            if(w==0)begin
                next_state=s6;
                i=1;
            end
            else begin
                next_state=s2;
                i=1;
            end
        end
        else begin
           i=i+1;
           k=0;
           c=0;
        end
    end
    s6:begin
        if(zx==82)begin
          next_state=s0;
        end
    end
    endcase
end 
always@(posedge pl)
begin
if(state==s6)
    begin
    if(zx<82) begin
         out_put={ar[zx],ar[zx+1],ar[zx+2]};
         zx=zx+3;
       end
      else begin
         zx=1;
       end
     end
end
endmodule
