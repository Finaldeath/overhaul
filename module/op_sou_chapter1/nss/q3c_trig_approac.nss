// bring warriors around J'Nah
#include "nw_i0_plot"
void Walk(object oObject)
{
    if(GetIsInCombat(oObject))
        return;
    string sWPTag = "Q3C_WP_" + GetTag(oObject);
    object oWP = GetWaypointByTag(sWPTag);
    AssignCommand(oObject ,ClearAllActions());
    AssignCommand(oObject, ActionMoveToObject(oWP));
}

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == FALSE)
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oWarrior1 = GetNearestObjectByTag("Q3_DAEMONFEY1");
    object oWarrior2 = GetNearestObjectByTag("Q3_DAEMONFEY2");
    object oWarrior3 = GetNearestObjectByTag("Q3_DAEMONFEY3");
    object oWarrior4 = GetNearestObjectByTag("Q3_DAEMONFEY4");

    Walk(oWarrior1);
    Walk(oWarrior2);
    Walk(oWarrior3);
    Walk(oWarrior4);
}
