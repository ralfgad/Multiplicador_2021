/* testbech basico del multiplicador para entender como funciona el
	multipli_parallel.sv que puede usarse como Golden Model en el diseño de
	un multiplicador de Booth
	
	Autor:Marcos Martinez Peiro
	mpeiro@eln.upv.es
	*/
	
	`timescale 1ns/1ps
	
	module tb_multipli();
	parameter period=20;
	parameter tamano=8;
	parameter cycles=8;
	
logic CLOCK, RESET;
logic START;
logic signed[tamano-1:0] A, B;
logic signed[2*tamano-1:0] S;
logic END_MULT;	

//DUT. Parametriza el tamano de operandos y el numero de ciclos para obtener el resultado
multipli_parallel #(tamano,cycles) multipli_8_4 (.*);


initial
begin
  $dumpfile("test_01.vcd");
  $dumpvars;
end

initial
begin
CLOCK=0;
RESET=1;
START=0;
#10 RESET=0;
#40 RESET=1;

//caso 1
A= -5;B= 6;
multiplica (A,B);

//caso 2
A= -5;B= -20;
multiplica (A,B);

//caso 3
A=255;B=2;
multiplica(A,B);

//caso 4
A=-1;B=2;
multiplica(A,B);

//caso 5
A=127;B=100;
multiplica(A,B);

//caso 6
A=12;B=-100;
multiplica(A,B);


$stop;

end

/* -------------------------------------------------------------- //
	La tarea multiplica inicia la multiplicacion,
	espera los ciclos necesarios hasta que termine de multiplicar
	y chequea si el resultado es el esperado
	-------------------------------------------------------------- */
task automatic multiplica (input signed[tamano-1:0] A,B);

	begin
	START=1;
	@(posedge CLOCK);
	START=0;
	while (END_MULT==0) @(posedge CLOCK);
	if (S!=A*B) $error("La multiplicacion de %d por %d esta mal, debe dar %d y da %d\n",A,B,A*B,S);
	else $display("Multiplicacion de %d por %d  = %02d\n",A,B,S);
	end
endtask
	


always
begin
#(period/2) CLOCK=~CLOCK;
end
	
endmodule
	