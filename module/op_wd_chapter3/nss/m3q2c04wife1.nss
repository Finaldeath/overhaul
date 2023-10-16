//::///////////////////////////////////////////////
//:: Follow Player
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Bret's wife follows player to edge of map
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (!IsInConversation(OBJECT_SELF))
    {
        if (GetLocalInt(OBJECT_SELF,"NW_G_M3Q00TALKFOLLOWPC") == 1)
        {
            // * put it here because it didn't seem to do anything
            // * when she called it through her dialog
            if(GetLocalInt(OBJECT_SELF,"NW_G_CHARLOTTE")==0)
            {
                SetEncounterActive(TRUE, GetObjectByTag("M3Q2C02WIFEAMBUS"));
                SetLocalInt(OBJECT_SELF,"NW_G_CHARLOTTE",1);
            }
            object oPC = GetLocalObject(GetModule(),"M3Q00OBRETFAMILY");
            ActionForceMoveToObject(oPC,TRUE, 4.5, 6.0);
        }
    }
}
