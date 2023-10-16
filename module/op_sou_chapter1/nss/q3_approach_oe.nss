// chief inits dialog with player
#include "q3_inc_plot"
void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    if (GetLocalInt(GetModule(), "Q3_GNOLL_STATUS") > GNOLL_STATUS_INIT)
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE", 1);

    object oChief = GetNearestObjectByTag("Q3_CHIEF_GISHNAK");
    if(oChief == OBJECT_INVALID || GetIsInCombat(oChief))
        return;

    AssignCommand(oChief, Talk(oPC));

}
