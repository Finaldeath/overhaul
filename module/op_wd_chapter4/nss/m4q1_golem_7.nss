//::///////////////////////////////////////////////
//:: M3Q1_GOLEM_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed
    Sets the monster not to be destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: April 22, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    SetIsDestroyable(FALSE,FALSE,FALSE);
    if (GetIsPC(GetLastKiller()))
    {
        int nGolem = GetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED");
        SetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED",nGolem+1);
        if(GetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED") >= 2)
        {
            AddJournalQuestEntry("M4Q01_SIEGE",15,GetLastKiller());
            if (GetLocalInt(GetModule(),"NW_G_M4Q01_CATAPULTS")>=3)
            {
                AddJournalQuestEntry("M4Q01_SIEGE",35,GetLastKiller());
            }
        }
    }
}
