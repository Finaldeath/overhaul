// determines whether talked to master jumper

#include "q5_inc_plot"

int StartingConditional()
{
    return GetPlot("jt_q5blocked") >= 10;
}
