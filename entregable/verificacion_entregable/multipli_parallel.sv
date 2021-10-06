// --------------------------------------------------------------------
// Universitat Politecnica de Valencia
// Escuela Tecnica Superior de Ingenieros de Telecomunicacion
// --------------------------------------------------------------------
// Integracion de Sistemas Digitales
// Curso 2018 - 2019
// --------------------------------------------------------------------
// Nombre del archivo: multipli_parallel.sv
//
// Descripcion: Este codigo SystemVerilog implementa un multiplicador
// de tamanyo parametrizable pero paralelo para que los alumnos puedan empezar a testear rápìdo
//
// --------------------------------------------------------------------
// Versión: V1.0 | Fecha Modificación: 01/10/2018
//
// Autores: Marcos Martínez Peiró
// --------------------------------------------------------------------
module multipli_parallel(CLOCK, RESET, END_MULT, A, B, S, START);
parameter tamano=8; 	//tamano de operandos
parameter cycles=4;	//ciclos para completar la multiplicacion

input CLOCK, RESET;
input logic START;
input logic signed[tamano-1:0] A, B;
output logic signed[2*tamano-1:0] S;
output logic END_MULT;

logic [$clog2(tamano-1):0] c_cycles;
logic flag_start;

logic signed [2*tamano-1:0] S_aux;


// multiplicacion ideal sin retardos
assign S_aux=A*B;

//generacion de retardos en END_MULT y multiplicacion final

always_ff @(posedge CLOCK, negedge RESET)
if (!RESET)
	begin
		c_cycles<=0;flag_start<=0;
	end
else if (START)
		flag_start<=1;
else if (flag_start)
	begin
	if (c_cycles==cycles-1)

		begin
		c_cycles<=0;
		flag_start<=0;
		assert (S==A*B) else $error("La multiplicacion no funciona\n"); //ejemplo de asercion inmediata
		end
	else
		c_cycles<=c_cycles+1;
	end

	
assign END_MULT=(c_cycles==cycles-1)?1'b1:1'b0;	
assign S=(END_MULT)?S_aux:0;

assert property (@(negedge CLOCK) disable iff (!RESET || c_cycles!=cycles-1 || $isunknown(A || B || S)) (END_MULT==1 && S==A*B))
	else $error("La multiplicacion no funciona\n"); //ejemplo de asercion concurrente|  

endmodule
