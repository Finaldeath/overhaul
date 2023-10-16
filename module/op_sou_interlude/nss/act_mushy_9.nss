//Set that PC spoke to Mushy and he will share profits, no wine

#include "x1_inc_plot"

void main()
{
    SetLocalInt(GetModule(),"q5a_Musharak_Wine",5);
    SetPlot("Q5_MUSHARAK_WINE", 60, GetPCSpeaker());
}

