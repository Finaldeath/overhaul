//::///////////////////////////////////////////////
//:: Dwarf Looting Trigger
//:: q2b06_trg_dwarf
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When someone uses the barrel, start the conversation
    which will Allow the PCs to blow it up.
    Custom token 2100 will be how much Ale the PC is carrying
    Custom token 2101 will be how much Fairy Dust the PC is carrying
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 23, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{

    object oPC = GetLastUsedBy();

    int nAleAmount = GetNumItems(oPC , "q2b03Ale");
    SetCustomToken(2100,IntToString(nAleAmount));
    int nDustAmount = GetNumItems(oPC , "q2b03FairyDust");
    SetCustomToken(2101,IntToString(nDustAmount));
    ActionStartConversation(oPC);
}
