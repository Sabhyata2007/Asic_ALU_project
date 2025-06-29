TOP_MODULE = alu
SRC = alu.v tb_alu.v
OUT = alu_tb.vvp
DUMP = dump.vcd

all: simulate

simulate: $(OUT)
	./$(OUT)

$(OUT): $(SRC)
	iverilog -o $(OUT) $(SRC)

wave:
	gtkwave $(DUMP)

clean:
	rm -f $(OUT) $(DUMP)
