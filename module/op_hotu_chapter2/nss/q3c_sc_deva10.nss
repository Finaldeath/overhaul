// Deva spoken to at rebel camp before siege

#include "x2_inc_globals"
#include "x2c2_inc_plot"


int StartingConditional()
{
    int iResult;

    iResult =  GetPlot("q3_deva")== 99;
    return iResult;
}
