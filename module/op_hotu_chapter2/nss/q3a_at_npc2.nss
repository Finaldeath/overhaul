// Set journal for info about the priests

#include "x2c2_inc_plot"

void main()
{
    int nPlot = GetPlot("q3_dracolich");
    if(nPlot == 7) // know about the ceremony
        SetPlot("q3_dracolich", 9); // set plot as player knowing both about the temple AND ceremony
    else
        SetPlot("q3_dracolich", 5); // set plot as player knowing only about the temple
}
