#include <stdlib.h>
#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
//#include <stduint8_t.h>
#include <math.h>
#include <fpu.h>
#include "prog.h"


#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif
//-------------------------------------------------------------------------------------------------
//
//
	uint16_t mem1[20000];
	uint16_t mem2[20000];
	uint16_t mem3[20000];
	uint16_t mem4[20000];
	uint16_t maxNitr    ;
	float   ebbyNo    ; 
	float code_block1[13000];
	float code_block2[13000];
	float aPriori1[13000];	// aPriori matrix
	float aPriori2[13000];	// aPriori matrix
	float message11[20000] ; 
	float message12[20000] ;
	float message21[20000] ;
	float message22[20000] ;
	float aPosteriori1[13000];
	float aPosteriori2[13000];
	float ext_info11[20000];
	float ext_info12[20000];
	float ext_info21[20000];
	float ext_info22[20000];
	float transverse_info11_12[20000];
	float transverse_info22_21[20000];
	float transverse_info12_11[20000];
	float transverse_info21_22[20000];
	//
	//
	ParityCheckMatrix pm11;
	ParityCheckMatrix pm12;
	ParityCheckMatrix pm21;
	ParityCheckMatrix pm22;

	ParityCheckMatrix* pm_p11 = &pm11;
	ParityCheckMatrix* pm_p12 = &pm12;
	ParityCheckMatrix* pm_p21 = &pm21;
	ParityCheckMatrix* pm_p22 = &pm22;
	
	
void initInputs()
{
	//
	// reading maxinum number of iteration
	uint16_t nitr = read_uint16("maxNitr_in");
	maxNitr = nitr ;
#ifdef SW
	fprintf(stderr,"Info:read maxNitr = %d\n", nitr);
#endif
	//
	// reading signal to noise power ration
	float SNR = read_float32("ebbyNo_in"); 
	ebbyNo = SNR ;
#ifdef SW
	fprintf(stderr,"Info:read SNR = %f\n", SNR);
#endif
	//
	// Populating mem with parity check matrix H11
	initMem(mem1) ;
	//
	// Populating mem2 with parity check matrix H12	
	initMem(mem2) ;
	//
	// Populating mem3 with parity check matrix H21	
	initMem(mem3) ;
	//
	// Populating mem4 with parity check matrix H22	
	initMem(mem4) ;

}
//--------------------------------------------------------------------

//
//
void initMem( uint16_t* mem )
{
uint16_t I,val,range;
	for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem[I] = val ; 
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
		
	range = (mem[2]+mem[0]) ;
	
	for(I = 0; I < range ; I++)
		{
		val = read_uint16("matrix_in");
		mem[I+3] = val ;
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val);
#endif
		} 
}

//---------------------------------------------------------------------------

//
// reading the input parity check matrix in structure
void readMatrix( ParityCheckMatrix* pm_p , uint16_t* mem) 
{
	uint16_t nrows, ncols ;
	uint16_t ncol_ind ;

	pm_p->nrows = mem[0];
	pm_p->ncols = mem[1];
	pm_p->ncol_ind = mem[2];
	pm_p->col_ind = &(mem[3]) ;
	pm_p->row_ptr = &( mem[ (3+mem[2]) ] ) ;

}
//
//---------------------------------------------------------------------------------------

//
// reading code block to decode
void readCodeBlock ( ParityCheckMatrix* pm_p, float* code_block)
{
	uint16_t I;	
	for(I = 0; I < (pm_p->ncols); I++)
			{
			float code_bit = read_float32("code_block_in");
#ifdef SW
			fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
#endif
			code_block[I] = code_bit ;
			}
}
//
//---------------------------------------------------------------------------------------------- 

/*
// Min sum algorithm to decode the code block	:
void minSumDecode( uint16_t max_nitr, ParityCheckMatrix* pm_p11, ParityCheckMatrix* pm_p12,\
								ParityCheckMatrix* pm_p21, ParityCheckMatrix* pm_p22,\
								float* code_block1,\
								float* code_block2,\
								float ebbyNo)
{


}
*/
//------------------------------------------------------------------------------------------------------
/*
//
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a piosteriori probabilities.
// return the decode status of the code block.
void checkIsdecoded( uint16_t pmNcols, float* code_block , float* aPosteriori , uint8_t* is_decoded_p ) 
{
											// is_decoded : variable indicated if block is \
												// fully decoded or require further iteration0.
	uint16_t I;
	for( I = 0 ; I < pmNcols ; I++)
		{
 
//	 iterating through all code bits	:
		if ( aPosteriori[I] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block[I] > 0.0)		// indicates that code bit is 1 at present.
				{
				*is_decoded_p = 0;				// flags that a bit got flipped while decoding.
				}
			code_block[I] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori[I] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block[I] < 0.0)		// indicates that code bit is 0 at present.
				{	
				*is_decoded_p = 0;				// flags that a bit got flipped while decoding.
				}
			code_block[I] = 1.0;			// modifies the code bit.
			}
		}
}
*/
//-------------------------------------------------------------------------------------------------------------

//
//	function to update the bit node information (message) according to a posteriori probability and extrinsic information.
void updateMessage ( ParityCheckMatrix* pm_p, float* ext_info, float* aPosteriori, float* message )
{
		uint16_t* chk_node_bit_p;					// pointer points first bit node corrosponding to a check
		uint16_t row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
				{
				//
				// iterating through all the check node.
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					if ( row == (pm_p->nrows-1) )
						{
						//
						// true for last check node only.
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							//
							//	iterating through all the bit nodes of a check node and updating message.
								message [ (pm_p->row_ptr[row]-1) + col ] =  \
								aPosteriori[ chk_node_bit_p[col]-1] - 		\
								ext_info [(pm_p->row_ptr[row]-1) + col] ;
//	printf (" message(%d) = %lf",(pm_p->row_ptr[row]-1) + col,message [ (pm_p->row_ptr[row]-1) + col ] );
							}
						}
					else 
						{
						//
						// true for all the check nodes except last check node.
						for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
							{
							//
							//	iterating through all the bit nodes of a check node and updating message.
							message [ (pm_p->row_ptr[row]-1) + col ] =    \
							aPosteriori[ chk_node_bit_p[col]-1]  -  	  \
							ext_info [(pm_p->row_ptr[row]-1) + col] ;
//	printf (" message(%d) = %lf",(pm_p->row_ptr[row]-1) + col,message [ (pm_p->row_ptr[row]-1) + col ] );
							}
						}
				}
}

//-----------------------------------------------------------------------------------------------------------------

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine ( ParityCheckMatrix* pm_p, float* message, float* ext_info, float* transverse_info)
{
		uint16_t* chk_node_bit_p;						// pointer points first bit node corrosponding to a check
		uint16_t row,col;
		uint16_t range_rows = pm_p->nrows ;
		for ( row = 0 ; row < range_rows ; row++ )
			{
			//
		    // iterating through all the check node.						
			chk_node_bit_p = &( pm_p->col_ind[ (pm_p->row_ptr[row]-1) ] ) ;
			if ( row == ((pm_p->nrows)-1) )
				{
				//
				// true for last check node only
				if ( CHECK_BIT_COUNT1 > 1)
				{
				//
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					// iterating through all the bit nodes corrosponding to a check 
					uint16_t I;
					float val ;				// represents magnitude of the extrensic information.
					uint8_t flag = 0 ; 				// represents first iteration through the inner most loop.
					uint8_t exor = 0;				// represents sign of the extrinsic information.
					int sign ; 
					for ( I = 0 ; I < CHECK_BIT_COUNT1 ; I++)
						{
						//
						// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		    			// iterating through all the bit nodes corrosponding to a perticular check node.
						if ( I == col)
						{
						//
						// excluding self inforamtion for calculation of extrinsic info.			
						if ( col == 0 )
							{			
							transverse_info[row] = message[ (pm_p->row_ptr[row]-1) + I] ;  // initaializing transverse info
							}
						continue;
						}
						else
							{
							//
							// finding sign of the extrinsic information 
							if ( message[ (pm_p->row_ptr[row]-1) + I] >= 0 )
								{
								exor = exor ^ 0 ;
								} 
							else if ( message[ (pm_p->row_ptr[row]-1) + I] < 0 )
								{
								exor = exor ^ 1 ; 
								}
								
							// finding minimum of the messages to update magnitude of the extrinsic information.
							if (flag == 0)
								{
								// 
								// true for first iteration to initialize the magnitude of the extrinsic information.
								val = absf(message[ (pm_p->row_ptr[row]-1) + I]);
								}
							else
								{
								if ( absf(message[ (pm_p->row_ptr[row]-1) + I]) < val )
									{
									val = absf(message[ (pm_p->row_ptr[row]-1) + I]) ; 
									}
								}
							} 
						//
						// update flag to represent that this is not the first iteration to the inner loop.	
						flag = 1 ;
						}
					//
					//	if exor = 0	: sign of extrinsic information is positive
					//  if exor = 1 : sign of extrinsic information is negative
					sign = (exor == 0)?1:-1;
					//
					//	Evaluating extrinsic information 
					ext_info[ (pm_p->row_ptr[row]-1) + col ] = val * sign ;
					if (col == 0)
						{
						//
						// modifing transverse_info for a check node
						transverse_info[row] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ] , transverse_info[row]);
						//printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
						}
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					//
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 	
					}
				}
				else if ( CHECK_BIT_COUNT1 == 1)
					{
					transverse_info[row] = message[ (pm_p->row_ptr[row]-1) ] ;
					//printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
					}
				}
			else
				{
				if (CHECK_BIT_COUNT2 > 1)
				{
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					// iterating through all the bit nodes corrosponding to a check 
					uint16_t I;
					float val ;				// represents magnitude of the extrensic information.
					uint8_t flag = 0 ; 				// represents first iteration through the inner most loop.
					uint8_t exor = 0;				// represents sign of the extrinsic information.
					int sign ; 
					for ( I = 0 ; I < CHECK_BIT_COUNT2 ; I++)
						{
						//
						// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		    			// iterating through all the bit nodes corrosponding to a perticular check node.
						if ( I == col)
						{
						//
						// excluding self inforamtion for calculation of extrinsic info.			
						if ( col == 0 )
							{			
							transverse_info[row] = message[ (pm_p->row_ptr[row]-1) + I] ;  // initaializing transverse info
							}
						continue;
						}
						else
							{
							//
							// finding sign of the extrinsic information 
							if ( message[ (pm_p->row_ptr[row]-1) + I] >= 0 )
								{
								exor = exor ^ 0 ;
								} 
							else if ( message[ (pm_p->row_ptr[row]-1) + I] < 0 )
								{
								exor = exor ^ 1 ; 
								}
								
							// finding minimum of the messages to update magnitude of the extrinsic information.
							if (flag == 0)
								{
								// 
								// true for first iteration to initialize the magnitude of the extrinsic information.
								val = absf(message[ (pm_p->row_ptr[row]-1) + I]);
								}
							else
								{
								if ( absf(message[ (pm_p->row_ptr[row]-1) + I]) < val )
									{
									val = absf(message[ (pm_p->row_ptr[row]-1) + I]) ; 
									}
								}
							} 
						//
						// update flag to represent that this is not the first iteration to the inner loop.	
						flag = 1 ;
						}
					//
					//	if exor = 0	: sign of extrinsic information is positive
					//  if exor = 1 : sign of extrinsic information is negative
					sign = (exor == 0)?1:-1;
					//
					//	Evaluating extrinsic information 
					ext_info[ (pm_p->row_ptr[row]-1) + col ] = val * sign ;
					if (col == 0)
						{
						//
						// modifing transverse_info for a check node
						transverse_info[row] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ] , transverse_info[row]);
						//printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
						}
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
					//
					// Modify posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 	
					}
			}
			else if ( CHECK_BIT_COUNT2 == 1)
				{
				transverse_info[row] = message[ (pm_p->row_ptr[row]-1) ] ;
			   //printf( "trasnverse_info( %d ) = %lf \t", row , transverse_info[row] ) ;
				}
			}
		}
			
}

//-------------------------------------------------------------------------------------------------------------------------

//
//
//
void transverseCorrection ( ParityCheckMatrix* pm_p, float* transverse_info , float* ext_info, float* aPosteriori)
{
		uint16_t* chk_node_bit_p;						// pointer points first bit node corrosponding to a check
		uint16_t row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
			//
		    // iterating through all the check node.						
			chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
			if ( row == (pm_p->nrows-1) )
				{
				//
				// true for last check node only
				if  ( CHECK_BIT_COUNT1 > 1) 
					{
					//
					// if only more than one edge is connected then exterinsic info can be calculated
					// case is possible after partitioning
					if ( transverse_info[row] !=0 )
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ],\
																							 transverse_info[row] ) ;
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}
					else
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = ext_info[ (pm_p->row_ptr[row]-1) + col ] ; // dummy statement
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}				
					}
				else if ( CHECK_BIT_COUNT1 == 1)
					{
					ext_info[ (pm_p->row_ptr[row]-1) ] = transverse_info[row] ; 
					//printf( "ext_info( %d) = %lf \t", row  , ext_info[ (pm_p->row_ptr[row]-1)  ] ) ;
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					//aPosteriori[chk_node_bit_p[0]-1 ] += ext_info[ (pm_p->row_ptr[row]-1)  ] ;
					}
				}

			else
				{
				//
				// true for last check node only
				if  ( CHECK_BIT_COUNT2 > 1) 
					{
					//
					// if only more than one edge is connected then exterinsic info can be calculated
					// case is possible after partitioning
					if ( transverse_info[row] !=0 )
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = modifyInfo (ext_info[ (pm_p->row_ptr[row]-1) + col ],\
																							 transverse_info[row] ) ;
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}
					else
						{
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
							ext_info[ (pm_p->row_ptr[row]-1) + col ] = ext_info[ (pm_p->row_ptr[row]-1) + col ] ; // dummy statement
							//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm_p->row_ptr[row]-1) + col ] ) ;
											// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
							//aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ;
							}
						}				
					}
				else if ( CHECK_BIT_COUNT2 == 1)
					{
					ext_info[ (pm_p->row_ptr[row]-1) ] = transverse_info[row] ; 
					//printf( "ext_info( %d) = %lf \t", row  , ext_info[ (pm_p->row_ptr[row]-1)  ] ) ;
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					//aPosteriori[chk_node_bit_p[0]-1 ] += ext_info[ (pm_p->row_ptr[row]-1)  ] ;
					}
				}
			}
			
}

//-------------------------------------------------------------------------------------------------------------------------

//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
void initializeMessage ( ParityCheckMatrix* pm_p, float* aPriori, float* message )
{
	uint16_t* chk_node_bit_p;  								// pointer points first bit node corrosponding to a check
	uint16_t row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
			//
			// itratating to all the check nodes
			if ( row == (pm_p->nrows-1) ) 				
				{
				//
				// true for last check node only.
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					// iterating through all the bit nodes of the last check node to initialize message.
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					message [ (pm_p->row_ptr[row]-1) + col ] = aPriori[ chk_node_bit_p[col]-1] ;
//					printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm_p->row_ptr[row]-1) + col ]) ;
					}
				}
			else 
				{
				//
				// true for all check nodes except last check node.
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					// iterating through all the bit nodes of the last check node to initialize message.
					chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
					message [ (pm_p->row_ptr[row]-1) + col ] = aPriori[ chk_node_bit_p[col]-1] ;
//					printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm_p->row_ptr[row]-1) + col ]) ;
					}
				}
			}
}			
			
//-------------------------------------------------------------------------------------------------------------------

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori ( ParityCheckMatrix* pm_p, float* aPriori, float* aPosteriori )
{		
uint16_t I;
for ( I = 0 ; I < pm_p->ncols ; I++)
			{
			aPosteriori[I] = aPriori[I] ;
			}
}

//----------------------------------------------------------------------------------------------------------------

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo ( ParityCheckMatrix* pm_p, float* ext_info )
{
uint16_t I;
		for ( I = 0 ; I < pm_p->ncol_ind ; I++)
			{
			ext_info[I] = 0;
			}
}

//---------------------------------------------------------------------------------------------------------------

//
// initializing apriori probabilities
void initialize_aPriori ( ParityCheckMatrix* pm_p, float* code_block , float ebbyNo , float* aPriori)
{
	uint16_t I;
	
	float sigma2 ;
	
	float rate ;
//	
//	calculating rate of code	:
	rate = (float) ((pm_p->ncols)-(pm_p->nrows))/(pm_p->ncols); 
	
	sigma2 = 1/(2*rate*ebbyNo) ;
	
//	printf(" rate = %lf , ebbyNodb = %lf , ebbyNo = %lf , sigma2 = %lf \n", rate, ebbyNodb, ebbyNo, sigma2);
//
// 	Initializing a priori probabilities	:
	for ( I = 0 ; I < pm_p->ncols ; I++ )
		{
		// It has a minus sign in contrast to papers.
		// Reason is :
		//
		// Here BPSK modulation :	0  ->  -1
		// 				1  ->   1
		//
		//
		//aPriori[I] = 4*code_block[I]/(2*sigma2) ;    // for test_matrix 
		aPriori[I] = -4*code_block[I]/(2*sigma2) ;   
		//printf(" I= %d ,  aPriori[I]=  %lf \n", I , aPriori[I]);
		}
}
//--------------------------------------------------------------------------------------------------------------------
//
//
// transverse information is calculated by taking calculating min sum at a check node.
// thus for first bit node corrosponding to a check node ie at col = 0 
// we initialize the transverse info of check node i to the message passed from check i to col = 0
// the finally extrinsic inforamtion is applied to the self inforamtion to get transverse inforamtion for a check node

float modifyInfo (float ext_info , float self_information )
{

	int sign ;
	float magnitude ;
 
	if ( ext_info >= 0 )
		{
		if ( self_information >=0 )
		sign = +1;                              // both positive 
		else
		sign = -1;
		} 
	else
		{
		if ( self_information < 0 )
		sign = +1;										// both negative
		else
		sign = -1;
		}
				
								
		// finding minimum of the messages to update magnitude of the extrinsic information.
	if ( absf( self_information ) > absf( ext_info ) )
		magnitude = absf( ext_info ) ;
	else
		magnitude = absf( self_information ) ;

return (sign*magnitude) ;
					

}

//--------------------------------------------------------------------------------------------------------------

//
//
//
void initializeTransverseInfo ( ParityCheckMatrix* pm_p, float* transverse_info )
{
		uint16_t I;
		for ( I = 0 ; I < pm_p->nrows ; I++)
			{
			transverse_info[I] = 0.0;
			}
}

//------------------------------------------------------------------------------------------------------------

//
//
//
void	update_aPosteriori ( ParityCheckMatrix* pm_p, float* ext_info , float* aPosteriori )
{

	uint16_t* chk_node_bit_p;  								// pointer points first bit node corrosponding to a check
	uint16_t row,col;
		for ( row = 0 ; row < (pm_p->nrows) ; row++ )
			{
			//
			// itratating to all the check nodes
			chk_node_bit_p = & ( pm_p->col_ind[ pm_p->row_ptr[row]-1 ]) ;
			if ( row == (pm_p->nrows-1) ) 				
				{
				//
				// true for last check node only.
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
					// iterating through all the bit nodes 
					aPosteriori[ chk_node_bit_p[col]-1] +=  ext_info[ (pm_p->row_ptr[row]-1) + col ]  ; 
					}
				}
			else 
				{
				//
				// true for all check nodes except last check node.
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
					// iterating through all the bit nodes 
					aPosteriori[ chk_node_bit_p[col]-1] += ext_info[ (pm_p->row_ptr[row]-1) + col ] ; 
					}
				}
			}
			

}
//
//----------------------------------------------------------------------------------------------------------

float absf( float f)
{
if (f < 0.0)
return (-f);
else
return (f);
}

//
//-----------------------------------------------------------------------------------------------------------

void daemon ()
{


	initInputs() ; 
	//
	//	
	readMatrix( &pm11, mem1 );
	readMatrix( &pm12, mem2 );
	readMatrix( &pm21, mem3 );
	readMatrix( &pm22, mem4 );
//	fprintf(stderr,"Info: pm11.nrow = %d , pm11.ncol = %d , pm11.ncol_ind = %d \n",pm11.nrows,pm11.ncols,pm11.ncol_ind);
//	fprintf(stderr,"Info: pm12.nrow = %d , pm12.ncol = %d , pm12.ncol_ind = %d \n",pm12.nrows,pm12.ncols,pm12.ncol_ind);
//	fprintf(stderr,"Info: pm21.nrow = %d , pm21.ncol = %d , pm21.ncol_ind = %d \n",pm21.nrows,pm21.ncols,pm21.ncol_ind);
//	fprintf(stderr,"Info: pm22.nrow = %d , pm22.ncol = %d , pm22.ncol_ind = %d \n",pm22.nrows,pm22.ncols,pm22.ncol_ind);


	uint64_t block_count = 0;	
		//
		// keep reading code blocks till they get exhausted.
		//
		//	reading code block 	
		readCodeBlock ( &pm11 , code_block1 );
		readCodeBlock ( &pm12 , code_block2 );
		block_count++;	
		

	// decoding block 
//	minSumDecode( maxNitr , & pm11, &pm12, &pm21, &pm22 ,code_block1, code_block2, ebbyNo  );	

	uint16_t nitr = 1;  // initializing number of iterations

//
// initializing apriori probabiliies	
	initialize_aPriori ( pm_p11 , code_block1 , ebbyNo , aPriori1 );
	initialize_aPriori ( pm_p12 , code_block2 , ebbyNo , aPriori2 );
		
//
// Message initialization:
//
// message contain the soft information transferred from bit nodes towards check nodes. 
// messages are stored in row compressed from similar to parity check matrix.
// thus indexed same as parity check matrix.

		
	initializeMessage ( pm_p11, aPriori1, message11 );
	initializeMessage ( pm_p12, aPriori2, message12 );
	initializeMessage ( pm_p21, aPriori1, message21 );
	initializeMessage ( pm_p22, aPriori2, message22 );

//
//	After initialization starting iterative decoding	:
	while ( nitr <= maxNitr )
		{
//
// 	Initializing a posteriori probabilities	:
		
		initialize_aPosteriori( pm_p11, aPriori1, aPosteriori1 );
		initialize_aPosteriori( pm_p12, aPriori2, aPosteriori2 );	
//
// 	Intializing the extrinsic inforamtion
		
		initializeExtrinsicInfo ( pm_p11, ext_info11 );
		initializeExtrinsicInfo ( pm_p12, ext_info12 );
		initializeExtrinsicInfo ( pm_p21, ext_info21 );
		initializeExtrinsicInfo ( pm_p22, ext_info22 );
		
		initializeTransverseInfo ( pm_p11 , transverse_info11_12 );
		initializeTransverseInfo ( pm_p22 , transverse_info22_21 );
		initializeTransverseInfo ( pm_p12 , transverse_info12_11 );
		initializeTransverseInfo ( pm_p21 , transverse_info21_22 );
			
//
//	Performing computation on Check nodes	:
		
		checkNodeComputeEngine( pm_p11,  message11,  ext_info11, transverse_info11_12);
		checkNodeComputeEngine( pm_p22,  message22,  ext_info22, transverse_info22_21 );
		
		
		checkNodeComputeEngine( pm_p12,  message12,  ext_info12, transverse_info12_11 );
		checkNodeComputeEngine( pm_p21,  message21,  ext_info21, transverse_info21_22 );



		
//
// Performing transverse correction	:

		transverseCorrection ( pm_p11 , transverse_info12_11 , ext_info11 , aPosteriori1) ; 
		transverseCorrection ( pm_p12 , transverse_info11_12 , ext_info12 , aPosteriori2) ; 
		transverseCorrection ( pm_p21 , transverse_info22_21 , ext_info21 , aPosteriori1) ; 
		transverseCorrection ( pm_p22 , transverse_info21_22 , ext_info22 , aPosteriori2) ; 
		
//
// Performing a posteriori calculation		: (Must done now when all extrinsic information are correct)

		update_aPosteriori ( pm_p11 , ext_info11 , aPosteriori1);
		update_aPosteriori ( pm_p12 , ext_info12 , aPosteriori2);
		
		update_aPosteriori ( pm_p21 , ext_info21 , aPosteriori1);
		update_aPosteriori ( pm_p22 , ext_info22 , aPosteriori2);
				
/*		
		for(int I = 0 ; I < pm_p11->ncols ; I++)
			{
			printf( " aPosteriori1 = %lf \n",aPosteriori1[I]);
			}
			
			for (int I = 0 ; I < pm_p12->ncols ; I++)
			{
			printf( " aPosteriori2 = %lf \n",aPosteriori2[I]);
			}
*/
//

//	Modifing the code block according to a posteriori probabilities 
//	and checking if the new block satisfies all the parity checks.

        uint8_t is_decoded1 = 1 ;
        uint8_t is_decoded2 = 1 ;
        
	
//		checkIsdecoded( pm_p11->ncols, code_block1 , aPosteriori1 , &is_decoded1) ;
//     		checkIsdecoded( pm_p12->ncols, code_block2 , aPosteriori2 , &is_decoded2) ;


	uint16_t I1;
	for( I1 = 0 ; I1 < pm_p11->ncols ; I1++)
		{
 
//	 iterating through all code bits	:
		if ( aPosteriori1[I1] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block1[I1] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded1 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block1[I1] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori1[I1] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block1[I1] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded1 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block1[I1] = 1.0;			// modifies the code bit.
			}
		}
 
 
	uint16_t I2;
	for( I2 = 0 ; I2 < pm_p12->ncols ; I2++)
		{
 
//	 iterating through all code bits	:
		if ( aPosteriori2[I2] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block2[I2] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded2 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block2[I2] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori2[I2] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block2[I2] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded2 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block2[I2] = 1.0;			// modifies the code bit.
			}
		}
 
    
		if ((is_decoded1 == 1)&&(is_decoded2 == 1))
			{
			// decoding stops.
			break;
			}
		else 
			{
			// else we have to update information on Bit Node side.
			updateMessage( pm_p11 , ext_info11 ,aPosteriori1 , message11 );
			updateMessage( pm_p12 , ext_info12 ,aPosteriori2 , message12 );
			updateMessage( pm_p21 , ext_info21 ,aPosteriori1 , message21 );
			updateMessage( pm_p22 , ext_info22 ,aPosteriori2 , message22 );
			}	
									
		nitr++ ;
		}  // end while
#ifdef SW
	fprintf(stderr," number of iteration required = %d \n",(nitr-1)) ;
#endif
	
#ifdef SW
	int I;
	for(I = 0; I< (pm11.ncols); I++)
		{
		fprintf(stderr,"code_block1[%d] = %f" , I,code_block1[I]);
		fprintf(stderr,"code_block2[%d] = %f" , I,code_block2[I]);
		}
#endif
		
}

