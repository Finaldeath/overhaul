#include "NW_I0_PLOT"

void main()
{
    object oWP = GetWaypointByTag("NW_EXIT");
    if (GetLocalInt(OBJECT_SELF, "I_AM_LEAVING") == 0)
    {
        SetLocalInt(OBJECT_SELF, "I_AM_LEAVING", 1);
        GiveXPToCreature(GetPCSpeaker(),50);
    }
    ActionDoCommand(SetFacing(GetFacing(GetPCSpeaker())));
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 0.7);
    ActionWait(2.0);
    ActionForceMoveToObject(oWP, TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
