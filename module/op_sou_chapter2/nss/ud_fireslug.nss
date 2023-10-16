//::///////////////////////////////////////////////
//:: Burning Man (UserDefined)
//:: UD_FireSlug.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Burning Man's one-liner. The one-
     liner triggers the fire.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 11, 2003
//:://////////////////////////////////////////////

void main()
{
    //Say a one-liner.
    ClearAllActions();
    ActionStartConversation(OBJECT_SELF, "", FALSE, FALSE);

    //Fire my UD Event again in 6-18 seonds
    float fDelay = IntToFloat(Random(12)+6);
    DelayCommand(fDelay, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
}
