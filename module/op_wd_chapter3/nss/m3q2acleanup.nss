//::///////////////////////////////////////////////
//:: M3Q2ACleanUp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Page walks around, relighting braziers, cleaning up things
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oBrazier = GetObjectByTag("M3Q2OnBrazier", 0);
    int i = 0;
    if (GetLocalInt(OBJECT_SELF, "NW_L_IAMBUSY") == 1)
      return;

    while (GetIsObjectValid(oBrazier) == TRUE)
    {
        // * if Brazier is turned off then shut it off
        if (GetLocalInt(oBrazier,"NW_L_AMION") == 0)
        {
            SpeakOneLinerConversation();
            // * I am busy; do not run the heartbeat until I am no longer busy
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_L_IAMBUSY",1));
            ActionInteractObject(oBrazier);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_L_IAMBUSY",0));
        }
        i++;
        oBrazier = GetObjectByTag("M3Q2OnBrazier", i);
    }
}
