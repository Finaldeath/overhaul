// queen inits dialog with player

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


    object oQueen = GetNearestObjectByTag("X0_FORM_QUEEN");

    if(GetIsInCombat(oQueen) || GetIsEnemy(oPC, oQueen))
        return;

    AssignCommand(oQueen, Talk(oPC));
}
