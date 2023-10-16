//Give PC idol and set that mushy converted for wine.

#include "x1_inc_plot"

void main()
{
    CreateItemOnObject("q5b_idol",GetPCSpeaker());
    SetLocalInt(GetModule(),"q5a_Musharak_Wine",6);
    GiveGoldToCreature(GetPCSpeaker(),2000);
    SetLocalInt(GetPCSpeaker(),"q5a_Jasmeena_Status",6);
    SetPlot("Q5_MUSHARAK_WINE", 30, GetPCSpeaker());
}
