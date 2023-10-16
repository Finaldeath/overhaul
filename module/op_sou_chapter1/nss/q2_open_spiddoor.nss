//::///////////////////////////////////////////////
//:: Name q2_open_spiddoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On open of the spider door, ranges/druids/barbs
    get a message
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 13/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastOpenedBy();
    if (GetLevelByClass(CLASS_TYPE_RANGER, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_DRUID, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC ) > 0)
    {
        if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);

            SpeakOneLinerConversation();
        }
    }
}
