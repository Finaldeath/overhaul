// part of the portcullis trap:
// find each kobold that belongs to this trigger, and send him to him wp to attack the pc.

#include "nw_i0_generic"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // send the kobolds
    {
        int n = 1;
        object oWP = GetLocalObject(OBJECT_SELF, "Q5_WP_TARGET");
        object oPC = GetLocalObject(OBJECT_SELF, "Q5_PC_TARGET");
        object oKobold = GetNearestObjectByTag("Q5_KOBOLD", OBJECT_SELF, n);
        while(oKobold != OBJECT_INVALID)
        {
            n++;
            object oBelong = GetLocalObject(oKobold, "Q5_BELONG_TO_TRIGGER");
            if(oBelong == OBJECT_SELF)
            {
                SetLocalInt(oKobold, "Q5_CANCEL_MOBILE_ANIMATION", 1);
                AssignCommand(oKobold, ClearAllActions());
                AssignCommand(oKobold, ActionMoveToObject(oWP, TRUE));
                AssignCommand(oKobold, ActionDoCommand(DetermineCombatRound(oPC)));

            }
            oKobold = GetNearestObjectByTag("Q5_KOBOLD", OBJECT_SELF, n);
        }
    }
}
