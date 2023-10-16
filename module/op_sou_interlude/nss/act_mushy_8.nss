//Set that PC spoke to Mushy and agreed to get wine

#include "x1_inc_plot"

void main()
{
    SetLocalInt(GetModule(),"q5a_Musharak_Wine",2);
    SetPlot("Q5_MUSHARAK_WINE", 10, GetPCSpeaker());
}
