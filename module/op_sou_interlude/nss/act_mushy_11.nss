//Set that PC spoke to Mushy and he will share profits, with wine

#include "x1_inc_plot"

void main()
{
    SetLocalInt(GetModule(),"q5a_Musharak_Wine",4);
    GiveGoldToCreature(GetPCSpeaker(),2000);
    SetLocalInt(GetPCSpeaker(),"q5a_Jasmeena_Status",6);
    SetPlot("Q5_MUSHARAK_WINE", 50, GetPCSpeaker());
}
