`include "../include/define.svh"
`include "BitRev.sv"

module AGU(
    input clk,
    input rst,
    input AGU_enable,

    output logic [`D_width-1:0] Order,
    output logic AGU_out_en,
    output logic AGU_done
);

    logic [`D_width-1:0] l, j, i, m;
    logic [`D_width-1:0] j_upper, i_upper;
    logic [`D_width-1:0] tmp1, tmp2, BitRev_out_j;
    logic [`D_width-1:0] tmp1_pip, tmp2_pip, m_pip, i_pip;

    parameter m_upper = (1 << `radix_k1) - 'd1;
    parameter l_upper = `k - 1;

    always_comb begin
        if (rst) begin
            i_upper <= 'd0;
        end else begin
            i_upper <= (1 << (`logn - `radix_k1*(l+1)) ) - 'd1;
            //i_upper <= 'd511;
        end
    end

    always_comb begin
        if (rst) begin
            j_upper <= 'd0;
        end else begin
            j_upper <= (1 << (`radix_k1*l) ) - 'd1;
        end
    end


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            l <= 'd0;
            AGU_done <= 'd0;
        end else begin
            if (AGU_enable) begin
                if (j == j_upper && i == i_upper && m == m_upper && l < l_upper) begin
                    l <= l + 'd1;
                    AGU_done <= 'd0;
                end else begin
                    if (m == m_upper && i == i_upper && j == j_upper && l == l_upper) begin
                        l <= 'd0;
                        AGU_done <= 'd1;
                    end else begin
                        l <= l;
                        AGU_done <= 'd0;
                    end
                end
            end else begin
                l <= 'd0;
                AGU_done <= 'd0;
            end
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            j <= 'd0;
        end else begin
            if (AGU_enable) begin
                if (i == i_upper && m == m_upper && j < j_upper) begin
                    j <= j + 'd1;
                end else begin
                    if (m == m_upper && i == i_upper && j == j_upper) begin
                        j <= 'd0;
                    end else begin
                        j <= j;
                    end
                end
            end else begin
                j <= 'd0;
            end
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            i <= 'd0;
        end else begin
            if (AGU_enable) begin
                if (m == m_upper && i < i_upper) begin
                    i <= i + 'd1;
                end else begin
                    if (m == m_upper && i == i_upper) begin
                        i <= 'd0;
                    end else begin
                        i <= i;
                    end
                end
            end else begin
                i <= 'd0;
            end
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            m <= 'd0;
        end else begin
            if (AGU_enable) begin
                if (m < m_upper) begin
                    m <= m + 'd1;
                end else begin
                    m <= 'd0;
                end
            end else begin
                m <= 'd0;
            end
        end
    end

    BitRev BitRev1(
        .input_idx(j),
        .BitRev_enable(AGU_enable),
        .l(l),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j)
    );

    always_comb begin
        if (AGU_enable) begin
            tmp1 = 1'd1 << ((`logn) - `radix_k1*l);
            tmp2 = 1'd1 << ((`logn) - `radix_k1*(l+1));
        end else begin
            tmp1 = 'd0;
            tmp2 = 'd0;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            tmp1_pip <= 'd0;
            tmp2_pip <= 'd0;
            m_pip <= 'd0;
            i_pip <= 'd0;
            AGU_out_en <= 'd0;
        end else begin
            tmp1_pip <= tmp1;
            tmp2_pip <= tmp2;
            m_pip <= m;
            i_pip <= i;
            AGU_out_en <= AGU_enable;
        end
    end

    always_comb begin
        Order = (BitRev_out_j * tmp1_pip) + (m_pip * tmp2_pip) + i_pip;
    end

endmodule