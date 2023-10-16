//::///////////////////////////////////////////////
//:: User Defined
//:: m2q1Peren_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren will talk at six second intervals and
    plead for help.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 200:
            if (GetLocalInt(OBJECT_SELF,"NW_L_Heal") == 10 || GetLocalInt(OBJECT_SELF,"NW_L_Heal") == 30)
            {
                SetLocalInt(OBJECT_SELF,"NW_L_Heal",GetLocalInt(OBJECT_SELF,"NW_L_Heal") + 10);
                ActionStartConversation(OBJECT_SELF);
            }
        break;
    }
}
