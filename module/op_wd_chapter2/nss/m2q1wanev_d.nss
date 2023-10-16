//::///////////////////////////////////////////////
//:: User Defined
//:: M2Q1Wanev_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

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
        case 300:
            if (GetLocalInt(GetModule(),"NW_G_StoleFromWanev") == 10)
            {
                ActionStartConversation(OBJECT_SELF);
            }
        break;
    }
}
