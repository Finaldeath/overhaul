// the PC gets the bottle of wine and is branded a thief

#include "x1_inc_plot"

void main()
{
    CreateItemOnObject("q5b_bottle", GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), "X1_HPSPOKE", 20);
    if(GetPlot("Q5_MUSHARAK_WINE") > 0)
    {
        SetPlot("Q5_MUSHARAK_WINE", 90, GetPCSpeaker());
    }
}
