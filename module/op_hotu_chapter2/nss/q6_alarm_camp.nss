// if the drow guard is entering the trigger - then alarm the camp

#include "nw_i0_generic"

void main()
{
    object oEnter = GetEnteringObject();
    if(GetTag(oEnter) == "q6_DrowGuard")
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        int i = 1;
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
        float fDistance;
        while(oCreature != OBJECT_INVALID)
        {
            if(GetStringLeft(GetTag(oCreature), 7) == "q6_Drow" ||
               GetStringLeft(GetTag(oCreature),  5) == "q6_RS" ||
               GetTag(oCreature) == "q6_sabal1")
            {
                fDistance = GetDistanceBetween(OBJECT_SELF, oCreature);
                if(fDistance <= 40.0 && !GetIsInCombat(oCreature))
                    SignalEvent(oCreature, EventUserDefined(101));
            }
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
        }

    }
}
