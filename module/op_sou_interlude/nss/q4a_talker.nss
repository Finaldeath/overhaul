// Heurodis inits dialog with player

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

    object oHeurodis = GetNearestObjectByTag("Q4A_HOODED_FIGURE");
    AssignCommand(oHeurodis, Talk(oPC));

}
