// Set journal for info about the ceremony

#include "x2c2_inc_plot"

void main()
{
    int nPlot = GetPlot("q3_dracolich");
    if(nPlot == 5) // know about the temple
        SetPlot("q3_dracolich", 9); // set plot as player knowing both about the temple AND ceremony
    else
        SetPlot("q3_dracolich", 7); // set plot as player knowing only about the ceremony
}
