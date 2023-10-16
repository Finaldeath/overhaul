//::///////////////////////////////////////////////
//:: User Defined
//:: M2Q3Shara_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shara will start conversations warning the
    PC to explain themselves.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 23, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 300:
            if (GetLocalInt(OBJECT_SELF,"NW_L_Warning") < 3)
            {
                ActionStartConversation(OBJECT_SELF);
            }
        break;
    }
}
