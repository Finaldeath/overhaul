// Zidan starting conditional: After returned safely to camp.
#include "x1_inc_plot"

int StartingConditional()
{
    return (GetTag(GetArea(OBJECT_SELF)) == "q1_AnaurochNightCamp");
    //return GetPlot("Q1_JOURNAL_MISSING_GUIDE") == 100;
}
