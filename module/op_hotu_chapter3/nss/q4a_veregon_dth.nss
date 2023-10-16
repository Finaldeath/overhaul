
//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q4a_veregon_dth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will set quest variables and
     journal entries when Veregon is killed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
       object oKiller = GetLastKiller();
       object oFaction = GetFirstFactionMember(oKiller, TRUE);

       // Set the int on each party member.
       while(oFaction != OBJECT_INVALID) {
          SetLocalInt(oKiller, "mine_boss", 1);
          oFaction = GetNextFactionMember(oKiller);
       }
       AddJournalQuestEntry("q4a_shadow_j", 20, oKiller, TRUE);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}
