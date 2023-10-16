//:://////////////////////////////////////////////////
//:: q1a3_hb_riisi
/*
    Riisi - Drogan's familiar - is in the lab (cellar)
    of drogan's house.,  He will flit about and talk
    to any PCs that try to cross the wards.
    The first PC to answer some riddles of his will
    be rewarded with some minor equipment..

 */
//:://////////////////////////////////////////////////
//::
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
    {
        //SpeakString("PCVar: " + IntToString(GetLocalInt(OBJECT_SELF, "nWantTalkToPC")));
        if (GetLocalInt(OBJECT_SELF, "nWantTalkToPC") != 1)
        {
            if (Random(2) + 1 == 2 && IsInConversation(OBJECT_SELF) == FALSE)
            {
                switch (Random(4) + 1)
                {
                    case 1: SpeakStringByStrRef(40370);
                            break;
                    case 2: SpeakStringByStrRef(40371);
                            break;
                    case 3: SpeakStringByStrRef(40372);
                            break;
                    case 4: SpeakStringByStrRef(40373);
                            break;
                }
            }
            if (IsInConversation(OBJECT_SELF) == FALSE)
            {
                //Move to the Next Waypoint
                ActionMoveToObject(GetObjectByTag("wp_riisi_0" + IntToString(Random(2) + 1)));

            }
        }
        else
        {
            if (IsInConversation(OBJECT_SELF) == FALSE)
            {
                DelayCommand(1.0, ActionStartConversation(GetLocalObject(OBJECT_SELF, "oPCToTalkTo")));
            }
        }
    }
}

