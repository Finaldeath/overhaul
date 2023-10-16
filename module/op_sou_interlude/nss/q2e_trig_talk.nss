// inits dialog with Kel-Garas

#include "nw_i0_plot"

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oKelGaras = GetNearestObjectByTag("Q2_KELGARAS2");
    AssignCommand(oKelGaras, Talk(oPC));
}
